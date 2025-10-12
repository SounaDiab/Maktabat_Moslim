import 'package:flutter/material.dart';

class TesbihPage extends StatefulWidget {
  static String screenRoute = 'tesbih_screen';
  const TesbihPage({super.key});

  @override
  State<TesbihPage> createState() => _TesbihPageState();
}

class _TesbihPageState extends State<TesbihPage> {
  int count = 0;
  TextEditingController counterText = TextEditingController();
  String title = 'صل على محمد وآل محمد';

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
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: isTablet ? 150 : 20),
          padding: EdgeInsets.only(top: 120),
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: 'أدخل العدد',
                          labelStyle: TextStyle(
                            fontSize: isTablet ? 40 : 20,
                            fontFamily: 'Tajawal',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: title == 'اكتملت التسبيحة'
                                    ? Colors.red
                                    : Colors.blue),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: title == 'اكتملت التسبيحة'
                                    ? Colors.red
                                    : Colors.blue),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        controller: counterText,
                        keyboardType: TextInputType.numberWithOptions(),
                        style: TextStyle(
                          fontSize: isTablet ? 60 : 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isTablet ? 40 : 16,
                        fontWeight: FontWeight.bold,
                        color: title == 'اكتملت التسبيحة'
                            ? Colors.red
                            : Colors.blue,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: isTablet ? 50 : 30,
                    fontWeight: FontWeight.bold,
                    color:
                        title == 'اكتملت التسبيحة' ? Colors.red : Colors.blue,
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
                        borderRadius:
                            BorderRadius.circular(isTablet ? 150 : 50),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      count++;
                      if (count == int.parse(counterText.text)) {
                        title = 'اكتملت التسبيحة';
                      }
                      if (title == 'اكتملت التسبيحة') {
                        count = int.parse(counterText.text);
                      }
                    });
                    print('counterText = ${counterText.value}');
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
                        borderRadius:
                            BorderRadius.circular(isTablet ? 150 : 50),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      count = 0;
                      title = 'صل على محمد وآل محمد';
                      counterText.text = '';
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
      ),
    );
  }
}
