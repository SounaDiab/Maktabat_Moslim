import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../../widgets/search_widget.dart';
import '../other_screen.dart';
import '../search_provider.dart';

class SalatAllayl extends StatefulWidget {
  static String screenRoute = 'salat_allayl_screen';
  const SalatAllayl({super.key});

  @override
  State<SalatAllayl> createState() => _SalatAllaylState();
}

class _SalatAllaylState extends State<SalatAllayl> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(OtherScreenn.salatAllaylItemList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context).pushReplacementNamed(OtherScreen.screenRoute);
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
                  delegate: DataSearch(OtherScreenn.allItems),
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
