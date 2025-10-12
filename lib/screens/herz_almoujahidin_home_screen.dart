import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maktabat_almoslim/business%20logic/cubit/herz_almoujahidin_cubit.dart';
import 'books.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import '../Util/items.dart';

import '../widgets/line_from_index.dart';
import '../widgets/search_widget.dart';
import 'herz lmoujahidin/aawza_yataawaz_biha_aala_alaadaa_page.dart';
import 'herz lmoujahidin/aawzat_alnabi_yawm_wadi_alkora_page.dart';
import 'herz lmoujahidin/alfalak_page.dart';
import 'herz lmoujahidin/alhayakel_sabea_page.dart';
import 'herz lmoujahidin/alikhlas_page.dart';
import 'herz lmoujahidin/alkafiroun_page.dart';
import 'herz lmoujahidin/alnas_page.dart';
import 'herz lmoujahidin/ayat_alhefz_men_saif_alaadow_page.dart';
import 'herz lmoujahidin/ayat_alikhtifaa_men_alaadow_page.dart';
import 'herz lmoujahidin/ayat_listekfaa_page.dart';
import 'herz lmoujahidin/ayat_lkorsi_page.dart';
import 'herz lmoujahidin/douaa_ikhdaa_rikab_aljababira_page.dart';
import 'herz lmoujahidin/douaa_lidafea_kaid_aladow_wsharoh_page.dart';
import 'herz lmoujahidin/douaa_lilihtijab_aan_basar_alaadaa_page.dart';
import 'herz lmoujahidin/douaa_lilihtijab_page.dart';
import 'herz lmoujahidin/douaa_lilkhalas_men_alkatl_page.dart';
import 'herz lmoujahidin/douaa_nadi_aalyan_mozhira_alaajaib_page.dart';
import 'herz lmoujahidin/herz_alimam_aljawad_page.dart';
import 'herz lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'herz lmoujahidin/herz_altaj_page.dart';
import 'herz lmoujahidin/herz_lietikaa_silah_alaadow_page.dart';
import 'herz lmoujahidin/herz_mostakhraj_men_kitab_allah_page.dart';
import 'herz lmoujahidin/rokaat_aljayb_lilimam_alrida_aalaih_alsalam_page.dart';
import 'search_provider.dart';

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
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider
            .setItems(HerzAlmoujahidin.herzAlmoujahidinHomeScreenList);
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
                  delegate: DataSearch(HerzAlmoujahidin.allItems),
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
              final allRoutes = [
                AyatLkorsiPage.screenRoute,
                AlkafirounPage.screenRoute,
                AlikhlasPage.screenRoute,
                AlfalakPage.screenRoute,
                AlnasPage.screenRoute,
                AyatListekfaaPage.screenRoute,
                DouaaIkhdaaRikabAljababiraPage.screenRoute,
                DouaaLidafeaKaidAladowWsharohPage.screenRoute,
                HerzMostakhrajMenKitabAllahPage.screenRoute,
                AlhayakelSabeaPage.screenRoute,
                RokaatAljaybLilimamAlridaAalaihAlsalamPage.screenRoute,
                AawzaYataawazBihaAalaAlaadaaPage.screenRoute,
                DouaaLilkhalasMenAlkatlPage.screenRoute,
                HerzLietikaaSilahAlaadowPage.screenRoute,
                AyatAlhefzMenSaifAlaadowPage.screenRoute,
                HerzAlimamAljawadPage.screenRoute,
                AawzatAlnabiYawmWadiAlkoraPage.screenRoute,
                AyatAlikhtifaaMenAlaadowPage.screenRoute,
                DouaaLilihtijabAanBasarAlaadaaPage.screenRoute,
                DouaaLilihtijabPage.screenRoute,
                HerzAltajPage.screenRoute,
                HerzAlrasoulWalAimmaPage.screenRoute,
                DouaaNadiAalyanMozhiraAlaajaibPage.screenRoute,
              ];
              for (var item in herzAlmoujahidin) {
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
