import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../mafatih_aljinan_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'ad3iya mashhoura/Douaa_alsabah.dart';
import 'ad3iya mashhoura/douaa_3alkama.dart';
import 'ad3iya mashhoura/douaa_al3adila.dart';
import 'ad3iya mashhoura/douaa_al3asharat.dart';
import 'ad3iya mashhoura/douaa_alaahd.dart';
import 'ad3iya mashhoura/douaa_alfaraj.dart';
import 'ad3iya mashhoura/douaa_alhazin.dart';
import 'ad3iya mashhoura/douaa_alihtijab.dart';
import 'ad3iya mashhoura/douaa_aljawshan_alkabir.dart';
import 'ad3iya mashhoura/douaa_aljawshan_alsa8ir.dart';
import 'ad3iya mashhoura/douaa_alkamous.dart';
import 'ad3iya mashhoura/douaa_almashlol.dart';
import 'ad3iya mashhoura/douaa_almojir.dart';
import 'ad3iya mashhoura/douaa_alsimat.dart';
import 'ad3iya mashhoura/douaa_altawasol.dart';
import 'ad3iya mashhoura/douaa_komail.dart';
import 'ad3iya mashhoura/douaa_makarim_alakhlak.dart';
import 'ad3iya mashhoura/douaa_nodba.dart';
import 'ad3iya mashhoura/douaa_yastashir.dart';
import 'ad3iya mashhoura/douaa_zaman_alghaiba.dart';

class Ad3iyaMashhoura extends StatefulWidget {
  static String screenRoute = 'ad3iya_mashhoura_screen';
  const Ad3iyaMashhoura({super.key});

  @override
  State<Ad3iyaMashhoura> createState() => _Ad3iyaMashhouraState();
}

class _Ad3iyaMashhouraState extends State<Ad3iyaMashhoura> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.ad3iyaMashhouraList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(MafatihAljinanHomeScreen.screenRoute);
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
                  .pushReplacementNamed(MafatihAljinanHomeScreen.screenRoute);
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
                DouaaAlihtijab.screenRoute,
                DouaaZamanAlghaiba.screenRoute,
                DouaaNodba.screenRoute,
                DouaaMakarimAlakhlak.screenRoute,
                DouaaAlfaraj.screenRoute,
                DouaaAlaahd.screenRoute,
                Douaa3alkama.screenRoute,
                DouaaAlsabah.screenRoute,
                DouaaAltawasol.screenRoute,
                DouaaKomail.screenRoute,
                DouaaAl3asharat.screenRoute,
                DouaaAlsimat.screenRoute,
                DouaaAlmashlol.screenRoute,
                DouaaYastashir.screenRoute,
                DouaaAlmojir.screenRoute,
                DouaaAl3adila.screenRoute,
                DouaaAljawshanAlkabir.screenRoute,
                DouaaAljawshanAlsa8ir.screenRoute,
                DouaaAlhazin.screenRoute,
                DouaaAlkamous.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'الادعية المشهورة') {
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
