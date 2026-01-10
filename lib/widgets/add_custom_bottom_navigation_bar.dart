import '../../Util/app_imports.dart';
import 'package:http/http.dart' as http;

class AddCustomBottomNavigationBar extends StatefulWidget {
  String pushNext;
  String pushBack;
  String soud;
  Function onTap;
  VoidCallback onLongPress;
  AddCustomBottomNavigationBar({
    super.key,
    required this.pushNext,
    required this.pushBack,
    required this.soud,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  State<AddCustomBottomNavigationBar> createState() =>
      _AddCustomBottomNavigationBarState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AddCustomBottomNavigationBarState
    extends State<AddCustomBottomNavigationBar> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _handleBack() {
    print('العودة للصفحة السابقة');
    // منطق الرجوع للصفحة السابقة
    Navigator.of(context).pushNamed(widget.pushBack);
    player.stop();
  }

  void _handleNext() {
    print('الانتقال للصفحة التالية');
    // منطق الانتقال للصفحة التالية
    Navigator.of(context).pushNamed(widget.pushNext);
    player.stop();
  }

  // دالة لتحميل الصوت وحفظه في المجلد الدائم
  Future<String> _getAudioPath(String soundUrl) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = soundUrl.split('/').last;
    final filePath = '${dir.path}/$fileName';
    final file = File(filePath);

    if (!file.existsSync()) {
      final response = await http.get(Uri.parse(soundUrl));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        print('Audio saved to local storage');
      } else {
        throw Exception('Failed to download audio');
      }
    }
    return filePath;
  }

  // دالة لتشغيل أو إيقاف الصوت
  void _handleSoundToggle(bool isSoundOn) async {
    isSoundOn = isPlaying;
    // إيقاف الصوت إذا كان مشغلاً
    if (isPlaying) {
      await player.pause();
      print('Audio Paused');
    } else {
      try {
        // تحميل الصوت من الإنترنت وحفظه في المجلد المحلي
        final audioPath = await _getAudioPath(widget.soud);

        // إعداد المصدر الصوتي من المجلد المحلي
        await player.setSource(DeviceFileSource(audioPath));
        await player.resume();
        print('Audio Playing');
      } catch (e) {
        print('Error: $e');
      }
    }

    // تحديث حالة الصوت بعد تشغيله أو إيقافه
    if (mounted) {
      setState(() {
        isPlaying = !isPlaying; // تبديل حالة التشغيل
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final phoneFontSize = [
      10.0,
      12.0,
      14.0,
      16.0,
      18.0,
      20.0,
      22.0,
      24.0,
      26.0,
      28.0,
      30.0
    ];
    final tabletFontSize = [
      30.0,
      32.0,
      34.0,
      36.0,
      38.0,
      40.0,
      42.0,
      44.0,
      46.0,
      48.0,
      50.0
    ];

    void _handleFontSizeChange(double fontSize) {
      setState(() {
        isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text('اختر حجم الخط'),
            ),
            content: Container(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // قائمة أحجام الخط
                    ...(isTablet ? tabletFontSize : phoneFontSize)
                        .map((fontSize) => ListTile(
                              title: Text(
                                '${fontSize.toInt()}',
                                style: TextStyle(
                                  fontSize: isTablet ? 40 : 20,
                                ),
                              ),
                              onTap: () => widget.onTap(fontSize),
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    final bool isSoundAvailable =
        widget.soud.isNotEmpty && widget.soud.trim().isNotEmpty;

    return CustomBottomNavigationBar(
      onBack: _handleBack,
      onNext: _handleNext,
      onFontSizeChange: _handleFontSizeChange,
      onSoundToggle: _handleSoundToggle,
      fontSize: isTablet ? _fontSizeTablet : _fontSize,
      onLongPress: widget.onLongPress,
      isSoundAvailable: isSoundAvailable,
    );
  }
}
