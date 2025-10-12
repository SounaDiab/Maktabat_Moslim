import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:archive/archive.dart';

import '../../constants/String.dart';
import '../models/a3mal_laylat_kader.dart';
import '../models/albakiyat_alsalihat.dart';
import '../models/alhakiba_alramadaneya.dart';
import '../models/herz_almoujahidin.dart';
import '../models/mafati7_aljinan.dart';

class JsonService {
  // قراءة JSON عادي
  Future<dynamic> loadJson(String path) async {
    String jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString);
  }

  // قراءة JSON مضغوط ZIP
  Future<dynamic> loadCompressedJson(
      String zipPath, String jsonFileName) async {
    // قراءة ملف zip من الـ assets
    final byteData = await rootBundle.load(zipPath);
    final bytes = byteData.buffer.asUint8List();

    // فك الضغط باستخدام مكتبة archive
    final archive = ZipDecoder().decodeBytes(bytes);

    // البحث عن ملف json داخل الـ zip
    for (final file in archive) {
      if (file.isFile && file.name == jsonFileName) {
        final jsonString = utf8.decode(file.content as List<int>);
        return jsonDecode(jsonString);
      }
    }

    throw Exception("لم يتم العثور على ملف $jsonFileName داخل $zipPath");
  }

  //! أعمال ليلة القدر
  Future<List<A3malLaylatKader>> getA3malLaylatAlkader() async {
    // نقوم بتحميل json مضغوط من ملف zip ثم نقرأ json داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/a3mal_lailat_alkader.json.zip', 'a3mal_lailat_alkader.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل A3malLaylatKader
      return jsonData.map((e) => A3malLaylatKader.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق json غير صحيح، متوقع List');
    }
  }

  //! حرز المجاهدين
  Future<List<HerzAlmoujahidinModel>> getHerzAlmoujahidin() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/herz_almoujahidin.json.zip', 'herz_almoujahidin.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => HerzAlmoujahidinModel.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! الحقيبة الرمضانية
  Future<List<AlhakibaAlramadaneyaModel>> getAlhakibaAlramadaneya() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/alhakiba_alramadaneya.json.zip', 'alhakiba_alramadaneya.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => AlhakibaAlramadaneyaModel.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! مفاتيح الجنان
  Future<List<MafatihAljinanModel>> getMafatihAljinan() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/mafatih_aljinan.json.zip', 'mafatih_aljinan.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => MafatihAljinanModel.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! الباقيات الصالحات
  Future<List<AlbakiyatAlsalihatModel>> getAlbakiyatAlsalihat() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/albakiyat_alsalihat.json.zip', 'albakiyat_alsalihat.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => AlbakiyatAlsalihatModel.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }
}
