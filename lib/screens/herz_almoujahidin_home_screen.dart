import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/books.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import '../Util/items.dart';

import '../widgets/line_from_index.dart';
import '../widgets/line_from_index_for_rasoul_wal2a2ima.dart';
import '../widgets/search_widget.dart';
import 'search_provider.dart';

class HerzAlmoujahidinHomeScreen extends StatefulWidget {
  static String screenRoute = 'home_screen';
  const HerzAlmoujahidinHomeScreen({super.key});

  @override
  State<HerzAlmoujahidinHomeScreen> createState() =>
      _HerzAlmoujahidinHomeScreenState();
}

class _HerzAlmoujahidinHomeScreenState
    extends State<HerzAlmoujahidinHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider
            .setItems(HerzAlmoujahidin.herzAlmoujahidinHomeScreenList);
      },
    );
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
                    title: item['title']! == 'حرز الرسول ص والأئمة (ع)'
                        ? LineFromIndexForRasoulWal2a2ima(
                            text: item['title']!,
                            route: item['route']!,
                            icon: Icons.arrow_forward_ios,
                          )
                        : LineFromIndex(
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
