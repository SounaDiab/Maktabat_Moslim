import '../../Util/app_imports.dart';

class DailyContentCubit extends Cubit<DailyContentState> {
  final Repository repository;

  DailyContentCubit(this.repository) : super(const DailyContentState());

  Future<void> loadDailyContent({int hijriOffset = 0}) async {
    try {
      final now = DateTime.now();

      // ── التاريخ الميلادي (للقرآن والحكمة) ──
      final currentMonth = now.month;
      final currentDay = now.day;

      // ── التاريخ الهجري (للصورة فقط) مع تطبيق إزاحة التقويم ──
      final adjustedDate = now.add(Duration(days: hijriOffset));
      final hijriDate = HijriDateTime.fromGregorian(adjustedDate);
      final currentHijriMonth = hijriDate.month;
      final currentHijriDay = hijriDate.day;

      final List<DailyItem> listQuranTouch = await repository.getQuranTouch();
      final List<DailyItem> listWisdomOfDay = await repository.getWelcomScreen();
      final List<DailyItem> listImageOfDay = await repository.getImageOfDay();

      // البحث بالتاريخ الميلادي — القرآن
      final DailyItem? todayItemQuranTouch = listQuranTouch.firstWhere(
        (item) => item.month == currentMonth && item.day == currentDay,
        // orElse: () => null,
      );

      // البحث بالتاريخ الميلادي — الحكمة
      final DailyItem? todayItemWisdomOfDay = listWisdomOfDay.firstWhere(
        (item) => item.month == currentMonth && item.day == currentDay,
        // orElse: () => null,
      );

      // البحث بالتاريخ الهجري — الصورة فقط
      final DailyItem? todayImageOfDay = listImageOfDay.firstWhere(
        (item) =>
            item.moon_month == currentHijriMonth &&
            item.moon_day == currentHijriDay,
        // orElse: () => null,
      );

      emit(
        DailyContentState(
          wisdom: todayItemWisdomOfDay,
          image: todayImageOfDay,
          quran: todayItemQuranTouch,
        ),
      );
    } catch (e) {
      debugPrint('❌ خطأ: $e');
      emit(const DailyContentState());
    }
  }
}