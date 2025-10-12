import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import '../a3mal_layali_kadr_home_screen.dart';
import 'package:provider/provider.dart';

import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../../widgets/search_widget.dart';
import '../search_provider.dart';
import 'al2a3mal al3ama/a3mal_ashar_ramdan.dart';
import 'al2a3mal al3ama/altasbihat.dart';
import 'al2a3mal al3ama/dou3a2_abi_hamza_alsamali.dart';
import 'al2a3mal al3ama/dou3a2_al2imam_alsadek.dart';
import 'al2a3mal al3ama/dou3a2_aljawshan_alkabir.dart';
import 'al2a3mal al3ama/dou3a2_allahoma_2ini_amsayt.dart';
import 'al2a3mal al3ama/dou3a2_alsalihin.dart';
import 'al2a3mal al3ama/dou3a2_altawasol_belmis7af.dart';
import 'al2a3mal al3ama/dou3a2_altawba.dart';
import 'al2a3mal al3ama/dou3a2_idris.dart';
import 'al2a3mal al3ama/dou3a2_l2iftitah.dart';
import 'al2a3mal al3ama/dou3a2_makarim_al2a5lak.dart';
import 'al2a3mal al3ama/dou3a2_ya_3odati.dart';
import 'al2a3mal al3ama/dou3a2_ya_mafza3i.dart';
import 'al2a3mal al3ama/dou3a_albaha2.dart';
import 'al2a3mal al3ama/salat_mi2at_rok3a.dart';
import 'al2a3mal al3ama/salat_rok3atain.dart';
import 'al2a3mal al3ama/ziyarat_3ali_bin_alhussein.dart';
import 'al2a3mal al3ama/ziyarat_abi_alfadl.dart';
import 'al2a3mal al3ama/ziyarat_al2imam_alhussein.dart';
import 'al2a3mal al3ama/ziyarat_alshohada.dart';

class Al2a3malAl3ama extends StatefulWidget {
  static String screenRoute = 'al2a3mal_al3ama_screen';
  const Al2a3malAl3ama({super.key});

  @override
  State<Al2a3malAl3ama> createState() => _Al2a3malAl3amaState();
}

class _Al2a3malAl3amaState extends State<Al2a3malAl3ama> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(LayaliKadr.Al2a3malAl3amaList);
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
                Dou3a2L2iftitah.screenRoute,
                Dou3a2Alsalihin.screenRoute,
                Dou3a2Al2imamAlsadek.screenRoute,
                SalatRok3atain.screenRoute,
                Dou3a2AltawasolBelmis7af.screenRoute,
                ZiyaratAl2imamAlhussein.screenRoute,
                Ziyarat3aliBinAlhussein.screenRoute,
                ZiyaratAlshohada.screenRoute,
                ZiyaratAbiAlfadl.screenRoute,
                SalatMi2atRok3a.screenRoute,
                Dou3a2Allahoma2iniAmsayt.screenRoute,
                Dou3a2Altawba.screenRoute,
                Dou3a2AljawshanAlkabir.screenRoute,
                A3malAsharRamdan.screenRoute,
                Dou3aAlbaha2.screenRoute,
                Dou3a2AbiHamzaAlsamali.screenRoute,
                Dou3a2Ya3odati.screenRoute,
                Dou3a2Idris.screenRoute,
                Dou3a2YaMafza3i.screenRoute,
                Altasbihat.screenRoute,
                Dou3a2MakarimAl2a5lak.screenRoute,
              ];
              for (var item in a3malLaylatAlkader) {
                if (item.title == "الاعمال العامة في ليلة القدر") {
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
