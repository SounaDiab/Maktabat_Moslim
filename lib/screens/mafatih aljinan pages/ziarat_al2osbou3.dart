import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Util/items.dart';
import '../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../mafatih_aljinan_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'ziarat al2osbo3/ziarat_al2a7ad.dart';
import 'ziarat al2osbo3/ziarat_al2arbi3a2.dart';
import 'ziarat al2osbo3/ziarat_al2isnain.dart';
import 'ziarat al2osbo3/ziarat_al5amis.dart';
import 'ziarat al2osbo3/ziarat_aljom3a.dart';
import 'ziarat al2osbo3/ziarat_alsabt.dart';
import 'ziarat al2osbo3/ziarat_alsoulasa2.dart';

class ZiaratAl2osbou3 extends StatefulWidget {
  static String screenRoute = 'ziarat_al2osbou3_screen';
  ZiaratAl2osbou3({super.key});

  @override
  State<ZiaratAl2osbou3> createState() => _ZiaratAl2osbou3State();
}

class _ZiaratAl2osbou3State extends State<ZiaratAl2osbou3> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.ziyaratAl2ousbou3List);
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
                ZiaratAl2a7ad.screenRoute,
                ZiaratAl2isnain.screenRoute,
                ZiaratAlsoulasa2.screenRoute,
                ZiaratAl2arbi3a2.screenRoute,
                ZiaratAl5amis.screenRoute,
                ZiaratAljom3a.screenRoute,
                ZiaratAlsabt.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'زيارات ايام الاسبوع') {
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
