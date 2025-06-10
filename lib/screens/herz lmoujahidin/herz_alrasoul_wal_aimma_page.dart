import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/Util/items.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:maktabat_almoslim/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/line_from_index.dart';
import '../search_provider.dart';

class HerzAlrasoulWalAimmaPage extends StatefulWidget {
  static String screenRoute = 'herzalrasoulwalaimma_screen';
  const HerzAlrasoulWalAimmaPage({super.key});

  @override
  State<HerzAlrasoulWalAimmaPage> createState() =>
      _HerzAlrasoulWalAimmaPageState();
}

class _HerzAlrasoulWalAimmaPageState extends State<HerzAlrasoulWalAimmaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(HerzAlmoujahidin.herzAlrasoulWal2a2imaList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
    return false;
  }

  

  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).textScaleFactor;
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
                  .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
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
                  delegate: DataSearch(HerzAlmoujahidin.allItems),
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
                  return ListTile(
                    title: LineFromIndex(
                      text: item['title']!,
                      route: item['route']!,
                    ),
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
