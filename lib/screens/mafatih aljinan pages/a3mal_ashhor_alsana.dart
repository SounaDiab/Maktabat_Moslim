import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../mafatih_aljinan_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'a3mal ashor alsana/baki_alsana.dart';
import 'a3mal ashor alsana/moharam.dart';
import 'a3mal ashor alsana/rajab.dart';
import 'a3mal ashor alsana/ramadan.dart';
import 'a3mal ashor alsana/sha3ban.dart';
import 'a3mal ashor alsana/shawal.dart';
import 'a3mal ashor alsana/zi_lhoja.dart';

class A3malAshhorAlsana extends StatefulWidget {
  static String screenRoute = 'a3mal_ashhor_alsana_screen';
  A3malAshhorAlsana({super.key});

  @override
  State<A3malAshhorAlsana> createState() => _A3malAshhorAlsanaState();
}

class _A3malAshhorAlsanaState extends State<A3malAshhorAlsana> {
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
          (item) => item.title.contains('اعمال اشهر السنة'),
          orElse: () =>
              throw Exception('لم يتم العثور على اعمال اشهر السنة'),
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
                Moharam.screenRoute,
                Rajab.screenRoute,
                Sha3ban.screenRoute,
                Ramadan.screenRoute,
                Shawal.screenRoute,
                ZiLhoja.screenRoute,
                BakiAlsana.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'اعمال اشهر السنة') {
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
