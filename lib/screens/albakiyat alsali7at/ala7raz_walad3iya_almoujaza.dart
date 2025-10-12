import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';
import 'ala7raz walad3iya almoujaza/almonajat_belisti5araa.dart';
import 'ala7raz walad3iya almoujaza/almonajat_belistikala.dart';
import 'ala7raz walad3iya almoujaza/almonajat_belsafaar.dart';
import 'ala7raz walad3iya almoujaza/almonajat_bilisti3aza.dart';
import 'ala7raz walad3iya almoujaza/almonajat_bishokr_allah.dart';
import 'ala7raz walad3iya almoujaza/almonajat_bitalab_al7aj.dart';
import 'ala7raz walad3iya almoujaza/almonajat_bitalab_al7awa2ij.dart';
import 'ala7raz walad3iya almoujaza/almonajat_bitalab_alrizk.dart';
import 'ala7raz walad3iya almoujaza/almonajat_bitalab_altawba.dart';
import 'ala7raz walad3iya almoujaza/almonajat_likashf_alzolm.dart';
import 'ala7raz walad3iya almoujaza/dou3a2_alsajad_fi_zikr_altawba.dart';
import 'ala7raz walad3iya almoujaza/fi_asar_ba3d_sowar_walayat.dart';
import 'ala7raz walad3iya almoujaza/fi_ba3d_ala7raz_walad3iya_almoujaza.dart';
import 'ala7raz walad3iya almoujaza/fi_ba3d_ma_yata3alak_belmawt.dart';

class Ala7razWalad3iyaAlmoujaza extends StatefulWidget {
  static String screenRoute = 'ala7raz_walad3iya_almoujaza_screen';
  Ala7razWalad3iyaAlmoujaza({super.key});

  @override
  State<Ala7razWalad3iyaAlmoujaza> createState() =>
      _Ala7razWalad3iyaAlmoujazaState();
}

class _Ala7razWalad3iyaAlmoujazaState extends State<Ala7razWalad3iyaAlmoujaza> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider
            .setItems(AlBaqiyatAlSalehat.ala7razWalad3iyaAlmoujazaItemList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(AlbakiyatAlsali7atHomeScreen.screenRoute);
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
                  delegate: DataSearch(
                      AlBaqiyatAlSalehat.ala7razWalad3iyaAlmoujazaItemList),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<AlbakiyatAlsalihatCubit, AlbakiyatAlsalihatState>(
          builder: (context, state) {
            if (state is AlbakiyatAlsalihatLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlbakiyatAlsalihatLoaded) {
              final albakiyatAlsalihat = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                Dou3a2AlsajadFiZikrAltawba.screenRoute,
                FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute,
                AlmonajatBelisti5araa.screenRoute,
                AlmonajatBelistikala.screenRoute,
                AlmonajatBelsafaar.screenRoute,
                AlmonajatBitalabAlrizk.screenRoute,
                AlmonajatBilisti3aza.screenRoute,
                AlmonajatBitalabAltawba.screenRoute,
                AlmonajatBitalabAl7aj.screenRoute,
                AlmonajatLikashfAlzolm.screenRoute,
                AlmonajatBishokrAllah.screenRoute,
                AlmonajatBitalabAl7awa2ij.screenRoute,
                FiAsarBa3dSowarWalayat.screenRoute,
                FiBa3dMaYata3alakBelmawt.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'الاحراز والادعية الموجزة') {
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
            } else if (state is AlbakiyatAlsalihatError) {
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
