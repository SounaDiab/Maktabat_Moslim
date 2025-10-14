import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/web service/json_service.dart';
import '../../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_almasajed_walziyarat.dart';
import 'ziyarat alhussein/al2oula_almo5asasa.dart';
import 'ziyarat alhussein/al5amisa_almo5asasa.dart';
import 'ziyarat alhussein/alrbi3a_almo5asasa.dart';
import 'ziyarat alhussein/alsadbi3a_almo5asasa.dart';
import 'ziyarat alhussein/alsadbi3a_almo5asasa_alsania.dart';
import 'ziyarat alhussein/alsadisa_almo5asasa.dart';
import 'ziyarat alhussein/alsalisa_almo5asasa.dart';
import 'ziyarat alhussein/alsamina_almo5asasa.dart';
import 'ziyarat alhussein/alsania_almo5asasa.dart';
import 'ziyarat alhussein/alziyarat_al2o5ra.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_al2oula.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_al5amisa.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_alrabi3a.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_alsabi3a.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_alsadisa.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_alsalisa.dart';
import 'ziyarat alhussein/alziyarat_almotlaka_alsaniya.dart';
import 'ziyarat alhussein/fadl_torbat_alhussein.dart';
import 'ziyarat alhussein/fi_fadl_ziyarat_alhussein.dart';
import 'ziyarat alhussein/fima_3ala_alza2ir_mora3atoh.dart';
import 'ziyarat alhussein/ziyarat_3ashoraa.dart';
import 'ziyarat alhussein/ziyarat_al3abas_ben_3ali.dart';

class ZiyaratAlhousseinWa2adabiha extends StatefulWidget {
  static String screenRoute = 'ziyarat_alhoussein_wa2adabiha_screen';
  ZiyaratAlhousseinWa2adabiha({super.key});

  @override
  State<ZiyaratAlhousseinWa2adabiha> createState() =>
      _ZiyaratAlhousseinWa2adabihaState();
}

class _ZiyaratAlhousseinWa2adabihaState
    extends State<ZiyaratAlhousseinWa2adabiha> {
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
          (item) => item.title.contains('اعمال المساجد والزيارات'),
          orElse: () =>
              throw Exception('لم يتم العثور على اعمال المساجد والزيارات'),
        );

        // قائمة المستوى الثالث
        final List<Map<String, dynamic>> mappedList = [];

        if (mafatihSection.index.isNotEmpty) {
          for (var sub in mafatihSection.index) {
            // الآن نتحقق من وجود index داخلي (المستوى الثالث)
            if (sub.index.isNotEmpty) {
              if (sub.title == "زيارات الحسين (ع) آدابها وفضلها") {
                for (var subSub in sub.index) {
                  mappedList.add({
                    'id': subSub.id,
                    'title': subSub.title,
                  });
                }
              }
            }
          }
        }

        // تمرير بيانات المستوى الثالث إلى SearchProvider
        searchProvider.setItems(mappedList);
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
                Ziyarat3ashoraa.screenRoute,
                FiFadlZiyaratAlhussein.screenRoute,
                Fima3alaAlza2irMora3atoh.screenRoute,
                AlziyaratAlmotlakaAl2oula.screenRoute,
                AlziyaratAlmotlakaAlsaniya.screenRoute,
                AlziyaratAlmotlakaAlsalisa.screenRoute,
                AlziyaratAlmotlakaAlrabi3a.screenRoute,
                AlziyaratAlmotlakaAl5amisa.screenRoute,
                AlziyaratAlmotlakaAlsadisa.screenRoute,
                AlziyaratAlmotlakaAlsabi3a.screenRoute,
                ZiyaratAl3abasBen3ali.screenRoute,
                Al2oulaAlmo5asasa.screenRoute,
                AlsaniaAlmo5asasa.screenRoute,
                AlsalisaAlmo5asasa.screenRoute,
                Alrbi3aAlmo5asasa.screenRoute,
                Al5amisaAlmo5asasa.screenRoute,
                AlsadisaAlmo5asasa.screenRoute,
                Alsadbi3aAlmo5asasa.screenRoute,
                Alsadbi3aAlmo5asasaAlsania.screenRoute,
                AlsaminaAlmo5asasa.screenRoute,
                AlziyaratAl2o5ra.screenRoute,
                FadlTorbatAlhussein.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال المساجد والزيارات') {
                  for (var subItem in item.index) {
                    if (subItem.title == 'زيارات الحسين (ع) آدابها وفضلها') {
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
