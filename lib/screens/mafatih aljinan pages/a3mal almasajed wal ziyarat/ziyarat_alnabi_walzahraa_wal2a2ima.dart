import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_almasajed_walziyarat.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/alwada3.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/zikr_almasajed_almo3azama.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/zikr_sa2ir_alziyarat.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_2a2imat_belbaki3.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_alnabi.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_alnabi_walzahraa_wal2a2ima_belbaki3.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_fatima_bent_2asad.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_hamza.dart';
import 'ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_kobour_alshohada2.dart';

class ZiyaratAlnabiWalzahraaWal2a2ima extends StatefulWidget {
  static String screenRoute = 'ziyarat_alnabi_walzahraa_wal2a2ima_screen';
  ZiyaratAlnabiWalzahraaWal2a2ima({super.key});

  @override
  State<ZiyaratAlnabiWalzahraaWal2a2ima> createState() =>
      _ZiyaratAlnabiWalzahraaWal2a2imaState();
}

class _ZiyaratAlnabiWalzahraaWal2a2imaState
    extends State<ZiyaratAlnabiWalzahraaWal2a2ima> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.ziyaratAlnabiWalzahraaWal2a2imaList);
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
                ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3.screenRoute,
                ZiyaratAlnabi.screenRoute,
                Ziyarat2a2imatBelbaki3.screenRoute,
                ZikrSa2irAlziyarat.screenRoute,
                ZiyaratFatimaBent2asad.screenRoute,
                ZiyaratHamza.screenRoute,
                ZiyaratKobourAlshohada2.screenRoute,
                ZikrAlmasajedAlmo3azama.screenRoute,
                Alwada3.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال المساجد والزيارات') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'زيارة النبي والزهراء والأئمة (ع)') {
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
