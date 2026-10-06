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
  static final List<Widget> booksRoute = [
    QuranHomeScreen(),
    MafatihAljinanHomeScreen(),
    HerzAlmoujahidinHomeScreen(),
    A3malLayaliKadrHomeScreen(),
    Al7akibaAlramadaneyaHomeScreen(),
    AlbakiyatAlsali7atHomeScreen(),
    Alsa7ifaAlsajadiyaHomeScreen(),
  ];
}
