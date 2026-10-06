import '../../Util/app_imports.dart';

class A3malW2ad3iyatLayaliRamadan extends StatefulWidget {
  static String screenRoute = 'a3mal_wa2ad3iyat_layali_ramadan_screen';
  A3malW2ad3iyatLayaliRamadan({super.key});

  @override
  State<A3malW2ad3iyatLayaliRamadan> createState() =>
      _A3malW2ad3iyatLayaliRamadanState();
}

class _A3malW2ad3iyatLayaliRamadanState
    extends State<A3malW2ad3iyatLayaliRamadan> {
      // ✅ أضف هذا
  final ScrollController _scrollController = ScrollController();
  static const String _scrollKey = 'a3mal_wa2ad3iyat_layali_ramadan_scroll_offset';
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
        final Map<String, List<String>> al7akibaAlramadaneyaSectionRoutes = {
          'فيما يعم الليالي والايام':
              alhakibaAlramadaneyaAllRoutes.fimaYa3omAllayaliWal2ayamRoutes,
          'فيما يستحب ايتانه في رمضان':
              alhakibaAlramadaneyaAllRoutes.fimaYostahab2itanohoRoutes,
          'في اعمال اسحار رمضان':
              alhakibaAlramadaneyaAllRoutes.fiA3malAs7arRoutes,
          'اعمال وادعية ايام رمضان':
              alhakibaAlramadaneyaAllRoutes.a3malW2ad3yat2ayamRamadanRoutes,
          'اعمال وادعية ليالي رمضان':
              alhakibaAlramadaneyaAllRoutes.a3malW2ad3yatLayaliRamadanRoutes,
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
        final herzList = await jsonService.getAlhakibaAlramadaneya();

        final List<Map<String, dynamic>> mappedList = [];

        for (final section in herzList) {
          // البحث عن routes الخاصة بهذا القسم
          final mainRoutes =
              alhakibaAlramadaneyaAllRoutes.alhakibaAlramadaneyaRoutes;
          final mainSections = [
            'فيما يعم الليالي والايام',
            'فيما يستحب ايتانه في رمضان',
            'في اعمال اسحار رمضان',
            'اعمال وادعية ايام رمضان',
            'اعمال وادعية ليالي رمضان',
          ];
          final routes = al7akibaAlramadaneyaSectionRoutes.entries
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
    context.read<AlhakibaAlramadaneyaCubit>().getAlhakibaAlramadaneya();
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
        .pushReplacementNamed(Al7akibaAlramadaneyaHomeScreen.screenRoute);
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
            'اعمال وادعية ليالي رمضان',
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
        body: BlocBuilder<AlhakibaAlramadaneyaCubit, AlhakibaAlramadaneyaState>(
          builder: (context, state) {
            if (state is AlhakibaAlramadaneyaLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlhakibaAlramadaneyaLoaded) {
              // ✅ استعادة الموضع بعد البناء
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _restoreScrollPosition();
              });
              final alhakibaAlramadaneya = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in alhakibaAlramadaneya) {
                if (item.title == 'اعمال وادعية ليالي رمضان') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': alhakibaAlramadaneyaAllRoutes
                          .a3malW2ad3yatLayaliRamadanRoutes
                          .map((e) => e)
                          .toList()[subItem.id - 1], // أو أي قيمة route مناسبة
                    });
                  }
                }
              }
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: isTablet ? 20 : 10),
                  child: ListView.builder(
                    key: PageStorageKey(
                        'mafatih_list'), // ✅ يحفظ موضع الـ scroll تلقائياً
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
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is AlhakibaAlramadaneyaError) {
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
