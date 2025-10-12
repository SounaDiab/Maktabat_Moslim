import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_ashhor_alsana.dart';
import 'ramadan/a3mal_allaila_altasi3a_3ashara_ramadan.dart';
import 'ramadan/allayla_al2oula_ramadan.dart';
import 'ramadan/allayla_al5amisa_3ashar_ramadan.dart';
import 'ramadan/allayla_alrabi3a_3ashar_ramadan.dart';
import 'ramadan/allayla_alsabi3a_3ashara_ramadan.dart';
import 'ramadan/allayla_alsabi3a_wal3ishroun_ramadan.dart';
import 'ramadan/allayla_alsalisa_3ashar_ramadan.dart';
import 'ramadan/allayla_alsalisa_wal3ishroun_ramadan.dart';
import 'ramadan/allayla_alwa7ida_wal3ishroun_ramadan.dart';
import 'ramadan/alyawm_al2awal_ramadan.dart';
import 'ramadan/alyawm_alsadis_ramadan.dart';
import 'ramadan/alyawm_alsalasin_ramadan.dart';
import 'ramadan/alyawm_alwa7id_wal3ishroun_ramadan.dart';
import 'ramadan/da3awat_ayam_shaher_ramadan.dart';
import 'ramadan/dou3aa_allayla_al5amisa_wal3ishroun_ramadan.dart';
import 'ramadan/dou3aa_allayla_alrabi3a_wal3ishroun_ramadan.dart';
import 'ramadan/dou3aa_allayla_alsabi3a_wal3ishroun_ramadan.dart';
import 'ramadan/dou3aa_allayla_alsadisa_wal3ishroun_ramadan.dart';
import 'ramadan/dou3aa_allayla_alsalasin_ramadan.dart';
import 'ramadan/dou3aa_allayla_alsamina_wal3ishroun_ramadan.dart';
import 'ramadan/dou3aa_allayla_altasi3a_wal3ishroun_ramadan.dart';
import 'ramadan/douaa_abi_7amza_alsamali.dart';
import 'ramadan/douaa_al2iftita7.dart';
import 'ramadan/douaa_allayla_alsania_wal3ishroun_ramadan.dart';
import 'ramadan/douaa_alsa7ar.dart';
import 'ramadan/fi_2a3mal_2ashar_shaher_ramadan.dart';
import 'ramadan/fi_2a3mal_2ayam_shaher_ramadan.dart';
import 'ramadan/fi_2a3mal_shaher_ramadan_al5asa.dart';
import 'ramadan/fi_fadel_shaher_ramadan_wa2a3maloh.dart';
import 'ramadan/ma_ya3om_allayali_wal2ayam.dart';
import 'ramadan/ma_yosta7ab_2itanoh_fi_layali_shaher_ramadan.dart';
import 'ramadan/salawat_allayali_wada3awat_al2ayama_almashhoura.dart';
import 'ramadan/yawm_alnisf_men_ramadan.dart';

class Ramadan extends StatefulWidget {
  static String screenRoute = 'ramadan_screen';
  Ramadan({super.key});

  @override
  State<Ramadan> createState() => _RamadanState();
}

class _RamadanState extends State<Ramadan> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.ramadanList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context).pushReplacementNamed(A3malAshhorAlsana.screenRoute);
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
                  .pushReplacementNamed(A3malAshhorAlsana.screenRoute);
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
                Da3awatAyamShaherRamadan.screenRoute,
                FiFadelShaherRamadanWa2a3maloh.screenRoute,
                MaYa3omAllayaliWal2ayam.screenRoute,
                MaYosta7ab2itanohFiLayaliShaherRamadan.screenRoute,
                DouaaAl2iftita7.screenRoute,
                Fi2a3mal2asharShaherRamadan.screenRoute,
                DouaaAbi7amzaAlsamali.screenRoute,
                DouaaAlsa7ar.screenRoute,
                Fi2a3mal2ayamShaherRamadan.screenRoute,
                Fi2a3malShaherRamadanAl5asa.screenRoute,
                SalawatAllayaliWada3awatAl2ayamaAlmashhoura.screenRoute,
                AllaylaAl2oulaRamadan.screenRoute,
                AlyawmAl2awalRamadan.screenRoute,
                AlyawmAlsadisRamadan.screenRoute,
                AllaylaAlsalisa3asharRamadan.screenRoute,
                AllaylaAlrabi3a3asharRamadan.screenRoute,
                AllaylaAl5amisa3asharRamadan.screenRoute,
                YawmAlnisfMenRamadan.screenRoute,
                AllaylaAlsabi3a3asharaRamadan.screenRoute,
                A3malAllailaAltasi3a3asharaRamadan.screenRoute,
                AllaylaAlwa7idaWal3ishrounRamadan.screenRoute,
                AlyawmAlwa7idWal3ishrounRamadan.screenRoute,
                DouaaAllaylaAlsaniaWal3ishrounRamadan.screenRoute,
                AllaylaAlsalisaWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAlrabi3aWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAl5amisaWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAlsadisaWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAlsabi3aWal3ishrounRamadan.screenRoute,
                AllaylaAlsabi3aWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAlsaminaWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAltasi3aWal3ishrounRamadan.screenRoute,
                Dou3aaAllaylaAlsalasinRamadan.screenRoute,
                AlyawmAlsalasinRamadan.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال اشهر السنة') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'شهر رمضان واعماله') {
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
