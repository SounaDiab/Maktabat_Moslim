import '../../../Util/app_imports.dart';

class ZiyaratAlrida extends StatefulWidget {
  static String screenRoute = 'ziyarat_alrida_screen';
  ZiyaratAlrida({super.key});

  @override
  State<ZiyaratAlrida> createState() => _ZiyaratAlridaState();
}

class _ZiyaratAlridaState extends State<ZiyaratAlrida> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final Map<String, List<String>> mafatihSectionRoutes = {
          'التعقيبات': mafati7AljinanAllRoutes.ta3kibatRoutes,
          'زيارات ايام الاسبوع':
              mafati7AljinanAllRoutes.ziyaratAyamAl2ousnbou3Routes,
          'ادعية ايام الاسبوع':
              mafati7AljinanAllRoutes.ad3iyatAyamAl2ousnbou3Routes,
          'ليلة الجمعة ونهارها واعمالها':
              mafati7AljinanAllRoutes.lailatAljom3aRoutes,
          'الادعية المشهورة': mafati7AljinanAllRoutes.ad3iyaMashhouraRoutes,
          'المناجاة': mafati7AljinanAllRoutes.almonajatRoutes,
          'اعمال اشهر السنة': mafati7AljinanAllRoutes.a3malAshhorAlsanaRoutes,
          'شهر محرم واعماله': mafati7AljinanAllRoutes.moharamRoutes,
          'شهر رجب واعماله': mafati7AljinanAllRoutes.rajabRoutes,
          'شهر شعبان واعماله': mafati7AljinanAllRoutes.sha3benRoutes,
          'شهر رمضان واعماله': mafati7AljinanAllRoutes.ramadanRoutes,
          'شهر شوال واعماله': mafati7AljinanAllRoutes.shawalRoutes,
          'شهر ذي الحجة واعماله': mafati7AljinanAllRoutes.ziAlhojaRoutes,
          'باقي اعمال اشهر السنة':
              mafati7AljinanAllRoutes.bakiA3malAlsanaRoutes,
          'اعمال المساجد والزيارات':
              mafati7AljinanAllRoutes.A3malAlmasajedRoutes,
          'آداب الزيارة': mafati7AljinanAllRoutes.adabAlziyaratRoutes,
          'زيارة النبي والزهراءوالأئمة (ع)':
              mafati7AljinanAllRoutes.ziyaratAlnabiWakzahraaRoutes,
          'كيفية وفضل زيارة امير المؤمنين':
              mafati7AljinanAllRoutes.ziyaratAmirAlmo2mininRoutes,
          'فضل الكوفة ومسجدها واعماله':
              mafati7AljinanAllRoutes.masjedAlkoufaRoutes,
          'اعمال مسجد السهلة وزيد وصعصعة':
              mafati7AljinanAllRoutes.masjedAlsahlaRoutes,
          'زيارات الحسين (ع) آدابها وفضلها':
              mafati7AljinanAllRoutes.ziyaratAlhusseinRoutes,
          'زيارة الكاظمين والنواب الاربعة (ع)':
              mafati7AljinanAllRoutes.ziyaratAlkaziminRoutes,
          'زيارة الامام الرضا': mafati7AljinanAllRoutes.ziyaratAlridaRoutes,
          'زيارة أئمة سر من رأى (ع) واعمال السرداب':
              mafati7AljinanAllRoutes.ziyarat2a2imatSirRoutes,
          'الزيارات الجامعة والصلوات على الحجج الطاهرين':
              mafati7AljinanAllRoutes.alziyaratAljami3aRoutes,
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
        final mafatihList = await jsonService.getMafatihAljinan();

        final List<Map<String, dynamic>> mappedList = [];

        for (final section in mafatihList) {
          // معالجة خاصة للأقسام الرئيسية الثمانية
          // التعقيبات، زيارات الأسبوع، أدعية الأسبوع، إلخ
          final mainRoutes = mafati7AljinanAllRoutes.mafati7AljinanRoutes;
          final mainSections = [
            'التعقيبات',
            'زيارات ايام الاسبوع',
            'ادعية ايام الاسبوع',
            'ليلة الجمعة ونهارها واعمالها',
            'الادعية المشهورة',
            'المناجاة',
            'اعمال اشهر السنة',
            'اعمال المساجد والزيارات',
          ];
          final routes = mafatihSectionRoutes.entries
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

          // البحث عن routes الفرعية الخاصة بهذا القسم

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

          // معالجة الأقسام الفرعية العميقة
          for (final sup in section.index) {
            final subRoutes = mafatihSectionRoutes.entries
                .firstWhere(
                  (e) => sup.title.contains(e.key),
                  orElse: () => const MapEntry('', []),
                )
                .value;

            for (int i = 0; i < sup.index.length; i++) {
              if (i >= subRoutes.length) break;

              mappedList.add(
                buildItem(
                  title: sup.index[i].title,
                  route: subRoutes[i],
                ),
              );
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
    Navigator.of(context)
        .pushReplacementNamed(A3malAlmasajedWalziyarat.screenRoute);
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
            'زيارة الامام الرضا',
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
                if (item.title == 'اعمال المساجد والزيارات') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'زيارة الامام الرضا') {
                      for (var inSubItem in subItem.index) {
                        allTitles.add({
                          'title': inSubItem.title,
                          'route': mafati7AljinanAllRoutes.ziyaratAlridaRoutes
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
