import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/web service/json_service.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../mafatih%20aljinan%20pages/a3mal_ashhor_alsana.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import 'rajab/al2a3mal_al5asa_brajab.dart';
import 'rajab/allayla_alsabi3a_wal3eshroun.dart';
import 'rajab/allayla_alsalisa_3ashara.dart';
import 'rajab/alyawm_al2a5ir_men_alshaher.dart';
import 'rajab/alyawm_al2awal_men_rajab.dart';
import 'rajab/alyawm_al5ames_wal3ishroun.dart';
import 'rajab/alyawm_alsabe3_wal3eshroun.dart';
import 'rajab/alyawm_alsalis_3ashar.dart';
import 'rajab/lailat_alnisf_men_rajab.dart';
import 'rajab/yawm_alnisf_men_rajab.dart';

class Rajab extends StatefulWidget {
  static String screenRoute = 'rajab_screen';
  Rajab({super.key});

  @override
  State<Rajab> createState() => _RajabState();
}

class _RajabState extends State<Rajab> {
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
              if (sub.title == "شهر رجب واعماله") {
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
            onPressed: () {
              debugPrint('Clearing search and navigating...');
              final searchProvider =
                  Provider.of<SearchProvider>(context, listen: false);
              searchProvider.clearSearch();
              // Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacementNamed(A3malAshhorAlsana.screenRoute);
              debugPrint('Returned to previous screen.');
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
                Al2a3malAl5asaBrajab.screenRoute,
                AlyawmAl2awalMenRajab.screenRoute,
                AllaylaAlsalisa3ashara.screenRoute,
                AlyawmAlsalis3ashar.screenRoute,
                LailatAlnisfMenRajab.screenRoute,
                YawmAlnisfMenRajab.screenRoute,
                AlyawmAl5amesWal3ishroun.screenRoute,
                AllaylaAlsabi3aWal3eshroun.screenRoute,
                AlyawmAlsabe3Wal3eshroun.screenRoute,
                AlyawmAl2a5irMenAlshaher.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال اشهر السنة') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'شهر رجب واعماله') {
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
