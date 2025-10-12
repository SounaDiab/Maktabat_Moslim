// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../Util/items.dart';
import '../business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import '../widgets/line_from_index.dart';
import '../widgets/search_widget.dart';
import 'a3mal layali kadr/a3mal_layaly_alkadr.dart';
import 'a3mal layali kadr/al2a3mal_al3ama.dart';
import 'a3mal layali kadr/al2a3mal_al5asa.dart';
import 'a3mal layali kadr/alsowar_alkor2aneya.dart';
import 'books.dart';
import 'search_provider.dart';

class A3malLayaliKadrHomeScreen extends StatefulWidget {
  static String screenRoute = 'a3mal_layali_kadr_home_screen';
  const A3malLayaliKadrHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<A3malLayaliKadrHomeScreen> createState() =>
      _A3malLayaliKadrHomeScreenState();
}

class _A3malLayaliKadrHomeScreenState extends State<A3malLayaliKadrHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProviders =
            Provider.of<SearchProvider>(context, listen: false);
        searchProviders.setItems(LayaliKadr.a3malLayaliKadrList);
      },
    );
    context.read<A3malLaylatAlkaderCubit>().getA3malLaylatAlkader();
  }

  Future<bool> _onWillPop() async {
    final searchProviders = Provider.of<SearchProvider>(context, listen: false);
    searchProviders.clearSearch();
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
                  delegate: DataSearch(LayaliKadr.allItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<A3malLaylatAlkaderCubit, A3malLaylatAlkaderState>(
          builder: (context, state) {
            if (state is A3malLaylatAlkaderLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is A3malLaylatAlkaderLoaded) {
              final a3malLaylatAlkader = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                AlsowarAlkor2aneya.screenRoute,
                A3malLayalyAlkadr.screenRoute,
                Al2a3malAl3ama.screenRoute,
                Al2a3malAl5asa.screenRoute
              ];
              for (var item in a3malLaylatAlkader) {
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
            } else if (state is A3malLaylatAlkaderError) {
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
