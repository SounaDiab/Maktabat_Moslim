import '../Util/app_imports.dart';

class MawakitAlsalat extends StatelessWidget {
  static String screenRoute = 'mawakit_alsalat';
  const MawakitAlsalat({super.key});

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
          toolbarHeight: isTablet ? 100 : 70,
          centerTitle: true,
          title: Text(
            'مواقيت الصلاة',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
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
          width: sizeWidth,
          height: sizeHeight,
          margin: EdgeInsets.symmetric(
            horizontal: isTablet ? 40 : 20,
            vertical: isTablet ? 80 : 40,
          ),
          child: PrayerTimeWidget(),
        ),
      ),
    );
  }
}
