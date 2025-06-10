import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../Util/items.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';

class ZikrSalawatAyamAl2osbou3 extends StatefulWidget {
  static String screenRoute = 'zikr_salawat_ayam_al2osbou3_screen';
  ZikrSalawatAyamAl2osbou3({super.key});

  @override
  State<ZikrSalawatAyamAl2osbou3> createState() =>
      _ZikrSalawatAyamAl2osbou3State();
}

class _ZikrSalawatAyamAl2osbou3State extends State<ZikrSalawatAyamAl2osbou3> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        searchProvider
            .setItems(AlBaqiyatAlSalehat.zikrSalawatAyamAl2ousbou3List);
      },
    );
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(AlbakiyatAlsali7atHomeScreen.screenRoute);
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
                  delegate: DataSearch(
                      AlBaqiyatAlSalehat.zikrSalawatAyamAl2ousbou3List),
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
