import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business logic/cubit/mafatih_aljinan_cubit.dart';
import '../mafatih_aljinan_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'almonajat/almonajat_alsha3baneya.dart';
import 'almonajat/almonajat_belsafar.dart';
import 'almonajat/almonajat_bikashf_alzolm.dart';
import 'almonajat/monajat_al3arifin.dart';
import 'almonajat/monajat_al5a2ifin.dart';
import 'almonajat/monajat_almo3tasimin.dart';
import 'almonajat/monajat_almo7ebin.dart';
import 'almonajat/monajat_almoftakirin.dart';
import 'almonajat/monajat_almoridin.dart';
import 'almonajat/monajat_almotawasilin.dart';
import 'almonajat/monajat_almoti3in_lillah.dart';
import 'almonajat/monajat_alra8ibin.dart';
import 'almonajat/monajat_alrajin.dart';
import 'almonajat/monajat_alshakin.dart';
import 'almonajat/monajat_alshakirin.dart';
import 'almonajat/monajat_alta2ibin.dart';
import 'almonajat/monajat_alzahidin.dart';
import 'almonajat/monajat_alzakirin.dart';
import 'almonajat/monajat_l2amir_almo2minin.dart';
import 'almonajat/salas_kalimat_3an_amir_almo2minin.dart';

class Almonajat extends StatefulWidget {
  static String screenRoute = 'almonajat_screen';
  const Almonajat({super.key});

  @override
  State<Almonajat> createState() => _AlmonajatState();
}

class _AlmonajatState extends State<Almonajat> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.almonajatList);
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
                AlmonajatBelsafar.screenRoute,
                AlmonajatBikashfAlzolm.screenRoute,
                AlmonajatAlsha3baneya.screenRoute,
                MonajatAlta2ibin.screenRoute,
                MonajatAlshakin.screenRoute,
                MonajatAl5a2ifin.screenRoute,
                MonajatAlrajin.screenRoute,
                MonajatAlra8ibin.screenRoute,
                MonajatAlshakirin.screenRoute,
                MonajatAlmoti3inLillah.screenRoute,
                MonajatAlmoridin.screenRoute,
                MonajatAlmo7ebin.screenRoute,
                MonajatAlmotawasilin.screenRoute,
                MonajatAlmoftakirin.screenRoute,
                MonajatAl3arifin.screenRoute,
                MonajatAlzakirin.screenRoute,
                MonajatAlmo3tasimin.screenRoute,
                MonajatAlzahidin.screenRoute,
                MonajatL2amirAlmo2minin.screenRoute,
                SalasKalimat3anAmirAlmo2minin.screenRoute,
              ];
              for (var item in mafatihAljinan) {
                if (item.title == 'المناجاة') {
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
