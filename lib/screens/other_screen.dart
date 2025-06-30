import 'package:flutter/material.dart';
import '../widgets/prayer_time_widget.dart';
import 'other pages/counter_screen.dart';
import 'other pages/imsakiya_screen.dart';
import 'other pages/salat_allayl.dart';
import 'other pages/takwim_screen.dart';
import 'welcome_screen.dart';

class OtherScreen extends StatelessWidget {
  static String screenRoute = 'other_screen';
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.sizeOf(context).width;
    double sizeHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 60 : 30,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(WelcomeScreen.screenRoute);
            },
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 50 : 25,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: isTablet ? sizeHeight / 2 : sizeHeight / 1.5,
                  child: Container(
                    child: PrayerTimeWidget(),
                  ),
                ),
                Container(
                  width: double.infinity,
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                  // padding: EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SalatAllayl.screenRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text('صلاة الليل',
                        style: TextStyle(
                          fontSize: isTablet ? 32 : 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Tajawal',
                          letterSpacing: isTablet ? 5 : 3,
                        )),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: sizeWidth / 4,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, CounterScreen.screenRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text('عداد',
                              style: TextStyle(
                                fontSize: isTablet ? 32 : 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Tajawal',
                                letterSpacing: isTablet ? 5 : 3,
                              )),
                        ),
                      ),
                      Container(
                        width: sizeWidth / 4,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, TakwimScreen.screenRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text('التقويم',
                              style: TextStyle(
                                fontSize: isTablet ? 32 : 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Tajawal',
                                letterSpacing: isTablet ? 5 : 3,
                              )),
                        ),
                      ),
                      Container(
                        width: sizeWidth / 4,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ImsakiyaScreen.screenRoute);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 5,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Text('إمساكية',
                              style: TextStyle(
                                fontSize: isTablet ? 32 : 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Tajawal',
                                letterSpacing: isTablet ? 5 : 3,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
