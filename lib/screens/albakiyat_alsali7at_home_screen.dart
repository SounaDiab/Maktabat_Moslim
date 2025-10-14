import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../api/web service/json_service.dart';
import '../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../widgets/line_from_index.dart';
import '../widgets/search_widget.dart';
import 'albakiyat alsali7at/al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'albakiyat alsali7at/ala7raz_walad3iya_almoujaza.dart';
import 'albakiyat alsali7at/ba3d_alsalawat_almandouba.dart';
import 'albakiyat alsali7at/da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'albakiyat alsali7at/nozor_men_a3mal_allail_walnahar.dart';
import 'albakiyat alsali7at/zikr_salawat_ayam_al2osbou3.dart';
import 'books.dart';
import 'search_provider.dart';

class AlbakiyatAlsali7atHomeScreen extends StatefulWidget {
  static String screenRoute = 'albakiyat_alsali7at_home_screen';
  const AlbakiyatAlsali7atHomeScreen({super.key});

  @override
  State<AlbakiyatAlsali7atHomeScreen> createState() =>
      _AlbakiyatAlsali7atHomeScreenState();
}

class _AlbakiyatAlsali7atHomeScreenState
    extends State<AlbakiyatAlsali7atHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();
        final albakiyatList = await jsonService.getAlbakiyatAlsalihat();
        final mappedList = albakiyatList
            .map((e) => {
                  'id': e.id,
                  'title': e.title,
                })
            .toList();

        // تمرير البيانات إلى مزود البحث
        searchProvider.setItems(mappedList);
      },
    );
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
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
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
              final allRoutes = [
                NozorMenA3malAllailWalnahar.screenRoute,
                ZikrSalawatAyamAl2osbou3.screenRoute,
                Ba3dAlsalawatAlmandouba.screenRoute,
                Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute,
                Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute,
                Ala7razWalad3iyaAlmoujaza.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                allTitles.add({
                  'title': item.title,
                  'route': allRoutes.map((e) => e).toList()[item.id - 1],
                });
              }
              return SafeArea(
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allTitles.length,
                      itemBuilder: (context, i) {
                        final title = allTitles[i]['title'];
                        final route = allTitles[i]['route'];

                        return ListTile(
                          title: LineFromIndex(
                            text: title,
                            route: route,
                          ),
                        );
                      }),
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
