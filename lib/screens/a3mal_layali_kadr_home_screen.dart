// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../Util/app_imports.dart';

class A3malLayaliKadrHomeScreen extends StatefulWidget {
  static String screenRoute = 'a3mal_layali_kadr_home_screen';
  const A3malLayaliKadrHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<A3malLayaliKadrHomeScreen> createState() =>
      _A3malLayaliKadrHomeScreenState();
}

class _A3malLayaliKadrHomeScreenState extends State<A3malLayaliKadrHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final Map<String, List<String>> a3malLayaliKaderSectionRoutes = {
          'السور القرآنية المباركة التي تستحب قرائتها في ليلة القدر':
              a3malLayaliKaderAllRoutes.alSowarAlKor2aneyaRoutes,
          'اعمال ليلة القدر': a3malLayaliKaderAllRoutes.a3malLaylatKaderRoutes,
          'الاعمال العامة في ليلة القدر':
              a3malLayaliKaderAllRoutes.al2a3malAl3amaRoutes,
          'الاعمال الخاصة بليالي القدر':
              a3malLayaliKaderAllRoutes.al2a3malAl5asaRoutes,
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
        final herzList = await jsonService.getA3malLaylatAlkader();

        final List<Map<String, dynamic>> mappedList = [];

        for (final section in herzList) {
          // البحث عن routes الخاصة بهذا القسم
          final mainRoutes = a3malLayaliKaderAllRoutes.a3malLayaliKaderRoutes;
          final mainSections = [
            'السور القرآنية المباركة التي تستحب قرائتها في ليلة القدر',
            'اعمال ليلة القدر',
            'الاعمال العامة في ليلة القدر',
            'الاعمال الخاصة بليالي القدر',
          ];
          final routes = a3malLayaliKaderSectionRoutes.entries
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
    context.read<A3malLaylatAlkaderCubit>().getA3malLaylatAlkader();
  }

  Future<bool> _onWillPop() async {
    final searchProviders = Provider.of<SearchProvider>(context, listen: false);
    searchProviders.clearSearch();
    Navigator.of(context).pushReplacementNamed(Books.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final searchProviders = Provider.of<SearchProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 70,
          centerTitle: true,
          title: Text(
            'اعمال ليالي القدر',
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
                  delegate: DataSearch(searchProviders.filteredItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<A3malLaylatAlkaderCubit, A3malLaylatAlkaderState>(
          builder: (context, state) {
            if (state is A3malLaylatAlkaderLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is A3malLaylatAlkaderLoaded) {
              final a3malLaylatAlkader = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in a3malLaylatAlkader) {
                allTitles.add({
                  'title': item.title,
                  'route': a3malLayaliKaderAllRoutes.a3malLayaliKaderRoutes
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
            } else if (state is A3malLaylatAlkaderError) {
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
