import '../../../Util/app_imports.dart';

class TesbihPage extends StatefulWidget {
  static String screenRoute = 'tesbiha_screen';
  const TesbihPage({super.key});

  @override
  State<TesbihPage> createState() => _TesbihPageState();
}

class _TesbihPageState extends State<TesbihPage> {
  int current = 0;
  int total = 100;
  bool showDoneCard = false;

  final tasbeehController = TextEditingController();
  final totalController = TextEditingController();

  // ✅ مفاتيح الحفظ
  static const String _keyTasbeeh = 'tasbeeh_text';
  static const String _keyTotal = 'tasbeeh_total';
  static const String _keyCurrent = 'tasbeeh_current';

  @override
  void initState() {
    super.initState();
    _loadData(); // ✅ تحميل البيانات عند الفتح
  }

  // ✅ تحميل البيانات المحفوظة
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      tasbeehController.text = prefs.getString(_keyTasbeeh) ?? 'سبحان الله';

      // ✅ إذا كان المحفوظ -1 معناه الحقل كان فارغاً
      final savedTotal = prefs.getInt(_keyTotal);
      if (savedTotal == null || savedTotal == -1) {
        total = 0;
        totalController.text = '';
      } else {
        total = savedTotal;
        totalController.text = total.toString();
      }

      current = prefs.getInt(_keyCurrent) ?? 0;
    });
  }

  // ✅ حفظ البيانات
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyTasbeeh, tasbeehController.text);

    // ✅ إذا كان الحقل فارغاً نحفظ -1 كعلامة
    final isEmpty = totalController.text.isEmpty;
    await prefs.setInt(_keyTotal, isEmpty ? -1 : total);
    await prefs.setInt(_keyCurrent, current);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      resizeToAvoidBottomInset: false, // ✅ شرطك الثاني
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          /// الخلفية
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: 550,
              color: Theme.of(context).dividerColor,
            ),
          ),
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: 540,
              color: Theme.of(context).cardColor,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Center(
                    child: Text(
                      "مسبحة",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: isTablet ? 40 : 24,
                          ),
                    ),
                  ),
                  leading: IconButton(
                    padding: EdgeInsets.only(bottom: 10),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: isTablet ? 70 : 35,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                  trailing: IconButton(
                    padding: EdgeInsets.only(bottom: 10),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, TesbihatAlzahra2Page.screenRoute);
                    },
                    icon: Icon(
                      Icons.change_circle,
                      size: isTablet ? 70 : 35,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                _textField(
                  tasbeehController,
                  "اكتب التسبيحة",
                  onChanged: (v) => _saveData(), // ✅ حفظ عند تغيير النص
                ),
                const SizedBox(height: 20),

                _textField(
                  totalController,
                  "العدد المطلوب",
                  isNumber: true,
                  onChanged: (v) {
                    total = int.tryParse(v) ?? 0;
                    setState(() => current = 0);
                    _saveData(); // ✅ حفظ عند تغيير العدد
                  },
                ),

                const SizedBox(height: 100),

                /// العداد
                GestureDetector(
                  onTap: _onTasbeeh,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// الحلقة نفسها
                      CustomPaint(
                        size: Size(260, 260),
                        painter: TasbeehRingPainter(
                          progress: current / (total == 0 ? 1 : total),
                          color: Theme.of(context).cardColor,
                          secColor: Theme.of(context).canvasColor,
                          thirdColor: Theme.of(context).dividerColor,
                        ),
                      ),

                      /// الأرقام فوق الحلقة
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$total ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: isTablet ? 40 : 24,
                                ),
                          ),
                          Text(
                            "/ $current",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: isTablet ? 40 : 24,
                                ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                /// زر التسبيح
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GestureDetector(
                          onTap: _onTasbeeh,
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "تسبيح",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: isTablet ? 40 : 24,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).dividerColor,
                        onPressed: () {
                          setState(() {
                            current = 0;
                            total = 0;
                            tasbeehController.text = "";
                            totalController.text = '';
                          });
                          _saveData(); // ✅ حفظ بعد الإعادة
                        },
                        child: Icon(
                          Icons.refresh,
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          /// بطاقة الانتهاء
          if (showDoneCard)
            doneCard("انتهى التسبيح!", Theme.of(context).primaryColor,
                Theme.of(context).indicatorColor),
        ],
      ),
    );
  }

  void _onTasbeeh() {
    if (current < total) {
      setState(() => current++);
      _saveData(); // ✅ حفظ عند كل ضغطة
    }
    if (current == total && total != 0) {
      setState(() => showDoneCard = true);
      Future.delayed(
        const Duration(seconds: 3),
        () => setState(() => showDoneCard = false),
      );
    }
  }

  Widget _textField(
    TextEditingController controller,
    String hint, {
    bool isNumber = false,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).dividerColor, width: 3),
        ),
        child: TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).cardColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
