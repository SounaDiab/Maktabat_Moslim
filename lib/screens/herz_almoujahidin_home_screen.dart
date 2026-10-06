import '../Util/app_imports.dart';

class HerzAlmoujahidinHomeScreen extends StatefulWidget {
  static String screenRoute = 'home_screen';
  const HerzAlmoujahidinHomeScreen({super.key});

  @override
  State<HerzAlmoujahidinHomeScreen> createState() =>
      _HerzAlmoujahidinHomeScreenState();
}

class _HerzAlmoujahidinHomeScreenState
    extends State<HerzAlmoujahidinHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  static const String _scrollKey = 'herz_scroll_offset';
  @override
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
        final Map<String, List<String>> herzAlmojahidinSectionRoutes = {
          'حرز الرسول ص والائمة (ع)':
              herzAlmoujahidinAllRoutes.herzAlrasoulWal2a2imaRoutes,
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
        final herzList = await jsonService.getHerzAlmoujahidin();

        final List<Map<String, dynamic>> mappedList = [];

        for (final section in herzList) {
          // البحث عن routes الخاصة بهذا القسم
          final mainRoutes = herzAlmoujahidinAllRoutes.herzAlmoujahidinRoutes;
          final mainSections = [
            'اية الكرسي',
            'الكافرون',
            'الاخلاص',
            'الفلق',
            'الناس',
            'ايات الاستكفاء التسع',
            'دعاء اخضاع رقاب الجبابرة',
            'دعاء لدفع كيد العدو وشره',
            'حرز مستخرج من كتاب الله',
            'الهياكل السبع',
            'رقعة الجيب للامام الرضا عليه السلام',
            'عوذة يتعوذ بها على الاعداء',
            'دعاء للخلاص من القتل',
            'حرز لاتقاء سلاح العدو',
            'ايات الحفظ من سيف العدو',
            'حرز الامام الجواد عليه السلام',
            'عوذة النبي ص يوم وادي القرى',
            'ايات الاختفاء من العدو',
            'دعاء للاحتجاب عن بصر الاعداء',
            'دعاء الاحتجاب',
            'حرز التاج',
            'حرز الرسول ص والائمة (ع)',
            'دعاء ناد علياً مظهر العجائب',
          ];
          final routes = herzAlmojahidinSectionRoutes.entries
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
    context.read<HerzAlmoujahidinCubit>().getHerzAlmoujahidin();
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
    Navigator.of(context).pushReplacementNamed(Books.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 70,
          centerTitle: true,
          title: Text(
            'حرز المجاهدين',
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
                final searchProvider =
                    Provider.of<SearchProvider>(context, listen: false);
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
        body: BlocBuilder<HerzAlmoujahidinCubit, HerzAlmoujahidinState>(
          builder: (context, state) {
            if (state is HerzAlmoujahidinLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HerzAlmoujahidinLoaded) {
              // ✅ استعادة الموضع بعد البناء
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _restoreScrollPosition();
              });
              final herzAlmoujahidin = state.items;
              final allTitles = <Map<String, dynamic>>[];

              for (var item in herzAlmoujahidin) {
                allTitles.add({
                  'title': item.title,
                  'route': herzAlmoujahidinAllRoutes.herzAlmoujahidinRoutes
                      .map((e) => e)
                      .toList()[item.id - 1],
                });
              }
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: isTablet ? 20 : 10),
                  child: ListView.builder(
                    key: PageStorageKey(
                        'mjahidin_list'), // ✅ يحفظ موضع الـ scroll تلقائياً
                    controller: _scrollController, // ✅ أضف هذا
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
                          showIcon: title == 'حرز الرسول ص والائمة (ع)'
                              ? true
                              : false,
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is HerzAlmoujahidinError) {
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
