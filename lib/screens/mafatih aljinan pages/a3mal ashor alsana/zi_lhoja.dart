import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/web service/json_service.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../mafatih%20aljinan%20pages/a3mal_ashhor_alsana.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import 'zi lhoja/allayla_al3ashira_zilhoja.dart';
import 'zi lhoja/allayla_alsamina_3ashara_zilhoja.dart';
import 'zi lhoja/allayla_altasi3a_zilhoja.dart';
import 'zi lhoja/alyawm_al2a5ir_men_zilhoja.dart';
import 'zi lhoja/alyawm_al2awal_zilhoja.dart';
import 'zi lhoja/alyawm_al3ashir_zilhoja.dart';
import 'zi lhoja/alyawm_al5amis_3ashar_zilhoja.dart';
import 'zi lhoja/alyawm_al5amis_wal3ishroun_zilhoja.dart';
import 'zi lhoja/alyawm_alrabi3_wal3ishroun_zilhoja.dart';
import 'zi lhoja/alyawm_alsabi3_zilhoja.dart';
import 'zi lhoja/alyawm_alsamin_3ashar_zilhoja.dart';
import 'zi lhoja/alyawm_alsamin_zilhoja.dart';
import 'zi lhoja/alyawm_altasi3_zilhoja.dart';
import 'zi lhoja/fi_a3mal_shaher_zilhoja.dart';
import 'zi lhoja/khotbat_amir_almo2minin_tawm_al8adir.dart';
import 'zi lhoja/ziyarat_amir_almo2minin_yawm_al8adir.dart';

class ZiLhoja extends StatefulWidget {
  static String screenRoute = 'ziLhoja_screen';
  ZiLhoja({super.key});

  @override
  State<ZiLhoja> createState() => _ZiLhojaState();
}

class _ZiLhojaState extends State<ZiLhoja> {
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
          (item) => item.title.contains('اعمال اشهر السنة'),
          orElse: () =>
              throw Exception('لم يتم العثور على اعمال اشهر السنة'),
        );

        // قائمة المستوى الثالث
        final List<Map<String, dynamic>> mappedList = [];

        if (mafatihSection.index.isNotEmpty) {
          for (var sub in mafatihSection.index) {
            // الآن نتحقق من وجود index داخلي (المستوى الثالث)
            if (sub.index.isNotEmpty) {
              if (sub.title == "شهر ذي الحجة واعماله") {
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
    Navigator.of(context).pushReplacementNamed(A3malAshhorAlsana.screenRoute);
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
                ZiyaratAmirAlmo2mininYawmAl8adir.screenRoute,
                FiA3malShaherZilhoja.screenRoute,
                AlyawmAl2awalZilhoja.screenRoute,
                AlyawmAlsabi3Zilhoja.screenRoute,
                AlyawmAlsaminZilhoja.screenRoute,
                AllaylaAltasi3aZilhoja.screenRoute,
                AlyawmAltasi3Zilhoja.screenRoute,
                AllaylaAl3ashiraZilhoja.screenRoute,
                AlyawmAl3ashirZilhoja.screenRoute,
                AlyawmAl5amis3asharZilhoja.screenRoute,
                AllaylaAlsamina3asharaZilhoja.screenRoute,
                AlyawmAlsamin3asharZilhoja.screenRoute,
                KhotbatAmirAlmo2mininTawmAl8adir.screenRoute,
                AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute,
                AlyawmAl5amisWal3ishrounZilhoja.screenRoute,
                AlyawmAl2a5irMenZilhoja.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال اشهر السنة') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'شهر ذي الحجة واعماله') {
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
