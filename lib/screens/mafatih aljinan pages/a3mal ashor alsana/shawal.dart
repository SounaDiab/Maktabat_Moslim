import '../../../Util/app_imports.dart';


class Shawal extends StatefulWidget {
  static String screenRoute = 'shawal_screen';
  Shawal({super.key});

  @override
  State<Shawal> createState() => _ShawalState();
}

class _ShawalState extends State<Shawal> {
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
          (item) => item.title.contains('اعمال اشهر السنة'),
          orElse: () => throw Exception('لم يتم العثور على اعمال اشهر السنة'),
        );

        // قائمة المستوى الثالث
        final List<Map<String, dynamic>> mappedList = [];

        if (mafatihSection.index.isNotEmpty) {
          for (var sub in mafatihSection.index) {
            // الآن نتحقق من وجود index داخلي (المستوى الثالث)
            if (sub.index.isNotEmpty) {
              if (sub.title == "شهر شوال واعماله") {
                for (var subSub in sub.index) {
                  mappedList.add({
                    'id': subSub.id,
                    'title': subSub.title,
                    'route':
                        mafati7AljinanAllRoutes.shawalRoutes[subSub.id - 1],
                  });
                }
              }
            }
          }
        }

        // تمرير بيانات المستوى الثالث إلى SearchProvider
        searchProvider.setItems(mappedList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context).pushReplacementNamed(A3malAshhorAlsana.screenRoute);
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
            'شهر شوال واعماله',
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
                if (item.title == 'اعمال اشهر السنة') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'شهر شوال واعماله') {
                      for (var inSubItem in subItem.index) {
                        allTitles.add({
                          'title': inSubItem.title,
                          'route': mafati7AljinanAllRoutes.shawalRoutes
                              .map((e) => e)
                              .toList()[inSubItem.id - 1],
                        });
                      }
                    }
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
