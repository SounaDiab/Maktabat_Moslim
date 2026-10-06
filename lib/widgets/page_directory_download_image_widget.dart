import 'dart:io';

import 'package:http/http.dart' as http;
import '../../Util/app_imports.dart';

// دالة لتحميل الصورة وتخزينها في المجلد الدائم
Future<String> pageDirectory(int pageNumber) async {
  final url =
      'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/quran_images/page${formattedPageNumber(pageNumber)}.png';

  final dir = await getApplicationDocumentsDirectory();
  final filePath = '${dir.path}/page$pageNumber.png';
  final file = File(filePath);
  print('Path: $filePath');

  // إذا كانت الصورة غير موجودة في المسار المحلي، نقوم بتحميلها
  if (!file.existsSync()) {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        print('Image downloaded and saved to local storage.');
      } else {
        throw Exception('Failed to download image');
        print('url: $url');
      }
    } catch (e) {
      print('Error downloading image: $e');
      print('url: $url');
      rethrow; // إعادة رمي الاستثناء لالتقاطه في الأماكن المناسبة
    }
  } else {
    print('Image already exists in local storage');
  }

  return filePath;
}

// تنسيق رقم الصفحة لإضافة الصفر إذا كانت الصفحة أقل من 10
String formattedPageNumber(int number) {
  if (number < 10) return '00$number';
  if (number < 100) return '0$number';
  return '$number';
}
