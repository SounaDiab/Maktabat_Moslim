import '../Util/app_imports.dart';

class Al7akibaAlramadaneyaHomeScreen extends StatefulWidget {
  static String screenRoute = 'al7akiba_alramadaneya_home_screen';
  const Al7akibaAlramadaneyaHomeScreen({super.key});

  @override
  State<Al7akibaAlramadaneyaHomeScreen> createState() =>
      _Al7akibaAlramadaneyaHomeScreenState();
}

class _Al7akibaAlramadaneyaHomeScreenState
    extends State<Al7akibaAlramadaneyaHomeScreen> {
  @override
  void initState() {
    super.initState();
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

        // تمرير البيانات إلى مزود البحث
        searchProvider.setItems(mappedList);
      },
    );
    context.read<AlhakibaAlramadaneyaCubit>().getAlhakibaAlramadaneya();
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
            'الحقيبة الرمضانية',
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
        body: BlocBuilder<AlhakibaAlramadaneyaCubit, AlhakibaAlramadaneyaState>(
          builder: (context, state) {
            if (state is AlhakibaAlramadaneyaLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlhakibaAlramadaneyaLoaded) {
              final alhakibaAlramadaneya = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in alhakibaAlramadaneya) {
                allTitles.add({
                  'title': item.title,
                  'route': alhakibaAlramadaneyaAllRoutes
                      .alhakibaAlramadaneyaRoutes
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
