import '../../Util/app_imports.dart';

class ImsakiyaScreen extends StatelessWidget {
  static String screenRoute = 'imsakiya_screen';
  const ImsakiyaScreen({super.key});

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
        child: Center(
          child: Text(
            'قريباً...',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
