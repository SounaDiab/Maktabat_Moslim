import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../Util/items.dart';
import 'books.dart';
import '../widgets/line_from_index.dart';
import 'mafatih aljinan pages/a3mal_almasajed_walziyarat.dart';
import 'mafatih aljinan pages/a3mal_ashhor_alsana.dart';
import 'mafatih aljinan pages/ad3iya_mashhoura.dart';
import 'mafatih aljinan pages/ad3iyat_al2osbo3.dart';
import 'mafatih aljinan pages/almonajat.dart';
import 'mafatih aljinan pages/lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'mafatih aljinan pages/ta3kibat.dart';
import 'mafatih aljinan pages/ziarat_al2osbou3.dart';
import 'search_provider.dart';

class MafatihAljinanHomeScreen extends StatefulWidget {
  static String screenRoute = 'mafatih_aljinan_home_screen';
  const MafatihAljinanHomeScreen({super.key});

  @override
  State<MafatihAljinanHomeScreen> createState() =>
      _MafatihAljinanHomeScreenState();
}

class _MafatihAljinanHomeScreenState extends State<MafatihAljinanHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.mafatihAljinanHomeScreenList);
      },
    );
    context.read<MafatihAljinanCubit>().getMafatihAljinan();
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context).pushReplacementNamed(Books.screenRoute);
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
                Ta3kibat.screenRoute,
                ZiaratAl2osbou3.screenRoute,
                Ad3iyatAl2osbo3.screenRoute,
                LailatAljom3aWnaharahaW2a3malaha.screenRoute,
                Ad3iyaMashhoura.screenRoute,
                Almonajat.screenRoute,
                A3malAshhorAlsana.screenRoute,
                A3malAlmasajedWalziyarat.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                allTitles.add({
                  'title': item.title,
                  'route': allRoutes.map((e) => e).toList()[item.id - 1],
                });
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
