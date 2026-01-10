import '../../../Util/app_imports.dart';



class TakwimScreen extends StatelessWidget {
  static String screenRoute = 'takwim_screen';
  const TakwimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTablet ? 100 : 70,
        centerTitle: true,
        title: Text(
          'التقويم',
          style: TextStyle(
            fontSize: isTablet ? 40 : 20,
          ),
        ),
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
        child: Center(
          child: ShiaCalendarPage(),
        ),
      ),
    );
  }
}
