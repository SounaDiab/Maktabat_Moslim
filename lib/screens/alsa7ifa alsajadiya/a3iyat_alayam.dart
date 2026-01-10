import '../../Util/app_imports.dart';


class A3iyatAlayam extends StatefulWidget {
  static String screenRoute = 'ad3iyat_alayam_screen';
  const A3iyatAlayam({super.key});

  @override
  State<A3iyatAlayam> createState() => _A3iyatAlayamState();
}

class _A3iyatAlayamState extends State<A3iyatAlayam> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();
        final sa7ifaList = await jsonService.getAlsa7ifaAlsajadiya();
        final sa7ifaSection = sa7ifaList.firstWhere(
          (item) => item.title.contains('ادعية الايام'),
          orElse: () => throw Exception('لم يتم العثور على ادعية الايام'),
        );
        final List<Map<String, dynamic>> mappedList = [];
        if (sa7ifaSection.index.isNotEmpty) {
          for (var sub in sa7ifaSection.index) {
            mappedList.add({
              'id': sub.id,
              'title': sub.title,
              'route':
                  asa7ifaAlsajadeyaAllRoutes.ad3yatAlayamRoutes[sub.id - 1],
            });
          }
        }

        // تمرير البيانات إلى مزود البحث
        searchProvider.setItems(mappedList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(Alsa7ifaAlsajadiyaHomeScreen.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 70,
          centerTitle: true,
          title: Text(
            'ادعية الايام',
            style: TextStyle(
              fontSize: isTablet ? 40 : 16,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: _onWillPop,
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 50 : 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(searchProvider.filteredItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<Alsa7ifaAlsajadiyaCubit, Alsa7ifaAlsajadiyaState>(
          builder: (context, state) {
            if (state is Alsa7ifaAlsajadiyaLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Alsa7ifaAlsajadiyaLoaded) {
              final alsa7ifaAlsajadiya = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in alsa7ifaAlsajadiya) {
                if (item.title == 'ادعية الايام') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': asa7ifaAlsajadeyaAllRoutes.ad3yatAlayamRoutes
                          .map((e) => e)
                          .toList()[subItem.id - 1],
                    });
                  }
                }
              }
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: isTablet ? 20 : 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allTitles.length,
                    itemBuilder: (context, i) {
                      final title = allTitles[i]['title'];
                      final route = allTitles[i]['route'];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 20 : 10,
                          vertical: isTablet ? 6 : 3,
                        ),
                        child: LineFromIndex(
                          text: title,
                          route: route,
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is Alsa7ifaAlsajadiyaError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
