import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../mafatih_aljinan_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'ad3iyat al2osbo3/dou3a2_al2a7ad.dart';
import 'ad3iyat al2osbo3/dou3a2_al2arbi3a2.dart';
import 'ad3iyat al2osbo3/dou3a2_al2isnain.dart';
import 'ad3iyat al2osbo3/dou3a2_al5amis.dart';
import 'ad3iyat al2osbo3/dou3a2_aljom3a.dart';
import 'ad3iyat al2osbo3/dou3a2_alsabt.dart';
import 'ad3iyat al2osbo3/dou3a2_alsoulasa2.dart';

class Ad3iyatAl2osbo3 extends StatefulWidget {
  static String screenRoute = 'ad3iyat_al2osbou3_screen';
  Ad3iyatAl2osbo3({super.key});

  @override
  State<Ad3iyatAl2osbo3> createState() => _Ad3iyatAl2osbo3State();
}

class _Ad3iyatAl2osbo3State extends State<Ad3iyatAl2osbo3> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.ad3iyat2al2ousbou3List);
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
                  .pushReplacementNamed(MafatihAljinanHomeScreen.screenRoute);
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
                Dou3a2Al2a7ad.screenRoute,
                Dou3a2Al2isnain.screenRoute,
                Dou3a2Alsoulasa2.screenRoute,
                Dou3a2Al2arbi3a2.screenRoute,
                Dou3a2Al5amis.screenRoute,
                Dou3a2Aljom3a.screenRoute,
                Dou3a2Alsabt.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'ادعية ايام الاسبوع') {
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
