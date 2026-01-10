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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();
        final herzList = await jsonService.getHerzAlmoujahidin();
        final mappedList = herzList
            .map((e) => {
                  'id': e.id,
                  'title': e.title,
                  'route': herzAlmoujahidinAllRoutes
                      .herzAlmoujahidinRoutes[e.id - 1],
                })
            .toList();

        // تمرير البيانات إلى مزود البحث
        searchProvider.setItems(mappedList);
      },
    );
    context.read<HerzAlmoujahidinCubit>().getHerzAlmoujahidin();
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
