import '../../Util/app_imports.dart';

class Ala7razWalad3iyaAlmoujaza extends StatefulWidget {
  static String screenRoute = 'ala7raz_walad3iya_almoujaza_screen';
  Ala7razWalad3iyaAlmoujaza({super.key});

  @override
  State<Ala7razWalad3iyaAlmoujaza> createState() =>
      _Ala7razWalad3iyaAlmoujazaState();
}

class _Ala7razWalad3iyaAlmoujazaState extends State<Ala7razWalad3iyaAlmoujaza> {
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
          (item) => item.title.contains('الاحراز والادعية الموجزة'),
          orElse: () =>
              throw Exception('لم يتم العثور على الاحراز والادعية الموجزة'),
        );

        // نتأكد أن فيه فهرس داخلي (index أو subSections)
        final List<Map<String, dynamic>> mappedList = [];

        if (albakiyatSection.index.isNotEmpty) {
          for (var sub in albakiyatSection.index) {
            mappedList.add({
              'id': sub.id,
              'title': sub.title,
              'route':
                  albakyatAlsali7atAllRoutes.ala7razWalad3iyaRoutes[sub.id - 1],
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
            'الاحراز والادعية الموجزة',
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
                if (item.title == 'الاحراز والادعية الموجزة') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': albakyatAlsali7atAllRoutes.ala7razWalad3iyaRoutes
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
