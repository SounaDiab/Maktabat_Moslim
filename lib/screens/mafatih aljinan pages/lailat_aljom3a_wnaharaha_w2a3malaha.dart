import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../mafatih_aljinan_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/a3mal_lailat_aljom3a.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/a3mal_nahar_aljom3a.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_2imam_almahdi.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_al3askari.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_albaker.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alhadi.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alhassan.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alhussein.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_aljawad.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alkazem.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alrida.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alsadek.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_zain_al3abidin.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_alnabi.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_alsaida_alzahraa.dart';
import 'lailat aljom3a wnaharaha w2a3malaha/salat_amir_amo2minin.dart';

class LailatAljom3aWnaharahaW2a3malaha extends StatefulWidget {
  static String screenRoute = 'lailat_aljom3a_wanaharaha_w2a3malaha_screen';
  const LailatAljom3aWnaharahaW2a3malaha({super.key});

  @override
  State<LailatAljom3aWnaharahaW2a3malaha> createState() =>
      _LailatAljom3aWnaharahaW2a3malahaState();
}

class _LailatAljom3aWnaharahaW2a3malahaState
    extends State<LailatAljom3aWnaharahaW2a3malaha> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();

        final mafatihList = await jsonService.getMafatihAljinan();

        final mafatihSection = mafatihList.firstWhere(
          (item) => item.title.contains('ليلة الجمعة ونهارها واعمالها'),
          orElse: () =>
              throw Exception('لم يتم العثور على ليلة الجمعة ونهارها واعمالها'),
        );

        // نتأكد أن فيه فهرس داخلي (index أو subSections)
        final List<Map<String, dynamic>> mappedList = [];

        if (mafatihSection.index.isNotEmpty) {
          for (var sub in mafatihSection.index) {
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
        .pushReplacementNamed(MafatihAljinanHomeScreen.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final searchProvider =
                  Provider.of<SearchProvider>(context, listen: false);
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
                A3malLailatAljom3a.screenRoute,
                A3malNaharAljom3a.screenRoute,
                SalatAlnabi.screenRoute,
                SalatAmirAmo2minin.screenRoute,
                SalatAlsaidaAlzahraa.screenRoute,
                SalatAl2imamAlhassan.screenRoute,
                SalatAl2imamAlhussein.screenRoute,
                SalatAl2imamZainAl3abidin.screenRoute,
                SalatAl2imamAlbaker.screenRoute,
                SalatAl2imamAlsadek.screenRoute,
                SalatAl2imamAlkazem.screenRoute,
                SalatAl2imamAlrida.screenRoute,
                SalatAl2imamAljawad.screenRoute,
                SalatAl2imamAlhadi.screenRoute,
                SalatAl2imamAl3askari.screenRoute,
                Salat2imamAlmahdi.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'ليلة الجمعة ونهارها واعمالها') {
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
