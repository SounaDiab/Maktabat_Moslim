import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/a3mal_layali_kadr_home_screen.dart';
import 'package:provider/provider.dart';

import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../../widgets/search_widget.dart';
import '../search_provider.dart';

class A3malLayalyAlkadr extends StatefulWidget {
  static String screenRoute = 'a3mal_layaly_alkadr_screen';
  const A3malLayalyAlkadr({super.key});

  @override
  State<A3malLayalyAlkadr> createState() => _A3malLayalyAlkadrState();
}

class _A3malLayalyAlkadrState extends State<A3malLayalyAlkadr> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(LayaliKadr.A3malLayalyAlkadrList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(A3malLayaliKadrHomeScreen.screenRoute);
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
                  .pushReplacementNamed(A3malLayaliKadrHomeScreen.screenRoute);
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
        body:
            Consumer<SearchProvider>(builder: (context, searchProvider, child) {
          return SafeArea(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchProvider.filteredItems.length,
                itemBuilder: (context, index) {
                  final item = searchProvider.filteredItems[index];
                  return LineFromIndex(
                    text: item['title']!,
                    route: item['route']!,
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
