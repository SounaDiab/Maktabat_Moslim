import '../../Util/app_imports.dart';

class QiblaSalat extends StatefulWidget {
  static String screenRoute = 'qibla_salat_screen';
  const QiblaSalat({super.key});

  @override
  State<QiblaSalat> createState() => _QiblaSalatState();
}

class _QiblaSalatState extends State<QiblaSalat> {
  Future<bool> _onWillPop() async {
    Navigator.of(context).pop();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocProvider(
      create: (_) => QiblaCubit()..initQibla(),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            toolbarHeight: isTablet ? 100 : 70,
            title: Text(
              'اتجاه القبلة',
              style: TextStyle(
                fontSize: isTablet ? 40 : 19,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: _onWillPop,
              icon: Icon(
                Icons.arrow_back,
                size: isTablet ? 50 : 25,
              ),
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            centerTitle: true,
          ),
          body: BlocBuilder<QiblaCubit, QiblaState>(
            builder: (context, state) {
              if (state is QiblaLoading || state is QiblaInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is QiblaLocationDisabled) {
                return _message(
                    'يرجى تفعيل GPS', Theme.of(context).textTheme.displayLarge);
              }

              if (state is QiblaPermissionDenied) {
                return _message('يرجى السماح بالوصول إلى الموقع',
                    Theme.of(context).textTheme.displayLarge);
              }

              if (state is QiblaError) {
                return _message(
                    state.message, Theme.of(context).textTheme.displayLarge);
              }

              if (state is QiblaReady) {
                return QiblaCompass(direction: state.direction);
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _message(String text, TextStyle? textStyle) {
    return Center(
      child: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
