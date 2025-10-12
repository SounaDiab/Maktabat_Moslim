import 'package:maktabat_almoslim/api/models/mafati7_aljinan.dart';

import '../models/a3mal_laylat_kader.dart';
import '../models/albakiyat_alsalihat.dart';
import '../models/alhakiba_alramadaneya.dart';
import '../models/herz_almoujahidin.dart';
import '../web%20service/json_service.dart';

class Repository {
  final JsonService jsonService;

  Repository(this.jsonService);

  //! أعمال ليلة القدر
  Future<List<A3malLaylatKader>> getA3malLaylatAlkader() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<A3malLaylatKader> data = await jsonService.getA3malLaylatAlkader();
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
      final List<HerzAlmoujahidinModel> data = await jsonService.getHerzAlmoujahidin();
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
      final List<AlhakibaAlramadaneyaModel> data = await jsonService.getAlhakibaAlramadaneya();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }

  //! مفاتيح الجنان
  Future<List<MafatihAljinanModel>> getMafatihAljinan() async {
    try {
      // نستخدم الدالة الموجودة في JsonService لجلب البيانات
      final List<MafatihAljinanModel> data = await jsonService.getMafatihAljinan();
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
      final List<AlbakiyatAlsalihatModel> data = await jsonService.getAlbakiyatAlsalihat();
      return data;
    } catch (e) {
      // يمكنك هنا إضافة معالجة للأخطاء إذا أحببت
      rethrow;
    }
  }
}
