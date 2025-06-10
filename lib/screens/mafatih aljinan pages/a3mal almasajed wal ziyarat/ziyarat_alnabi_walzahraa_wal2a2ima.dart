import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../../Util/items.dart';
import '../../../widgets/line_from_index.dart';
import '../../search_provider.dart';
import '../a3mal_almasajed_walziyarat.dart';

class ZiyaratAlnabiWalzahraaWal2a2ima extends StatefulWidget {
  static String screenRoute = 'ziyarat_alnabi_walzahraa_wal2a2ima_screen';
  ZiyaratAlnabiWalzahraaWal2a2ima({super.key});

  @override
  State<ZiyaratAlnabiWalzahraaWal2a2ima> createState() =>
      _ZiyaratAlnabiWalzahraaWal2a2imaState();
}

class _ZiyaratAlnabiWalzahraaWal2a2imaState
    extends State<ZiyaratAlnabiWalzahraaWal2a2ima> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider.setItems(Items.ziyaratAlnabiWalzahraaWal2a2imaList);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(A3malAlmasajedWalziyarat.screenRoute);
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
                  .pushReplacementNamed(A3malAlmasajedWalziyarat.screenRoute);
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
