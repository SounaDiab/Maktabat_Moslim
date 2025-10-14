import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/dou3a2_al2i7tijab_amir_almo2minin.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_ad3iya_ma2soura_lilrizk.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_ad3iyat_al3ilal_walmarad.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_ba3d_ala7raz_wal3owaz.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_da3awat_ma2soura_kabl_salat_wfi_adbariha.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha.dart';
import 'da3awat_monta5aba men kitab alkafi alsharif/fi_zikr_dou3a2ain_lildin.dart';

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
        orElse: () =>
            throw Exception('لم يتم العثور على دعوات منتخبة من كتاب الكافي الشريف'),
      );

      // نتأكد أن فيه فهرس داخلي (index أو subSections)
      final List<Map<String, dynamic>> mappedList = [];

      if (albakiyatSection.index.isNotEmpty) {
        for (var sub in albakiyatSection.index) {
          mappedList.add({
            'id': sub.id,
            'title': sub.title,
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
                Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an.screenRoute,
                FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh.screenRoute,
                FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi
                    .screenRoute,
                FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute,
                FiAd3iyaMa2souraLilrizk.screenRoute,
                FiZikrDou3a2ainLildin.screenRoute,
                FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute,
                FiAd3iyatAl3ilalWalmarad.screenRoute,
                FiBa3dAla7razWal3owaz.screenRoute,
                FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira.screenRoute,
                Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'دعوات منتخبة من كتاب الكافي الشريف') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': allRoutes.map((e) => e).toList()[subItem.id - 1],
                    });
                  }
                }
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
