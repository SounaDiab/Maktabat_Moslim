import '../Util/app_imports.dart';

class AlbakiyatAlsali7atHomeScreen extends StatefulWidget {
  static String screenRoute = 'albakiyat_alsali7at_home_screen';
  const AlbakiyatAlsali7atHomeScreen({super.key});

  @override
  State<AlbakiyatAlsali7atHomeScreen> createState() =>
      _AlbakiyatAlsali7atHomeScreenState();
}

class _AlbakiyatAlsali7atHomeScreenState
    extends State<AlbakiyatAlsali7atHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final Map<String, List<String>> albakiyatAlsalihatSectionRoutes = {
          'نزر من اعمال الليل والنهار':
              albakyatAlsali7atAllRoutes.nozorMenA3malAllaylWalnaharRoutes,
          'ذكر صلوات ايام الاسبوع':
              albakyatAlsali7atAllRoutes.zikrSalawatAyamAl2ousbou3Routes,
          'بعض الصلوات المندوبة':
              albakyatAlsali7atAllRoutes.ba3dAlsalawatAlmandoubaRoutes,
          'الادعية والعوذات للالام والاسقام ولعلل الاعضاء والحمى وغيرها':
              albakyatAlsali7atAllRoutes.alad3yaWal3awzatRoutes,
          'دعوات منتخبة من كتاب الكافي الشريف':
              albakyatAlsali7atAllRoutes.da3awatMonta5abaRoutes,
          'الاحراز والادعية الموجزة':
              albakyatAlsali7atAllRoutes.ala7razWalad3iyaRoutes,
        };
        Map<String, dynamic> buildItem({
          required String title,
          required String route,
        }) {
          return {
            'title': title,
            'route': route,
          };
        }

        final jsonService = JsonService();
        final herzList = await jsonService.getAlbakiyatAlsalihat();

        final List<Map<String, dynamic>> mappedList = [];

        for (final section in herzList) {
          // البحث عن routes الخاصة بهذا القسم
          final mainRoutes = albakyatAlsali7atAllRoutes.albakyatAlsali7atRoutes;
          final mainSections = [
            'نزر من اعمال الليل والنهار',
            'ذكر صلوات ايام الاسبوع',
            'بعض الصلوات المندوبة',
            'الادعية والعوذات للالام والاسقام ولعلل الاعضاء والحمى وغيرها',
            'دعوات منتخبة من كتاب الكافي الشريف',
            'الاحراز والادعية الموجزة',
          ];
          final routes = albakiyatAlsalihatSectionRoutes.entries
              .firstWhere(
                (e) => section.title.contains(e.key),
                orElse: () => const MapEntry('', []),
              )
              .value;

          // التحقق إذا كان القسم الحالي من الأقسام الرئيسية
          int mainIndex =
              mainSections.indexWhere((key) => section.title.contains(key));

          if (mainIndex != -1 && mainIndex < mainRoutes.length) {
            // إضافة القسم الرئيسي مع مساره الصحيح
            mappedList.add(
              buildItem(
                title: section.title,
                route: mainRoutes[mainIndex],
              ),
            );
          } else {
            // للأقسام الأخرى، استخدم المسار الافتراضي
            mappedList.add(
              buildItem(
                title: section.title,
                route: routes.first,
              ),
            );
          }

          // إضافة العناصر الفرعية

          for (int i = 0; i < section.index.length; i++) {
            if (i >= routes.length) break;

            mappedList.add(
              buildItem(
                title: section.index[i].title,
                route: routes[i],
              ),
            );
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
    Navigator.of(context).pushReplacementNamed(Books.screenRoute);
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
            'الباقيات الصالحات',
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
        body: BlocBuilder<AlbakiyatAlsalihatCubit, AlbakiyatAlsalihatState>(
          builder: (context, state) {
            if (state is AlbakiyatAlsalihatLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlbakiyatAlsalihatLoaded) {
              final albakiyatAlsalihat = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in albakiyatAlsalihat) {
                allTitles.add({
                  'title': item.title,
                  'route': albakyatAlsali7atAllRoutes.albakyatAlsali7atRoutes
                      .map((e) => e)
                      .toList()[item.id - 1],
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
            } else if (state is AlbakiyatAlsalihatError) {
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
