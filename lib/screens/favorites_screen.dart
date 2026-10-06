import '../Util/app_imports.dart';

class FavoritesScreen extends StatefulWidget {
  static String screenRoute = 'favorite_screen';
  final List<Map<String, String>> favoritePages;

  FavoritesScreen({Key? key, required this.favoritePages}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ScrollController _scrollController = ScrollController();
  static const String _scrollKey = 'favorites_scroll_offset';
  @override
  void initState() {
    super.initState();
    // ✅ تتبع موضع الـ scroll باستمرار
    _scrollController.addListener(() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_scrollKey, _scrollController.offset);
    });
    Provider.of<FavoritesProvider>(context, listen: false).loadFavorites();
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
    Navigator.of(context)
        .pushReplacement(CustomPageRoute(page: WelcomeScreen()));
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
          leading: IconButton(
            onPressed: _onWillPop,
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 50 : 25,
            ),
          ),
          title: Text(
            'المفضلة',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
            ),
          ),
        ),
        body: Consumer<FavoritesProvider>(
          builder: (context, favoritesProvider, child) {
            // ✅ استعادة الموضع بعد البناء
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _restoreScrollPosition();
            });
            final favorites = favoritesProvider.favorites;

            return favorites.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد عناصر مفضلة بعد',
                      style: TextStyle(
                        fontSize: isTablet ? 40 : 19,
                        fontFamily: 'DiodrumArabic',
                      ),
                    ),
                  )
                : ListView.builder(
                    key: PageStorageKey(
                        'mjahidin_list'), // ✅ يحفظ موضع الـ scroll تلقائياً
                    controller: _scrollController,
                    padding: EdgeInsets.all(20),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      // ابحث عن اسم الصفحة والمسار في الـ favorites
                      final favorite = favorites[index];
                      // /////////////
                      return Column(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.pushNamed(
                                context, favorite['route']!,
                                arguments: {'previousPage': 'favorite_screen'}),
                            child: Card(
                              elevation: 3,
                              shadowColor: Theme.of(context).shadowColor,
                              color: Theme.of(context).cardColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: SvgPicture.asset(
                                          'assets/icons/douaa.svg',
                                          // width: 25,
                                          height: 25,
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          favorite[
                                              'title']!, // استخدام قيمة افتراضية إذا كان text null
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () async {
                                          Provider.of<FavoritesProvider>(
                                                  context,
                                                  listen: false)
                                              .removeFavorite(
                                                  favorite['title']!,
                                                  favorite['route']!,
                                                  favorite['route']!);
                                          if (favorite['route']! ==
                                              favorite['route']!) {
                                            final prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            await prefs.setBool(
                                                'isFavorite_${favorite['route']}',
                                                true);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
