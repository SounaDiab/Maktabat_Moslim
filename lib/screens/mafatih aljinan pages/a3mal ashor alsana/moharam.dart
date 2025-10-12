import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_ashhor_alsana.dart';
import 'moharam/allayla_al2oula.dart';
import 'moharam/allayla_al3ashira.dart';
import 'moharam/alyawm_al2awal.dart';
import 'moharam/alyawm_al3asher.dart';
import 'moharam/alyawm_al5ames_wal_3eshroun.dart';
import 'moharam/alyawm_alsalis.dart';
import 'moharam/alyawm_altase3.dart';
import 'moharam/fi_a3mal_shaher_moharam.dart';

class Moharam extends StatefulWidget {
  static String screenRoute = 'moharam_screen';
  Moharam({super.key});

  @override
  State<Moharam> createState() => _MoharamState();
}

class _MoharamState extends State<Moharam> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.moharamList);
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
                FiA3malShaherMoharam.screenRoute,
                AllaylaAl2oula.screenRoute,
                AlyawmAl2awal.screenRoute,
                AlyawmAlsalis.screenRoute,
                AlyawmAltase3.screenRoute,
                AllaylaAl3ashira.screenRoute,
                AlyawmAl3asher.screenRoute,
                AlyawmAl5amesWal3eshroun.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال اشهر السنة') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'شهر محرم واعماله') {
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
