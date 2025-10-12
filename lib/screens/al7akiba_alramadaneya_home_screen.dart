import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business logic/cubit/alhakiba_alramadaneya_cubit.dart';
import 'al7akiba alramadaneya/a3mal_w2ad3iyat_layali_ramadan.dart';
import 'al7akiba alramadaneya/a3mal_wa2ad3iyat_ayam_ramadan.dart';
import 'al7akiba alramadaneya/fi_a3mal_ashar_ramadan.dart';
import 'al7akiba alramadaneya/fima_ya3om_allayali_wal2ayam.dart';
import 'al7akiba alramadaneya/fima_yosta7ab_2itanoh_fi_ramadan.dart';
import 'books.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import '../Util/items.dart';

import '../widgets/line_from_index.dart';
import '../widgets/search_widget.dart';
import 'search_provider.dart';

class Al7akibaAlramadaneyaHomeScreen extends StatefulWidget {
  static String screenRoute = 'al7akiba_alramadaneya_home_screen';
  const Al7akibaAlramadaneyaHomeScreen({super.key});

  @override
  State<Al7akibaAlramadaneyaHomeScreen> createState() =>
      _Al7akibaAlramadaneyaHomeScreenState();
}

class _Al7akibaAlramadaneyaHomeScreenState
    extends State<Al7akibaAlramadaneyaHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Al7akibaAlramadaneya.al7akibaAlramadaneyaList);
      },
    );
    context.read<AlhakibaAlramadaneyaCubit>().getAlhakibaAlramadaneya();
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
                  delegate: DataSearch(Al7akibaAlramadaneya.allItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<AlhakibaAlramadaneyaCubit, AlhakibaAlramadaneyaState>(
          builder: (context, state) {
            if (state is AlhakibaAlramadaneyaLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlhakibaAlramadaneyaLoaded) {
              final alhakibaAlramadaneya = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                FimaYa3omAllayaliWal2ayam.screenRoute,
                FimaYosta7ab2itanohFiRamadan.screenRoute,
                FiA3malAsharRamadan.screenRoute,
                A3malWa2ad3iyatAyamRamadan.screenRoute,
                A3malW2ad3iyatLayaliRamadan.screenRoute,
              ];
              for (var item in alhakibaAlramadaneya) {
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
            } else if (state is AlhakibaAlramadaneyaError) {
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
