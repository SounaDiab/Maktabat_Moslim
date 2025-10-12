import 'package:flutter/material.dart';

import 'counter page/tesbiha_page.dart';
import 'counter page/tesbihat_alzahra2_page.dart';

class CounterScreen extends StatelessWidget {
  static String screenRoute = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'عداد',
                style: TextStyle(
                  fontSize: isTablet ? 60 : 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Tajawal',
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, TesbihPage.screenRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: Text(
                        'تسبيحة',
                        style: TextStyle(
                          fontSize: isTablet ? 36 : 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, TesbihatAlzahra2Page.screenRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: Text(
                        'تسبيحة الزهراء',
                        style: TextStyle(
                          fontSize: isTablet ? 36 : 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
