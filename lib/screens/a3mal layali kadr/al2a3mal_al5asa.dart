import '../../Util/app_imports.dart';

class Al2a3malAl5asa extends StatefulWidget {
  static String screenRoute = 'al2a3mal_al5asa_screen';
  const Al2a3malAl5asa({super.key});

  @override
  State<Al2a3malAl5asa> createState() => _Al2a3malAl5asaState();
}

class _Al2a3malAl5asaState extends State<Al2a3malAl5asa> {
  // ✅ أضف هذا
  final ScrollController _scrollController = ScrollController();
  static const String _scrollKey = 'al2a3mal_al5asa_scroll_offset';
  void initState() {
    super.initState();
    // ✅ تتبع موضع الـ scroll باستمرار
    _scrollController.addListener(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_scrollKey, _scrollController.offset);
    });
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
        // تمرير الفهرس إلى SearchProvider
        searchProvider.setItems(mappedList);
      },
    );
    context.read<A3malLaylatAlkaderCubit>().getA3malLaylatAlkader();
  }

  // ✅ أضف هذا
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ✅ دالة لاستعادة الموضع — استدعها بعد تحميل البيانات
  Future<void> _restoreScrollPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final offset = prefs.getDouble(_scrollKey) ?? 0;
    if (offset > 0 && _scrollController.hasClients) {
      _scrollController.jumpTo(offset);
    }
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(A3malLayaliKadrHomeScreen.screenRoute);
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
            'الاعمال الخاصة',
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
        body: BlocBuilder<A3malLaylatAlkaderCubit, A3malLaylatAlkaderState>(
          builder: (context, state) {
            if (state is A3malLaylatAlkaderLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is A3malLaylatAlkaderLoaded) {
              // ✅ استعادة الموضع بعد البناء
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _restoreScrollPosition();
              });
              final a3malLaylatAlkader = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in a3malLaylatAlkader) {
                if (item.title == "الاعمال الخاصة بليالي القدر") {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': a3malLayaliKaderAllRoutes
                      .al2a3malAl5asaRoutes
                          .map((e) => e)
                          .toList()[subItem.id - 1], // أو أي قيمة route مناسبة
                    });
                  }
                }
              }

              return SafeArea(
                child: Container(
                  child: ListView.builder(
                    key: PageStorageKey(
                        'mafatih_list'), // ✅ يحفظ موضع الـ scroll تلقائياً
                    controller: _scrollController, // ✅ أضف هذا
                    shrinkWrap: true,
                    itemCount: allTitles.length,
                    itemBuilder: (context, i) {
                      // final item = searchProvider.filteredItems[index];
                      final title = allTitles[i]['title'];
                      final route = allTitles[i]['route'];
                      return LineFromIndex(
                        text: title,
                        route: route,
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
