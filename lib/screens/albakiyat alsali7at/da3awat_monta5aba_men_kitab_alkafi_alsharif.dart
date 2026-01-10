import '../../Util/app_imports.dart';

//
class Da3awatMonta5abaMenKitabAlkafiAlsharif extends StatefulWidget {
  static String screenRoute =
      'da3awat_monta5aba_men_kitab_alkafi_alsharif_screen';
  Da3awatMonta5abaMenKitabAlkafiAlsharif({super.key});

  @override
  State<Da3awatMonta5abaMenKitabAlkafiAlsharif> createState() =>
      _Da3awatMonta5abaMenKitabAlkafiAlsharifState();
}

class _Da3awatMonta5abaMenKitabAlkafiAlsharifState
    extends State<Da3awatMonta5abaMenKitabAlkafiAlsharif> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();

        final albakiyatList = await jsonService.getAlbakiyatAlsalihat();

        final albakiyatSection = albakiyatList.firstWhere(
          (item) => item.title.contains('دعوات منتخبة من كتاب الكافي الشريف'),
          orElse: () => throw Exception(
              'لم يتم العثور على دعوات منتخبة من كتاب الكافي الشريف'),
        );

        // نتأكد أن فيه فهرس داخلي (index أو subSections)
        final List<Map<String, dynamic>> mappedList = [];

        if (albakiyatSection.index.isNotEmpty) {
          for (var sub in albakiyatSection.index) {
            mappedList.add({
              'id': sub.id,
              'title': sub.title,
              'route':
                  albakyatAlsali7atAllRoutes.da3awatMonta5abaRoutes[sub.id - 1],
            });
          }
        }
        // تمرير الفهرس إلى SearchProvider
        searchProvider.setItems(mappedList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(AlbakiyatAlsali7atHomeScreen.screenRoute);
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
            'دعوات منتخبة',
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
        body: BlocBuilder<AlbakiyatAlsalihatCubit, AlbakiyatAlsalihatState>(
          builder: (context, state) {
            if (state is AlbakiyatAlsalihatLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlbakiyatAlsalihatLoaded) {
              final albakiyatAlsalihat = state.items;
              final allTitles = <Map<String, dynamic>>[];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'دعوات منتخبة من كتاب الكافي الشريف') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': albakyatAlsali7atAllRoutes.da3awatMonta5abaRoutes
                          .map((e) => e)
                          .toList()[subItem.id - 1],
                    });
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
            } else if (state is AlbakiyatAlsalihatError) {
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
