import '../../Util/app_imports.dart';

class SalatAllayl extends StatefulWidget {
  static String screenRoute = 'salat_allayl_screen';
  const SalatAllayl({super.key});

  @override
  State<SalatAllayl> createState() => _SalatAllaylState();
}

class _SalatAllaylState extends State<SalatAllayl> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();
        final salatLailList = await jsonService.getSalatLail();
        final mappedList = salatLailList
            .map((e) => {
                  'id': e.id,
                  'title': e.title,
                })
            .toList();

        // تمرير البيانات إلى مزود البحث
        searchProvider.setItems(mappedList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context).pop();
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
            'صلاة الليل',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
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
        body: BlocBuilder<SalatLailCubit, SalatLailState>(
          builder: (context, state) {
            if (state is SalatLailLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SalatLailLoaded) {
              final alhakibaAlramadaneya = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                SawabahaWaFawa2idaha.screenRoute,
                WaktahaWakaifyatiha.screenRoute,
                Dou3aaBa3dSalatAlwater.screenRoute,
                Dou3aa7azin.screenRoute,
                Dou3a2SahmAllail.screenRoute,
              ];
              for (var item in alhakibaAlramadaneya) {
                allTitles.add({
                  'title': item.title,
                  'route': allRoutes.map((e) => e).toList()[item.id - 1],
                });
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
            } else if (state is SalatLailError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: AdBanner(
          adUnitId: 'ca-app-pub-9302649846832207/6324582140',
        ),
      ),
    );
  }
}
