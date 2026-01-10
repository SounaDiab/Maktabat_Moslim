import '../../Util/app_imports.dart';

class HijriOffsetCubit extends Cubit<HijriOffsetState> {
  static const _offsetKey = 'hijri_day_offset';

  HijriOffsetCubit()
      : super(const HijriOffsetState(offset: 0, cachedEvents: {})) {
    _loadOffset();
  }

  /// تحميل الإزاحة المحفوظة
  Future<void> _loadOffset() async {
    final prefs = await SharedPreferences.getInstance();
    final offset = prefs.getInt(_offsetKey) ?? 0;
    emit(state.copyWith(offset: offset));
  }

  /// تغيير الإزاحة مع إعادة ضبط الكاش
  Future<void> setOffset(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_offsetKey, value);

    emit(
      HijriOffsetState(
        offset: value,
        cachedEvents: {}, // تفريغ الكاش لأن التواريخ تغيّرت
      ),
    );
  }

  /// تحويل ميلادي → هجري
  HijriDateTime hijriFor(DateTime day) {
    return HijriDateTime.fromGregorian(
      day.add(Duration(days: state.offset)),
    );
  }

  /// جلب المناسبات مع تحسين الأداء (Cache)
  List<String> getEventsFor(
    DateTime day,
    Map<String, List<String>> occasions,
  ) {
    final cacheKey = '${day.year}-${day.month}-${day.day}-${state.offset}';

    if (state.cachedEvents.containsKey(cacheKey)) {
      return state.cachedEvents[cacheKey]!;
    }

    final h = hijriFor(day);
    final baseKey = '${h.month}-${h.day}';
    final qKey = '${h.month}-${h.day}q';

    final events = [
      ...?occasions[baseKey],
      ...?occasions[qKey],
    ];

    final newCache = Map<String, List<String>>.from(state.cachedEvents)
      ..[cacheKey] = events;

    emit(state.copyWith(cachedEvents: newCache));

    return events;
  }

  /// هل اليوم ليلة قدر؟
  bool isQadrNight(DateTime day) {
    final h = hijriFor(day);
    return h.month == 9 && (h.day == 19 || h.day == 21 || h.day == 23);
  }
}
