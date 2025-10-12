import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_almasajed_walziyarat.dart';
import 'alziyarat aljami3a wal salawat/aakib_ziyarat_al2a2ima.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_ali_bin_lhussein.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_ali_bin_mohamad.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_ali_bin_moussa.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_alnabi.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_alsayida_fatima.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_amir_almo2minin.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_ja3far_bin_mohamad.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_lhassan_al3askari.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_lhassan_walhussein.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_mohamad_bin_ali.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_mohamad_bin_ali_bin_moussa.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_moussa_bin_ja3far.dart';
import 'alziyarat aljami3a wal salawat/alsalat_3ala_waley_l2amer.dart';
import 'alziyarat aljami3a wal salawat/fi_ziyarat_alabna2_al3ozama2.dart';
import 'alziyarat aljami3a wal salawat/fi_ziyarat_kobour_lmo2minin.dart';
import 'alziyarat aljami3a wal salawat/fi_ziyarat_l2abiya2_l3izam.dart';
import 'alziyarat aljami3a wal salawat/hadis_alkisa2.dart';
import 'alziyarat aljami3a wal salawat/ma_yozar_kol_2imam.dart';
import 'alziyarat aljami3a wal salawat/salat_ja3far_altayar.dart';
import 'alziyarat aljami3a wal salawat/ziyarat_2al_yasin.dart';
import 'alziyarat aljami3a wal salawat/ziyarat_alna7iya_almokadasa.dart';
import 'alziyarat aljami3a wal salawat/ziyarat_alsayida_zainab.dart';

class AlziyaratAljami3aWalsalawat extends StatefulWidget {
  static String screenRoute = 'alziyarat_aljami3a_walsalawat_screen';
  AlziyaratAljami3aWalsalawat({super.key});

  @override
  State<AlziyaratAljami3aWalsalawat> createState() =>
      _AlziyaratAljami3aWalsalawatState();
}

class _AlziyaratAljami3aWalsalawatState
    extends State<AlziyaratAljami3aWalsalawat> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.alziyaratAljami3aWalsalawatList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(A3malAlmasajedWalziyarat.screenRoute);
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
            onPressed: () {
              final searchProvider =
                  Provider.of<SearchProvider>(context, listen: false);
              searchProvider.clearSearch();
              Navigator.of(context)
                  .pushReplacementNamed(A3malAlmasajedWalziyarat.screenRoute);
            },
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
                  delegate: DataSearch(Items.allItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<MafatihAljinanCubit, MafatihAljinanState>(
          builder: (context, state) {
            if (state is MafatihAljinanLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MafatihAljinanLoaded) {
              final mafatihAljinan = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                Ziyarat2alYasin.screenRoute,
                ZiyaratAlna7iyaAlmokadasa.screenRoute,
                SalatJa3farAltayar.screenRoute,
                ZiyaratAlsayidaZainab.screenRoute,
                HadisAlkisa2.screenRoute,
                FiZiyaratAlabna2Al3ozama2.screenRoute,
                FiZiyaratKobourLmo2minin.screenRoute,
                FiZiyaratL2abiya2L3izam.screenRoute,
                MaYozarKol2imam.screenRoute,
                AakibZiyaratAl2a2ima.screenRoute,
                Alsalat3alaAlnabi.screenRoute,
                Alsalat3alaAmirAlmo2minin.screenRoute,
                Alsalat3alaAlsayidaFatima.screenRoute,
                Alsalat3alaLhassanWalhussein.screenRoute,
                Alsalat3alaAliBinLhussein.screenRoute,
                Alsalat3alaMohamadBinAli.screenRoute,
                Alsalat3alaJa3farBinMohamad.screenRoute,
                Alsalat3alaMoussaBinJa3far.screenRoute,
                Alsalat3alaAliBinMoussa.screenRoute,
                Alsalat3alaMohamadBinAliBinMoussa.screenRoute,
                Alsalat3alaAliBinMohamad.screenRoute,
                Alsalat3alaLhassanAl3askari.screenRoute,
                Alsalat3alaWaleyL2amer.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال المساجد والزيارات') {
                  for (var subItem in item.index) {
                    if (subItem.title ==
                        'الزيارات الجامعة والصلوات على الحجج الطاهرين') {
                      for (var inSubItem in subItem.index) {
                        allTitles.add({
                          'title': inSubItem.title,
                          'route': allRoutes
                              .map((e) => e)
                              .toList()[inSubItem.id - 1],
                        });
                      }
                    }
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
            } else if (state is MafatihAljinanError) {
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
