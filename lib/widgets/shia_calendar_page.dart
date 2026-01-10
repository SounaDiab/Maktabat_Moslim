import '../../Util/app_imports.dart';
import 'package:intl/intl.dart';

class ShiaCalendarPage extends StatefulWidget {
  const ShiaCalendarPage({Key? key}) : super(key: key);

  @override
  State<ShiaCalendarPage> createState() => _ShiaCalendarPageState();
}

class _ShiaCalendarPageState extends State<ShiaCalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _selectedEvents = [];

  /// ضبط يدوي بسيط لتعويض الفروقات المحلية (±2 يوم)
  // int _hijriDayOffset = -1;

  final DateFormat _fullArDate = DateFormat.yMMMMEEEEd('ar');

  // أسماء الأشهر الهجرية بالعربية (1=محرم ... 12=ذو الحجة)
  static const List<String> _hijriMonthsAr = [
    'محرم',
    'صفر',
    'ربيع الأول',
    'ربيع الآخر',
    'جمادى الأولى',
    'جمادى الآخرة',
    'رجب',
    'شعبان',
    'رمضان',
    'شوال',
    'ذو القعدة',
    'ذو الحجة',
  ];

  // مناسبات شيعية شائعة (تكرارية كل عام هجري)
  // المفتاح: "mm-dd" بالهجري (1=محرم).
  static const Map<String, List<String>> _shiaOccasions = {
    // محرم
    '1-1': [
      '/وفاة محمد بن الحنفية 81ه',
      'حصار النبي في شعب ابي طالب',
      'الملائكة تنشر ثوب الحسين'
    ],
    '1-10': ['عاشوراء - ذكرى استشهاد الإمام الحسين (ع)'],
    '1-11': [
      'تسيير سبايا الامام الحسين (ع) الى الكوفة 61ه',
      'وفاة النبي آدم عليه السلام'
    ],
    '1-13': ['دفن الامام الحسين (ع) واصحابه بلا رؤوس بكربلاء 61ه'],
    '1-18': ['سم الامام الحسن المجتبى عليه السلام 50ه'],
    '1-25': [
      'شهادة الامام السجاد (ع) بالمدينة 95ه',
      'وفاة المرجع السيد تقي القمي 1438'
    ],
    '1-26': ['شهادة علي بن الحسن المثلث في سجن المنصور 146ه'],
    // صفر
    '2-1': ['وصول السبايا الى دمشق 61ه', 'بداية حرب صفين 37ه'],
    '2-3': ['شهادة زيد بن علي 121ه', 'وفاة الشيخ علي الدندن 1430ه'],
    '2-5': ['شهادة رقية بنت الامام الحسين (ع) بالشام 61ه'],
    '2-7': ['شهادة الامام الحسن (ع) 50ه', 'مولد الامام الكاظم (ع) 128ه'],
    '2-17': ['شهادة الامام الرضا (ع) في خراسان 203ه'],
    '2-20': ['الأربعين (زيارة الأربعين)'],
    '2-26': ['شهادة طفلي مسلم بن عقيل 62ه', 'النبي (ص) يأمر بتجهيز جيش اسامه'],
    '2-27': ['وفاة السيد السبزواري 1414ه', ',وفاة النبي يحيى (ع)'],
    '2-28': ['وفاة المحقق السيد جعفر العاملي 1441', 'شهادة النبي محمد (ص) 11ه'],
    // ربيع الأول
    '3-1': [
      'دفن الرسول',
      'مبيت الامام علي في فراش النبي',
      'الهجوم على بيت الزهراء'
    ],
    '3-5': ['وفاة سكينة بنت الامام الحسين (ع) 117ه ودفنت بالبقيع'],
    '3-8': [
      'شهادة الإمام الحسن العسكري (ع)  في سامراء 260ه وبدء الغيبة الصغرى'
    ],
    '3-9': ['تولي الامام المنتظر (ع) مقاليد الامامة 260ه'],
    '3-17': ['مولد النبي محمد (ص)', 'مولد الإمام جعفر الصادق (ع)'],
    // ربيع الثاني
    '4-4': ['مولد الإمام الحسن العسكري (ع)'],
    '4-8': [
      'شهادة السيدة الزهراء (ع) رواية الاربعين يوم',
      'مولد الإمام الحسن العسكري (ع)'
    ],
    '4-10': ['وفاة السيدة المعصومة (ع) بقم 201ه'],
    '4-14': ['ثورة المختار الثقفي 66ه'],
    // جمادى الأولى
    '5-5': ['ميلاد العقيلة زينب (ع) بالمدينة 5ه'],
    '5-13': ['شهادة السيدة الزهراء (ع) 11ه رواية 75 يوم'],
    '5-22': ['وفاة القاسم بن الامام الكاظم (ع) 189ه'],
    // جمادى الآخرة
    '6-3': ['شهادة السيدة الزهراء (ع) 11ه رواية 95 يوم'],
    '6-13': ['وفاة ام البنين (ع) 64ه'],
    '6-20': ['ميلاد السيدة الزهراء (ع) 5 من البعثة'],
    // رجب
    '7-1': ['مولد الإمام الباقر (ع) 57ه'],
    '7-2': ['مولد الإمام الهادي (ع) بالمدينة 212ه'],
    '7-3': ['شهادة الإمام الهادي (ع) في سامراء 254ه'],
    '7-8': ['مولد نبي الله عيسى ابن مريم (ع)'],
    '7-10': ['مولد الإمام محمد الجواد (ع) في المدينة 195ه'],
    '7-13': ['مولد الإمام علي بن أبي طالب (ع)'],
    '7-15': ['وفاة السيدة زينب (ع) 62ه', 'شهادة الامام الصادق (ع) على رواية'],
    '7-25': ['شهادة الامام الكاظم (ع) 183ه'],
    '7-27': ['المبعث النبوي'],
    // شعبان
    '8-3': ['مولد الإمام الحسين (ع)'],
    '8-4': ['مولد أبي الفضل العباس (ع)'],
    '8-5': ['مولد الإمام زين العابدين (ع)'],
    '8-14': ['ولادة القاسم بن الامام الحسن (ع) 47ه في المدينة'],
    '8-15': ['مولد الإمام المهدي (عج) (ليلة النصف من شعبان)'],
    '8-16': ['بداية الغيبة الكبرى للامام الحجة (ع) 329ه'],
    '8-17': ['ولادة السيدة رقية بنت الامام الحسين (ع) بالمدينة 57/58ه'],
    // رمضان
    '9-14': ['شهادة المختار الثقفي 67ه'],
    '9-15': [
      'مولد الإمام الحسن المجتبى (ع)',
      'خروج مسلم بن عقيل الى الكوفة 60ه'
    ],
    '9-19': ['ضربة الإمام علي (ع)'],
    '9-21': ['استشهاد الإمام علي (ع)'],
    '9-19q': ['ليلة القدر (19)'], // مفاتيح مساعدة لتمييز الليالي
    '9-21q': ['ليلة القدر (21)'],
    '9-23q': ['ليلة القدر (23)'],
    // شوال
    '10-1': ['عيد الفطر'],
    '10-8': ['ذكرى هدم قبور البقيع'],
    '10-25': ['شهادة الامام الصادق (ع) في المدينة 148ه'],
    // ذو القعدة
    '11-1': ['ميلاد السيدة المعصومة (ع) 173ه'],
    '11-11': ['ميلاد الامام علي الرضا (ع) 148ه'],
    '11-25': ['دحو الأرض'],
    '11-29': ['شهادة الامام الجواد (ع) 220ه بالكاظمية'],
    // ذو الحجة
    '12-6': ['زواج الامام علي (ع) من الزهراء (ع) 2ه (على رواية)'],
    '12-7': ['شهادة الامام الباقر (ع) 114ه'],
    '12-9': ['يوم عرفة', 'شهادة مسلم وهاني 60ه'],
    '12-10': ['عيد الأضحى المبارك'],
    '12-18': ['عيد الغدير'],
    '12-20': ['احتمال قوي ميلاد الامام الكاظم (ع) 128ه'],
    '12-24': ['يوم المباهلة ونزول آية التطهير'],
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    int offset = context.read<HijriOffsetCubit>().state.offset;
    _selectedEvents = _eventsFor(_selectedDay!, offset);
  }

  /// تحويل ميلادي -> هجري مع تطبيق إزاحة اختيارية للملاءمة المحلية
  HijriDateTime _hijriFor(DateTime gregorian, int offset) {
    final adjusted = gregorian.add(Duration(days: offset));
    // يمكن تمرير ضبط متقدم عبر adjustmentConfiguration إن رغبت.
    return HijriDateTime.fromGregorian(adjusted);
  }

  /// صياغة التاريخ الهجري بالعربية
  String _formatHijri(HijriDateTime h) {
    final day = _toArabicDigits(h.day);
    final year = _toArabicDigits(h.year);
    final monthName = _hijriMonthsAr[h.month - 1];
    return '$day $monthName $year هـ';
  }

  /// أرقام عربية-هندية للعرض
  String _toArabicDigits(int number) {
    const western = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const eastern = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final s = number.toString();
    return s.split('').map((d) => eastern[western.indexOf(d)]).join();
  }

  /// إرجاع المناسبات الموافقة ليوم ميلادي معيّن (بناءً على تاريخه الهجري)
  List<String> _eventsFor(DateTime day, int offset) {
    final h = _hijriFor(day, offset);
    final key = '${h.month}-${h.day}';
    final base = _shiaOccasions[key] ?? <String>[];

    // ليالي القدر (تمييز إضافي افتراضيًا)
    final qKey = '${h.month}-${h.day}q';
    final q = _shiaOccasions[qKey] ?? <String>[];

    return [...base, ...q];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return BlocBuilder<HijriOffsetCubit, HijriOffsetState>(
      builder: (context, state) {
        final cubit = context.read<HijriOffsetCubit>();
        final selected = _selectedDay ?? DateTime.now();
        final hSelected = _hijriFor(selected, state.offset);
        List<String> _eventLoaderWrap(DateTime day) {
          return cubit.getEventsFor(day, _shiaOccasions);
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 20 : 10),
          child: SingleChildScrollView(
            // إضافة SingleChildScrollView
            child: Column(
              children: [
                // شريط معلومات اليوم المختار
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _fullArDate.format(selected),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatHijri(hSelected),
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: 8),
                      // ضبط الإزاحة الهجرية
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('تعديل التقويم الهجري'),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 220,
                            child: Row(
                              children: [
                                const Text('−2'),
                                Expanded(
                                  child: Slider(
                                    activeColor:
                                        Theme.of(context).iconTheme.color,
                                    min: -2,
                                    max: 2,
                                    divisions: 4,
                                    value: state.offset.toDouble(),
                                    label: state.offset.toString(),
                                    onChanged: (v) {
                                      context
                                          .read<HijriOffsetCubit>()
                                          .setOffset(v.round());
                                    },
                                  ),
                                ),
                                const Text('+2'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // التقويم الأساسي (ميلادي) مع إظهار اليوم الهجري داخل كل خلية
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TableCalendar<String>(
                    locale: 'en_US',
                    firstDay: DateTime.utc(2025, 1, 1),
                    lastDay: DateTime.utc(2045, 12, 31),
                    focusedDay: _focusedDay,
                    startingDayOfWeek: StartingDayOfWeek.saturday,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        _selectedEvents = _eventsFor(selectedDay, state.offset);
                      });
                    },
                    onPageChanged: (focusedDay) => _focusedDay = focusedDay,
                    eventLoader: _eventLoaderWrap,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    daysOfWeekHeight: 40,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.red),
                    ),
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      // تعديل شكل اليوم المحدد ليكون مربعاً
                      selectedDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      // تعديل شكل اليوم الحالي
                      todayDecoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.4,
                        ),
                      ),
                      todayTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders<String>(
                      defaultBuilder: (context, day, focusedMonth) {
                        final isQadr = cubit.isQadrNight(day);
                        final h = _hijriFor(day, state.offset);
                        final isToday = isSameDay(day, DateTime.now());
                        final hasEvents = _eventsFor(day, state.offset)
                            .isNotEmpty; // التحقق إذا كان اليوم يحتوي على مناسبات

                        return Container(
                          decoration: BoxDecoration(
                            gradient: isQadr
                                ? LinearGradient(colors: [
                                    Color(0xFF6A1B9A),
                                    Color(0xFFAB47BC)
                                  ])
                                : null,
                            color: !isQadr
                                ? hasEvents
                                    ? Colors.red.withOpacity(0.2)
                                    : Colors.grey.withOpacity(0.1)
                                : null, // خلفية لجميع الأيام (لون ثابت لجميع الأيام)
                            borderRadius: BorderRadius.circular(10),
                            border: isToday
                                ? Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1.4) // تمييز اليوم الحالي
                                : null,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 7), // مسافة بين الأيام
                          margin: EdgeInsets.all(2),
                          child: Stack(
                            children: [
                              if (isQadr)
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.star,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 16,
                                  ),
                                ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  _toArabicDigits(h.day), // رقم اليوم الهجري
                                  style: TextStyle(
                                    fontSize: isTablet ? 20 : 11,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.color
                                        ?.withOpacity(.8),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  day.day.toString(), // اليوم الميلادي
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      markerBuilder: (context, day, events) {
                        // تم حذف النجمة من هنا
                        return const SizedBox.shrink(); // لا شيء هنا
                      },
                    ),
                  ),
                ),

                // قائمة المناسبات لليوم المختار
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('مناسبات هذا اليوم',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      if (_selectedEvents.isEmpty)
                        Text(
                          'لا توجد مناسبات في هذا اليوم.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        )
                      else
                        ..._selectedEvents.map(
                          (e) => Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            color: Theme.of(context).cardColor,
                            child: ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.event,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              title: Text(
                                e,
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              subtitle: Text(
                                _formatHijri(hSelected),
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
