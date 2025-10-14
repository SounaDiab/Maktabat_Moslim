import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/al3awza_libtal_alsi7r.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/al7erz_men_al3ain.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/aldou3a2_likarakir_albatn.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/aldou3a2_lilbaras.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_lidaf3_wasawis_alshaitan.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_lil2amn_men_alsarik.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_lil3akrab.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_al3ain.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_al3awra.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_alasnan.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_alrokba.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awzat_wadou3a2_lilamrad.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_al3afiya.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_lilso2lol_wlilawram.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_lilza7ir.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_lita3asor_alwilada.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_liwaja3_albaten_walcolon.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_liwaja3_alfam.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_liwaja3_alra2s_walisoda3_walisomm.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_li7al_almarbout.dart';
import 'al2ad3iya wal3awzat lil2alam wal2askam/awzat_al7oma.dart';

class Al2ad3iyaWal3awzatLil2alamWal2askam extends StatefulWidget {
  static String screenRoute = 'al2ad3iya_wal3awzat_lil2alam_wal2askam_screen';
  Al2ad3iyaWal3awzatLil2alamWal2askam({super.key});

  @override
  State<Al2ad3iyaWal3awzatLil2alamWal2askam> createState() =>
      _Al2ad3iyaWal3awzatLil2alamWal2askamState();
}

class _Al2ad3iyaWal3awzatLil2alamWal2askamState
    extends State<Al2ad3iyaWal3awzatLil2alamWal2askam> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
          Provider.of<SearchProvider>(context, listen: false);
      final jsonService = JsonService();

      final albakiyatList = await jsonService.getAlbakiyatAlsalihat();

      final albakiyatSection = albakiyatList.firstWhere(
        (item) => item.title.contains('الادعية والعوذات للالام والاسقام ولعلل الاعضاء والحمى وغيرها'),
        orElse: () =>
            throw Exception('لم يتم العثور على الادعية والعوذات للالام والاسقام ولعلل الاعضاء والحمى وغيرها'),
      );

      // نتأكد أن فيه فهرس داخلي (index أو subSections)
      final List<Map<String, dynamic>> mappedList = [];

      if (albakiyatSection.index.isNotEmpty) {
        for (var sub in albakiyatSection.index) {
          mappedList.add({
            'id': sub.id,
            'title': sub.title,
          });
        }
      }
      // تمرير الفهرس إلى SearchProvider
      searchProvider.setItems(mappedList);
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
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
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
                  delegate: DataSearch(searchProvider.filteredItems),
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
                Dou3a2Al3afiya.screenRoute,
                AwzatWadou3a2Lilamrad.screenRoute,
                Dou3a2Liwaja3Alra2sWalisoda3Walisomm.screenRoute,
                Dou3a2Liwaja3Alfam.screenRoute,
                AwzaLiwaja3Alasnan.screenRoute,
                Dou3a2Liwaja3AlbatenWalcolon.screenRoute,
                Dou3a2Lilso2lolWlilawram.screenRoute,
                Dou3a2Lita3asorAlwilada.screenRoute,
                Dou3a2Li7alAlmarbout.screenRoute,
                AwzatAl7oma.screenRoute,
                Dou3a2Lilza7ir.screenRoute,
                Aldou3a2LikarakirAlbatn.screenRoute,
                Aldou3a2Lilbaras.screenRoute,
                AwzaLiwaja3Al3awra.screenRoute,
                AwzaLiwaja3Alrokba.screenRoute,
                AwzaLiwaja3Al3ain.screenRoute,
                Al3awzaLibtalAlsi7r.screenRoute,
                Al7erzMenAl3ain.screenRoute,
                AwzaLidaf3WasawisAlshaitan.screenRoute,
                AwzaLil2amnMenAlsarik.screenRoute,
                AwzaLil3akrab.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'الادعية والعوذات للالام والاسقام ولعلل الاعضاء والحمى وغيرها') {
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
