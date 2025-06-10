import '../screens/a3mal_layali_kadr_home_screen.dart';
import '../screens/al7akiba_alramadaneya_home_screen.dart';
import '../screens/albakiyat_alsali7at_home_screen.dart';
import '../screens/herz_almoujahidin_home_screen.dart';
import '../screens/mafatih_aljinan_home_screen.dart';
import '../screens/quran_home_screen.dart';

class BooksItem {
  static final List<String> bookstitle = [
    'القرآن الكريم',
    'مفاتيح الجنان',
    'حرز المجاهدين',
    'أعمال ليالي القدر',
    'الحقيبة الرمضانية',
    'الباقيات الصالحات',
  ];
  static final List<String> booksSrc = [
    'images/kor2an.png',
    'images/mafatih_aljinan.png',
    'images/herz_almojahidin.png',
    'images/layali_kadr.png',
    'images/al7akiba_alramadaneya.png',
    'images/albakiyat_alsali7at.png',
  ];
  static final List<String> booksRoute = [
    QuranHomeScreen.screenRoute,
    MafatihAljinanHomeScreen.screenRoute,
    HerzAlmoujahidinHomeScreen.screenRoute,
    A3malLayaliKadrHomeScreen.screenRoute,
    Al7akibaAlramadaneyaHomeScreen.screenRoute,
    AlbakiyatAlsali7atHomeScreen.screenRoute,
  ];
}
