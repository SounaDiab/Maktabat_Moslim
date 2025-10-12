import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../a3mal_layali_kadr_home_screen.dart';
import 'package:provider/provider.dart';

import '../../Util/items.dart';
import '../../business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import '../../widgets/line_from_index.dart';
import '../../widgets/search_widget.dart';
import '../search_provider.dart';
import 'sowar kor2aneya/sourat_al3ankabout.dart';
import 'sowar kor2aneya/sourat_aldo5an.dart';
import 'sowar kor2aneya/sourat_alroum.dart';

class AlsowarAlkor2aneya extends StatefulWidget {
  static String screenRoute = 'alsowar_alkor2aneya_screen';
  const AlsowarAlkor2aneya({super.key});

  @override
  State<AlsowarAlkor2aneya> createState() => _AlsowarAlkor2aneyaState();
}

class _AlsowarAlkor2aneyaState extends State<AlsowarAlkor2aneya> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(LayaliKadr.SowarKor2aneyaList);
      },
    );
    context.read<A3malLaylatAlkaderCubit>().getA3malLaylatAlkader();
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(A3malLayaliKadrHomeScreen.screenRoute);
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
                  .pushReplacementNamed(A3malLayaliKadrHomeScreen.screenRoute);
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
                  delegate: DataSearch(LayaliKadr.allItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<A3malLaylatAlkaderCubit, A3malLaylatAlkaderState>(
          builder: (context, state) {
            if (state is A3malLaylatAlkaderLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is A3malLaylatAlkaderLoaded) {
              final a3malLaylatAlkader = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                SouratAl3ankabout.screenRoute,
                SouratAlroum.screenRoute,
                SouratAldo5an.screenRoute
              ];
              for (var item in a3malLaylatAlkader) {
                if (item.title == "السور القرآنية المباركة التي تستحب قرائتها في ليلة القدر") {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': allRoutes
                          .map((e) => e)
                          .toList()[subItem.id - 1], // أو أي قيمة route مناسبة
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
                      // final item = searchProvider.filteredItems[index];
                      final title = allTitles[i]['title'];
                      final route = allTitles[i]['route'];
                      return LineFromIndex(
                        text: title,
                        route: route,
                      );
                    },
                  ),
                ),
              );
            } else if (state is A3malLaylatAlkaderError) {
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
