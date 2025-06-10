import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:maktabat_almoslim/screens/kor2an/core/index.dart';
import 'package:provider/provider.dart';

import 'books.dart';
import 'kor2an/providers/quran.dart';
import 'kor2an/providers/show_overlay_provider.dart';
import 'kor2an/quran/page_data.dart';
import 'kor2an/widgets/custom_toast.dart';
import 'kor2an/widgets/info_overlay/info_overlay.dart';
import 'kor2an/widgets/marker.dart';
// import 'kor2an/widgets/page_number.dart';
import 'kor2an/widgets/quran_page.dart';
// import 'kor2an/widgets/simple_page_info.dart';
import 'search_provider.dart';

class QuranHomeScreen extends StatefulWidget {
  static String screenRoute = 'quran_home_screen_screen';

  QuranHomeScreen({Key? key}) : super(key: key);

  @override
  State<QuranHomeScreen> createState() => _QuranHomeScreenState();
}

// class _QuranHomeScreenState extends State<QuranHomeScreen> {
//   Future<bool> _onWillPop() async {
//     final searchProvider = Provider.of<SearchProvider>(context, listen: false);
//     searchProvider.clearSearch();
//     Navigator.of(context).pushReplacementNamed(Books.screenRoute);
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth >= 600;
//     final quran = Provider.of<Quran>(context);
//     final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
//     final quranListenFalse = Provider.of<Quran>(context, listen: false);

//     debugPrint('Hole rebuild');
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: SafeArea(
//         child: GestureDetector(
//           onTap: overlay.toggleisShowOverlay,
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   margin: isTablet ? EdgeInsets.all(10) : EdgeInsets.all(0),
//                   child: CarouselSlider.builder(
//                     carouselController: quran.carouselController,
//                     options: CarouselOptions(
//                         enableInfiniteScroll: false,
//                         height: double.infinity,
//                         initialPage: quran.currentPage - 1,
//                         viewportFraction: 1,
//                         enlargeCenterPage: false,
//                         onPageChanged: (int newIndex, _) {
//                           quranListenFalse.changePage(newIndex);
//                         }),
//                     itemCount: quranPages.length,
//                     itemBuilder: (_, pageIndex, __) {
//                       return QuranPage(pageIndex: pageIndex);
//                     },
//                   ),
//                 ),
//                 const Marker(),
//                 if (!overlay.isShowOverlay) const CustomToast(),
//                 InfoOverlay(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _QuranHomeScreenState extends State<QuranHomeScreen> {
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
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    final quran = Provider.of<Quran>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
    final quranListenFalse = Provider.of<Quran>(context, listen: false);

    debugPrint('Hole rebuild');

    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: GestureDetector(
          onTap: overlay.toggleisShowOverlay,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: isTablet ? const EdgeInsets.all(10) : EdgeInsets.zero,
                  child: isLandscape
                      ? _VerticalScrollPages() // Scroll عمودي في الوضع الأفقي
                      : _HorizontalCarousel(
                          quran: quran,
                          quranListenFalse: quranListenFalse), // الوضع العمودي
                ),
                const Marker(),
                if (!overlay.isShowOverlay) const CustomToast(),
                InfoOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Landscape Mode
class _VerticalScrollPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: quranPages.length,
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (context, index) {
        return Center(child: QuranPage(pageIndex: index));
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade300,
        thickness: 1,
        height: 20,
        indent: 20,
        endIndent: 20,
      ),
    );
  }
}

// Portrait Mode
class _HorizontalCarousel extends StatefulWidget {
  final Quran quran;
  final Quran quranListenFalse;

  const _HorizontalCarousel({
    required this.quran,
    required this.quranListenFalse,
  });

  @override
  State<_HorizontalCarousel> createState() => _HorizontalCarouselState();
}

class _HorizontalCarouselState extends State<_HorizontalCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: widget.quran.carouselController,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        height: double.infinity,
        initialPage: widget.quran.currentPage - 1,
        viewportFraction: 1,
        enlargeCenterPage: false,
        onPageChanged: (int newIndex, _) {
          widget.quranListenFalse.changePage(newIndex);
        },
      ),
      itemCount: quranPages.length,
      itemBuilder: (_, pageIndex, __) {
        return QuranPage(pageIndex: pageIndex);
      },
    );
  }
}
