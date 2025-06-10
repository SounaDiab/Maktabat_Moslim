import 'package:flutter/material.dart';

import '../quran/quran.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Container(
      width: screenSize.width,
      child: Image.asset(
        pageDir(pageIndex + 1),
        fit: isLandscape ? BoxFit.fitWidth : BoxFit.fill,
        width: screenSize.width,
      ),
    );
  }
}
