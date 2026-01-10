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
      final jsonService = JsonService();

      // تحميل كل بيانات حرز المجاهدين من الملف المضغوط
      final herzList = await jsonService.getHerzAlmoujahidin();

      // نبحث عن القسم الذي عنوانه "حرز الرسول ص والائمة ع"
      final rasoulSection = herzList.firstWhere(
        (item) => item.title.contains('حرز الرسول'),
        orElse: () =>
            throw Exception('لم يتم العثور على حرز الرسول ص والائمة ع'),
      );

      // نتأكد أن فيه فهرس داخلي (index أو subSections)
      final List<Map<String, dynamic>> mappedList = [];

      if (rasoulSection.index.isNotEmpty) {
        for (var sub in rasoulSection.index) {
          mappedList.add({
            'id': sub.id,
            'title': sub.title,
            'route': herzAlmoujahidinAllRoutes
                .herzAlrasoulWal2a2imaRoutes[sub.id - 1],
          });
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
