import 'package:flutter/material.dart';
import 'add_custom_bottom_navigation_bar.dart';

class SowarKoraan extends StatefulWidget {
  SowarKoraan({
    super.key,
    required this.title,
    required this.basmala,
    required this.koraan,
    required this.music,
    required this.next,
    required this.back,
  });

  String title;
  String basmala;
  String koraan;
  String music;
  String next;
  String back;

  @override
  State<SowarKoraan> createState() => _SowarKoraanState();
}

class _SowarKoraanState extends State<SowarKoraan> {
  double _fontSize = 24;
  double _fontSizeTablet = 30;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              child: Text(
                widget.basmala,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? _fontSizeTablet + 6 : _fontSize + 6,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'UthmanicHafs',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                right: isTablet ? 60 : 30,
                left: isTablet ? 60 : 30,
              ),
              alignment: Alignment.topRight,
              child: Text(
                textAlign: TextAlign.justify,
                widget.koraan,
                style: TextStyle(
                  fontSize: isTablet ? _fontSizeTablet : _fontSize,
                  fontFamily: 'UthmanicHafs',
                  letterSpacing: isTablet ? 1.2 : 0.9,
                  wordSpacing: isTablet ? 2.7 : 0.9,
                  height: isTablet ? 3.8 : 1.5,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: widget.next,
        pushBack: widget.back,
        soud: widget.music,
        onTap: (double fontSize) {
          // تحديث حجم الخط
          setState(() {
            isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
          });
          print('fontSize: $fontSize');
          // إغلاق Dialog
          Navigator.of(context).pop();
        },
        onLongPress: () {
          final snackBar = SnackBar(
            content: Center(
              child: Text(
                '${isTablet ? _fontSizeTablet.toInt() : _fontSize.toInt()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            width: 60,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 2),
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              1,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
