import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_almasajed_walziyarat.dart';
import 'ziyarat amir almo2minin/alsalisa_men_alziyarat.dart';
import 'ziyarat amir almo2minin/alsaniya_men_alziyarat.dart';
import 'ziyarat amir almo2minin/fi_fadl_ziyaratihi.dart';
import 'ziyarat amir almo2minin/fi_kaifiyat_ziyaratihi.dart';
import 'ziyarat amir almo2minin/wada3_al2amir.dart';

class KaifyatWziyaratAmirAlmo2minin extends StatefulWidget {
  static String screenRoute = 'kaifyat_wziyarat_amir_almo2minin_screen';
  KaifyatWziyaratAmirAlmo2minin({super.key});

  @override
  State<KaifyatWziyaratAmirAlmo2minin> createState() =>
      _KaifyatWziyaratAmirAlmo2mininState();
}

class _KaifyatWziyaratAmirAlmo2mininState
    extends State<KaifyatWziyaratAmirAlmo2minin> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.kaifyatWziyaratAmirAlmo2mininList);
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
                FiFadlZiyaratihi.screenRoute,
                FiKaifiyatZiyaratihi.screenRoute,
                Wada3Al2amir.screenRoute,
                AlsaniyaMenAlziyarat.screenRoute,
                AlsalisaMenAlziyarat.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال المساجد والزيارات') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'كيفية وفضل زيارة امير المؤمنين') {
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
