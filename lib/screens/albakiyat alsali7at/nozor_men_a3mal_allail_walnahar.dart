import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';
import 'nozor men a3mal allail walnahar/alta3kibat_al3amaa.dart';
import 'nozor men a3mal allail walnahar/alta3kibat_al5asa_bfaridat_alsob7.dart';
import 'nozor men a3mal allail walnahar/fi_azkar_wda3awat_tokra2_saba7an_wamasa2an.dart';
import 'nozor men a3mal allail walnahar/fi_l2intibah_men_alnawm_wsalat_allayl.dart';
import 'nozor men a3mal allail walnahar/fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha.dart';
import 'nozor men a3mal allail walnahar/fima_yata3alak_bel8odat.dart';
import 'nozor men a3mal allail walnahar/fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm.dart';
import 'nozor men a3mal allail walnahar/fima_yod3a_bihi_fikol_sa3a_men_sa3at_alyawm.dart';

class NozorMenA3malAllailWalnahar extends StatefulWidget {
  static String screenRoute = 'nzor_men_a3mal_allaila_walnahar_screen';
  NozorMenA3malAllailWalnahar({super.key});

  @override
  State<NozorMenA3malAllailWalnahar> createState() =>
      _NozorMenA3malAllailWalnaharState();
}

class _NozorMenA3malAllailWalnaharState
    extends State<NozorMenA3malAllailWalnahar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider
            .setItems(AlBaqiyatAlSalehat.nozorMenA3malAllailWalnaharList);
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
                      AlBaqiyatAlSalehat.nozorMenA3malAllailWalnaharList),
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
                FimaYata3alakBel8odat.screenRoute,
                Alta3kibatAl3amaa.screenRoute,
                Alta3kibatAl5asaBfaridatAlsob7.screenRoute,
                FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                    .screenRoute,
                FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute,
                FiL2intibahMenAlnawmWsalatAllayl.screenRoute,
                FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute,
                FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'نزر من اعمال الليل والنهار') {
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
