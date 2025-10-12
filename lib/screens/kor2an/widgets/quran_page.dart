import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../widgets/cache_manager_widget.dart';
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
      // child: Image.network(
      //   pageDir(pageIndex + 1),
      //   fit: isLandscape ? BoxFit.fitWidth : BoxFit.fill,
      //   width: screenSize.width,
      // ),
      child: CachedNetworkImage(
        imageUrl: pageDir(pageIndex + 1),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: isLandscape ? BoxFit.fitWidth : BoxFit.fill,
        width: screenSize.width,
        cacheManager: CacheManagerWidget.instance,
      ),
    );
  }
}
