import 'dart:io';

import '../../../Util/app_imports.dart';
import '../../../widgets/page_directory_download_image_widget.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key, required this.pageIndex}) : super(key: key);

  final int pageIndex;

  // دالة للحصول على المسار المحلي للصورة
  Future<String> getImagePath(int pageIndex) async {
    return await getImagePath(pageIndex + 1);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return FutureBuilder<String>(
      future: pageDirectory(pageIndex + 1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).dividerColor,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Icon(Icons.error));
        } else if (snapshot.hasData) {
          final imagePath = snapshot.data!;
          return Container(
            color: Theme.of(context).cardColor,
            padding: EdgeInsets.all(isTablet ? 10 : 0),
            width: screenSize.width,
            child: Image.file(
              File(imagePath), // عرض الصورة من المسار المحلي
              fit: isLandscape ? BoxFit.fitWidth : BoxFit.fill,
              width: screenSize.width,
            ),
          );
        } else {
          return Center(child: Text('No image found'));
        }
      },
    );
  }
}
