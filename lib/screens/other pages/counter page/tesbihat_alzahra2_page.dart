import 'package:flutter/material.dart';

class TesbihatAlzahra2Page extends StatefulWidget {
  static String screenRoute = 'tesbihatalzahraa_screen';
  const TesbihatAlzahra2Page({super.key});

  @override
  State<TesbihatAlzahra2Page> createState() => _TesbihatAlzahra2PageState();
}

class _TesbihatAlzahra2PageState extends State<TesbihatAlzahra2Page> {
  int count = 0;
  String title = 'الله أكبر';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: isTablet ? 100 : 50,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: isTablet ? 50 : 25,
          ),
        ),
        // title: Text(
        //   'تسبيحة الزهراء',
        //   style: TextStyle(
        //     fontSize: isTablet ? 40 : 25,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isTablet ? 60 : 30,
                fontWeight: FontWeight.bold,
                color:
                    title == 'اكتملت تسبيحة الزهراء' ? Colors.red : Colors.blue,
                fontFamily: 'Tajawal',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: isTablet ? 60 : 30,
                  fontWeight: FontWeight.bold,
                  color: title == 'اكتملت تسبيحة الزهراء'
                      ? Colors.red
                      : Colors.blue,
                  fontFamily: 'Tajawal',
                ),
              ),
            ),
            Container(
              width: isTablet ? 300 : 100,
              height: isTablet ? 300 : 100,
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isTablet ? 150 : 50),
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    count++;
                    if (count >= 34) {
                      title = 'الحمدلله';
                      count = 0;
                    }
                    if (count >= 33 && title == 'الحمدلله') {
                      title = 'سبحان الله';
                      count = 0;
                    }
                    if (count >= 33 && title == 'سبحان الله') {
                      title = 'اكتملت تسبيحة الزهراء';
                      count = 0;
                    }
                    if (title == 'اكتملت تسبيحة الزهراء') {
                      title = 'اكتملت تسبيحة الزهراء';
                      count = 0;
                    }
                  });
                },
                child: Icon(
                  Icons.add,
                  size: isTablet ? 150 : 50,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              width: isTablet ? 300 : 100,
              height: isTablet ? 300 : 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(isTablet ? 150 : 50),
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    count = 0;
                    title = 'الله أكبر';
                  });
                },
                child: Icon(
                  Icons.clear,
                  size: isTablet ? 150 : 50,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
