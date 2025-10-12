import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';
import 'ba3d alsalawat almandouba/salat_al2a3rabi.dart';
import 'ba3d alsalawat almandouba/salat_alhadiya.dart';
import 'ba3d alsalawat almandouba/salat_lailat_aldafn.dart';
import 'ba3d alsalawat almandouba/salat_alwalad_liwalidayh.dart';
import 'ba3d alsalawat almandouba/salat_alja2i3.dart';
import 'ba3d alsalawat almandouba/salat_li7adis_alnafs.dart';
import 'ba3d alsalawat almandouba/salat_al2isti5ara_zat_alrka3.dart';
import 'ba3d alsalawat almandouba/salat_liddain_wlkifayat_zolm_alsoltan.dart';
import 'ba3d alsalawat almandouba/salat_al7aja.dart';
import 'ba3d alsalawat almandouba/salat_lilmohemat.dart';
import 'ba3d alsalawat almandouba/salat_al3asra.dart';
import 'ba3d alsalawat almandouba/salat_lziyadat_alrizk.dart';
import 'ba3d alsalawat almandouba/salat_al7aja_al2oula.dart';
import 'ba3d alsalawat almandouba/salat_al7aja_alsaniya.dart';
import 'ba3d alsalawat almandouba/salat_al7aja_alsalisa.dart';
import 'ba3d alsalawat almandouba/salat_al7aja_alrabi3a.dart';
import 'ba3d alsalawat almandouba/salat_al7aja_al5amisa.dart';
import 'ba3d alsalawat almandouba/salat_alisti8asa.dart';
import 'ba3d alsalawat almandouba/salat_al7oja_fi_jamkaran.dart';
import 'ba3d alsalawat almandouba/salat_al5awf_men_alzalim.dart';
import 'ba3d alsalawat almandouba/salat_lilzaka2_wjoudat_alhofez.dart';
import 'ba3d alsalawat almandouba/salat_li8ofran_alzounoub.dart';
import 'ba3d alsalawat almandouba/salat_alwasiya.dart';
import 'ba3d alsalawat almandouba/salat_al3afo.dart';

class Ba3dAlsalawatAlmandouba extends StatefulWidget {
  static String screenRoute = 'ba3d_alsalawat_almandouba_screen';
  Ba3dAlsalawatAlmandouba({super.key});

  @override
  State<Ba3dAlsalawatAlmandouba> createState() =>
      _Ba3dAlsalawatAlmandoubaState();
}

class _Ba3dAlsalawatAlmandoubaState extends State<Ba3dAlsalawatAlmandouba> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(AlBaqiyatAlSalehat.ba3dAlsalawatAlmandoubaList);
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
                      AlBaqiyatAlSalehat.ba3dAlsalawatAlmandoubaList),
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
                SalatAl2a3rabi.screenRoute,
                SalatAlhadiya.screenRoute,
                SalatLailatAldafn.screenRoute,
                SalatAlwaladLiwalidayh.screenRoute,
                SalatAlja2i3.screenRoute,
                SalatLi7adisAlnafs.screenRoute,
                SalatAl2isti5araZatAlrka3.screenRoute,
                SalatLiddainWlkifayatZolmAlsoltan.screenRoute,
                SalatAl7aja.screenRoute,
                SalatLilmohemat.screenRoute,
                SalatAl3asra.screenRoute,
                SalatLziyadatAlrizk.screenRoute,
                SalatAl7ajaAl2oula.screenRoute,
                SalatAl7ajaAlsaniya.screenRoute,
                SalatAl7ajaAlsalisa.screenRoute,
                SalatAl7ajaAlrabi3a.screenRoute,
                SalatAl7ajaAl5amisa.screenRoute,
                SalatAlisti8asa.screenRoute,
                SalatAl7ojaFiJamkaran.screenRoute,
                SalatAl5awfMenAlzalim.screenRoute,
                SalatLilzaka2WjoudatAlhofez.screenRoute,
                SalatLi8ofranAlzounoub.screenRoute,
                SalatAlwasiya.screenRoute,
                SalatAl3afo.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'بعض الصلوات المندوبة') {
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
