import '../../Util/app_imports.dart';

class Ad3iyatAl2osbo3 extends StatefulWidget {
  static String screenRoute = 'ad3iyat_al2osbou3_screen';
  Ad3iyatAl2osbo3({super.key});

  @override
  State<Ad3iyatAl2osbo3> createState() => _Ad3iyatAl2osbo3State();
}

class _Ad3iyatAl2osbo3State extends State<Ad3iyatAl2osbo3> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();

        final mafatihList = await jsonService.getMafatihAljinan();

        final mafatihSection = mafatihList.firstWhere(
          (item) => item.title.contains('ادعية ايام الاسبوع'),
          orElse: () => throw Exception('لم يتم العثور على ادعية ايام الاسبوع'),
        );

        // نتأكد أن فيه فهرس داخلي (index أو subSections)
        final List<Map<String, dynamic>> mappedList = [];

        if (mafatihSection.index.isNotEmpty) {
          for (var sub in mafatihSection.index) {
            mappedList.add({
              'id': sub.id,
              'title': sub.title,
              'route': mafati7AljinanAllRoutes
                  .ad3iyatAyamAl2ousnbou3Routes[sub.id - 1],
            });
          }
        }
        // تمرير الفهرس إلى SearchProvider
        searchProvider.setItems(mappedList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(MafatihAljinanHomeScreen.screenRoute);
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
            'ادعية ايام الاسبوع',
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
        body: BlocBuilder<MafatihAljinanCubit, MafatihAljinanState>(
          builder: (context, state) {
            if (state is MafatihAljinanLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MafatihAljinanLoaded) {
              final mafatihAljinan = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in mafatihAljinan) {
                if (item.title == 'ادعية ايام الاسبوع') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': mafati7AljinanAllRoutes
                          .ad3iyatAyamAl2ousnbou3Routes
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
            } else if (state is MafatihAljinanError) {
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
