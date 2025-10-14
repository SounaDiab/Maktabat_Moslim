import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/web service/json_service.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_almasajed_walziyarat.dart';
import 'masjid alkoufa/a3mal_al2ostwana_al5amisa.dart';
import 'masjid alkoufa/a3mal_al2ostwana_alsabi3a.dart';
import 'masjid alkoufa/a3mal_bab_alfaraj.dart';
import 'masjid alkoufa/a3mal_bait_altast.dart';
import 'masjid alkoufa/a3mal_dikat_alkada2_wbait_altast.dart';
import 'masjid alkoufa/a3mal_jami3_alkoufa.dart';
import 'masjid alkoufa/a3mal_mi7rab_amir_almo2minin.dart';
import 'masjid alkoufa/aamal_al2ostwana_alsalisa.dart';
import 'masjid alkoufa/fi_fadl_alkoufa_wamasjidouha.dart';
import 'masjid alkoufa/mounajat_amir_almo2minin.dart';
import 'masjid alkoufa/sifat_salat.dart';
import 'masjid alkoufa/sifat_salat_lil7aja.dart';
import 'masjid alkoufa/zikr_alsalat_waldou3aa_fi_wasat_almasjid.dart';
import 'masjid alkoufa/ziyarat_hani_ben_3orwa.dart';
import 'masjid alkoufa/ziyarat_mouslim_ben_3akil.dart';

class FadlLakoufaWmasjidoha extends StatefulWidget {
  static String screenRoute = 'fadl_alkoufa_wmasjidoha_screen';
  FadlLakoufaWmasjidoha({super.key});

  @override
  State<FadlLakoufaWmasjidoha> createState() => _FadlLakoufaWmasjidohaState();
}

class _FadlLakoufaWmasjidohaState extends State<FadlLakoufaWmasjidoha> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();

        final mafatihList = await jsonService.getMafatihAljinan();

        final mafatihSection = mafatihList.firstWhere(
          (item) => item.title.contains('اعمال المساجد والزيارات'),
          orElse: () =>
              throw Exception('لم يتم العثور على اعمال المساجد والزيارات'),
        );

        // قائمة المستوى الثالث
        final List<Map<String, dynamic>> mappedList = [];

        if (mafatihSection.index.isNotEmpty) {
          for (var sub in mafatihSection.index) {
            // الآن نتحقق من وجود index داخلي (المستوى الثالث)
            if (sub.index.isNotEmpty) {
              if (sub.title == "فضل الكوفة ومسجدها واعماله") {
                for (var subSub in sub.index) {
                  mappedList.add({
                    'id': subSub.id,
                    'title': subSub.title,
                  });
                }
              }
            }
          }
        }

        // تمرير بيانات المستوى الثالث إلى SearchProvider
        searchProvider.setItems(mappedList);
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
    final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
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
                FiFadlAlkoufaWamasjidouha.screenRoute,
                A3malJami3Alkoufa.screenRoute,
                A3malDikatAlkada2WbaitAltast.screenRoute,
                A3malBaitAltast.screenRoute,
                ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute,
                A3malAl2ostwanaAlsabi3a.screenRoute,
                A3malAl2ostwanaAl5amisa.screenRoute,
                AamalAl2ostwanaAlsalisa.screenRoute,
                A3malBabAlfaraj.screenRoute,
                SifatSalat.screenRoute,
                SifatSalatLil7aja.screenRoute,
                A3malMi7rabAmirAlmo2minin.screenRoute,
                MounajatAmirAlmo2minin.screenRoute,
                ZiyaratMouslimBen3akil.screenRoute,
                ZiyaratHaniBen3orwa.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال المساجد والزيارات') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'فضل الكوفة ومسجدها واعماله') {
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
