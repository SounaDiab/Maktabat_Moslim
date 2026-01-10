import '../Util/app_imports.dart';

class BooksItem {
  static final List<String> bookstitle = [
    'القرآن الكريم',
    'مفاتيح الجنان',
    'حرز المجاهدين',
    'أعمال ليالي القدر',
    'الحقيبة الرمضانية',
    'الباقيات الصالحات',
    'الصحيفة السجادية',
  ];
  static final List<String> booksSrc = [
    'images/kor2an.png',
    'images/mafatih_aljinan.png',
    'images/herz_almojahidin.png',
    'images/layali_kadr.png',
    'images/al7akiba_alramadaneya.png',
    'images/albakiyat_alsali7at.png',
    'images/alsahifa_alsajadiya.png',
  ];
  static final List<String> booksRoute = [
    QuranHomeScreen.screenRoute,
    MafatihAljinanHomeScreen.screenRoute,
    HerzAlmoujahidinHomeScreen.screenRoute,
    A3malLayaliKadrHomeScreen.screenRoute,
    Al7akibaAlramadaneyaHomeScreen.screenRoute,
    AlbakiyatAlsali7atHomeScreen.screenRoute,
    Alsa7ifaAlsajadiyaHomeScreen.screenRoute,
  ];
}
