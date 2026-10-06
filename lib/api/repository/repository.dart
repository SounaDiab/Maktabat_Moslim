import '../../Util/app_imports.dart';

class Repository {
  final JsonService jsonService;
  List<MafatihAljinanModel>? _cachedData;

  Repository(this.jsonService);

  //! أعمال ليلة القدر
  Future<List<A3malLaylatKader>> getA3malLaylatAlkader() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<A3malLaylatKader> data =
          await jsonService.getA3malLaylatAlkader();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! حرز المجاهدين
  Future<List<HerzAlmoujahidinModel>> getHerzAlmoujahidin() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<HerzAlmoujahidinModel> data =
          await jsonService.getHerzAlmoujahidin();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! الحقيبة الرمضانية
  Future<List<AlhakibaAlramadaneyaModel>> getAlhakibaAlramadaneya() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<AlhakibaAlramadaneyaModel> data =
          await jsonService.getAlhakibaAlramadaneya();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! مفاتيح الجنان
  Future<List<MafatihAljinanModel>> getMafatihAljinan() async {
    try {
      if (_cachedData != null) {
        return _cachedData!;
      }
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<MafatihAljinanModel> data =
          await jsonService.getMafatihAljinan();
      _cachedData = data;
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! الباقيات الصالحات
  Future<List<AlbakiyatAlsalihatModel>> getAlbakiyatAlsalihat() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<AlbakiyatAlsalihatModel> data =
          await jsonService.getAlbakiyatAlsalihat();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! الصحيفة السجادية
  Future<List<Alsa7ifaAlsajadiyaModel>> getAlsa7ifaAlsajadiya() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<Alsa7ifaAlsajadiyaModel> data =
          await jsonService.getAlsa7ifaAlsajadiya();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! صلاة الليل
  Future<List<SalatLailModel>> getSalatLail() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<SalatLailModel> data = await jsonService.getSalatLail();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! wisdom of day
  Future<List<DailyItem>> getWelcomScreen() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<DailyItem> data = await jsonService.getWelcomScreen();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! quran touch
  Future<List<DailyItem>> getQuranTouch() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<DailyItem> data = await jsonService.getQuranTouch();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! image of day
  Future<List<DailyItem>> getImageOfDay() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<DailyItem> data = await jsonService.getImageOfDay();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }
}
