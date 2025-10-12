import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../mafatih%20aljinan%20pages/a3mal_ashhor_alsana.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import 'baki al sana/fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya.dart';
import 'baki al sana/fi_shaher_rabi3_al2awal.dart';
import 'baki al sana/fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira.dart';
import 'baki al sana/fi_shaher_safar.dart';
import 'baki al sana/fi_shaher_zilko3da.dart';

class BakiAlsana extends StatefulWidget {
  static String screenRoute = 'bakiAlsana_screen';
  BakiAlsana({super.key});

  @override
  State<BakiAlsana> createState() => _BakiAlsanaState();
}

class _BakiAlsanaState extends State<BakiAlsana> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.baki2a3malAlsanaList);
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
                FiShaherZilko3da.screenRoute,
                FiShaherSafar.screenRoute,
                FiShaherRabi3Al2awal.screenRoute,
                FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira.screenRoute,
                Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
                    .screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال اشهر السنة') {
                  for (var subItem in item.index) {
                    if(subItem.title == 'باقي اعمال اشهر السنة'){
                      for(var inSubItem in subItem.index){
                      allTitles.add({
                      'title': inSubItem.title,
                      'route': allRoutes.map((e) => e).toList()[inSubItem.id - 1],
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
