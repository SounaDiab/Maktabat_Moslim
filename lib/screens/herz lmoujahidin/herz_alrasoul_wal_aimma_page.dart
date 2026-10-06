import '../../Util/app_imports.dart';

class HerzAlrasoulWalAimmaPage extends StatefulWidget {
  static String screenRoute = 'herzalrasoulwalaimma_screen';
  const HerzAlrasoulWalAimmaPage({super.key});

  @override
  State<HerzAlrasoulWalAimmaPage> createState() =>
      _HerzAlrasoulWalAimmaPageState();
}

class _HerzAlrasoulWalAimmaPageState extends State<HerzAlrasoulWalAimmaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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

      // تمرير الفهرس إلى SearchProvider
      searchProvider.setItems(mappedList);
    });
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).textScaleFactor;
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
            'حرز الرسول ص والائمة (ع)',
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
        body: BlocBuilder<HerzAlmoujahidinCubit, HerzAlmoujahidinState>(
          builder: (context, state) {
            if (state is HerzAlmoujahidinLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HerzAlmoujahidinLoaded) {
              final herzAlmoujahidin = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in herzAlmoujahidin) {
                for (var subItem in item.index) {
                  allTitles.add({
                    'title': subItem.title,
                    'route': herzAlmoujahidinAllRoutes
                        .herzAlrasoulWal2a2imaRoutes
                        .map((e) => e)
                        .toList()[subItem.id - 1], // أو أي قيمة route مناسبة
                  });
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
