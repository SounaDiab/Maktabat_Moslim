import '../../Util/app_imports.dart';
export 'package:archive/archive.dart';

class JsonService {
  // قراءة JSON عادي
  Future<dynamic> loadJson(String path) async {
    String jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString);
  }

  // قراءة JSON مضغوط ZIP
  final Map<String, dynamic> _cache = {};

  Future<dynamic> loadCompressedJson(
      String zipPath, String jsonFileName) async {
    // إرجاع من الـ cache إذا موجود
    if (_cache.containsKey(zipPath)) return _cache[zipPath];

    final byteData = await rootBundle.load(zipPath);
    final bytes = byteData.buffer.asUint8List();

    final result = await compute(
      _decompressAndDecodeJson,
      {
        'bytes': bytes,
        'jsonFileName': jsonFileName,
      },
    );

    // حفظ في الـ cache
    _cache[zipPath] = result;
    return result;
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
        '$baseUrl/alhakiba_alramadaneya.json.zip',
        'alhakiba_alramadaneya.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData
          .map((e) => AlhakibaAlramadaneyaModel.fromJson(e))
          .toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! مفاتيح الجنان
  Future<List<MafatihAljinanModel>> getMafatihAljinan() async {
    final jsonData = await loadCompressedJson(
      '$baseUrl/mafatih_aljinan.json.zip',
      'mafatih_aljinan.json',
    );

    if (jsonData is List) {
      return jsonData.map((e) => MafatihAljinanModel.fromJson(e)).toList();
    }
    throw Exception('تنسيق JSON غير صحيح، متوقع List');
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

  //! الصحيفة السجادية
  Future<List<Alsa7ifaAlsajadiyaModel>> getAlsa7ifaAlsajadiya() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/alsa7ifa_alsajadiya.json.zip', 'alsa7ifa_alsajadiya.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => Alsa7ifaAlsajadiyaModel.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! صلاة الليل
  Future<List<SalatLailModel>> getSalatLail() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/salat_lail.json.zip', 'salat_lail.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => SalatLailModel.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! wisdom of day
  Future<List<DailyItem>> getWelcomScreen() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/wisdom_of_day.json.zip', 'wisdom_of_day.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => DailyItem.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! quran Touch
  Future<List<DailyItem>> getQuranTouch() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/quran_touch.json.zip', 'quran_touch.json');

    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => DailyItem.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }

  //! image of day
  Future<List<DailyItem>> getImageOfDay() async {
    // نقوم بتحميل JSON مضغوط من ملف zip ثم نقرأ JSON داخله
    final jsonData = await loadCompressedJson(
        '$baseUrl/image_of_day.json.zip', 'image_of_day.json');
    // jsonData هنا متوقع يكون List<dynamic> أو Map حسب هيكل JSON
    // لنفترض أن جذر JSON هو List
    if (jsonData is List) {
      // تحويل كل عنصر من json إلى موديل HerzAlmoujahidin
      return jsonData.map((e) => DailyItem.fromJson(e)).toList();
    } else {
      throw Exception('تنسيق JSON غير صحيح، متوقع List');
    }
  }
}

dynamic _decompressAndDecodeJson(Map<String, dynamic> params) {
  final Uint8List bytes = params['bytes'];
  final String jsonFileName = params['jsonFileName'];

  // فك الضغط
  final archive = ZipDecoder().decodeBytes(bytes);

  // البحث عن الملف
  for (final file in archive) {
    if (file.isFile && file.name == jsonFileName) {
      final jsonString = utf8.decode(file.content as List<int>);
      return jsonDecode(jsonString);
    }
  }

  throw Exception('لم يتم العثور على $jsonFileName');
}
