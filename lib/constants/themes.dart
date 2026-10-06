import '../../Util/app_imports.dart';

class LightTheme {
  late bool isTablet;
  LightTheme({required this.isTablet});
  ThemeData get themeData {
    return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors.background,
      primaryColor: LightColors.primary,
      primaryIconTheme: IconThemeData(color: LightColors.accent),
      dividerColor: LightColors.accent,
      indicatorColor: LightColors.text,
      canvasColor: LightColors.surfaceLight,
      primaryColorLight: LightColors.qibla,
      appBarTheme: const AppBarTheme(
        backgroundColor: LightColors.primary,
        foregroundColor: LightColors.text,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: LightColors.surface,
          fontSize: isTablet ? 60 : 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
        displayMedium: TextStyle(
          color: LightColors.surface,
          fontSize: isTablet ? 40 : 20,
          fontWeight: FontWeight.w500,
          fontFamily: 'UthmanicHafs',
        ),
        displaySmall: TextStyle(
          color: LightColors.accent,
          fontSize: isTablet ? 28 : 14,
          fontFamily: 'UthmanicHafs',
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 32 : 20,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w800,
          letterSpacing: isTablet ? 5 : 3,
        ),
        titleMedium: TextStyle(
          color: LightColors.surface,
          fontSize: isTablet ? 30 : 14,
          fontFamily: 'Tajawal',
        ),
        titleSmall: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 50 : 12,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w800,
          letterSpacing: isTablet ? 5 : 3,
        ),
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: isTablet ? 30 : 14,
          fontFamily: 'Tajawal',
        ),
        bodyLarge: TextStyle(
          color: LightColors.surface,
          fontSize: isTablet ? 40 : 16,
          fontFamily: 'UthmanicHafs',
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: LightColors.surface,
          fontSize: isTablet ? 22 : 10,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w900,
        ),
        bodySmall: TextStyle(
          color: LightColors.surface,
          fontSize: isTablet ? 22 : 10,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 40 : 16,
          fontFamily: 'UthmanicHafs',
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 30 : 14,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 22 : 10,
          fontFamily: 'Tajawal',
        ),
      ),
      iconTheme: IconThemeData(color: LightColors.accent),
      cardColor: LightColors.surface,
    );
  }
}

class DarkTheme {
  late bool isTablet;
  DarkTheme({required this.isTablet});
  ThemeData get themeData {
    return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColors.background,
      primaryColor: DarkColors.primary,
      primaryIconTheme: IconThemeData(color: LightColors.accent),
      dividerColor: DarkColors.accent,
      indicatorColor: DarkColors.text,
      canvasColor: DarkColors.surfaceLight,
      primaryColorLight: DarkColors.qibla,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 60 : 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
        displayMedium: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 40 : 20,
          fontWeight: FontWeight.w500,
          fontFamily: 'UthmanicHafs',
        ),
        displaySmall: TextStyle(
          color: DarkColors.accent,
          fontSize: isTablet ? 28 : 14,
          fontFamily: 'UthmanicHafs',
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 32 : 20,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w800,
          letterSpacing: isTablet ? 5 : 3,
        ),
        titleMedium: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 30 : 14,
          fontFamily: 'Tajawal',
        ),
        headlineLarge: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 30 : 14,
          fontFamily: 'Tajawal',
        ),
        bodyLarge: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 40 : 16,
          fontFamily: 'UthmanicHafs',
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 22 : 10,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w900,
        ),
        bodySmall: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 22 : 10,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: DarkColors.text,
          fontSize: isTablet ? 40 : 16,
          fontFamily: 'UthmanicHafs',
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 30 : 14,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
          color: LightColors.text,
          fontSize: isTablet ? 22 : 10,
          fontFamily: 'Tajawal',
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkColors.primary,
        foregroundColor: DarkColors.text,
      ),
      iconTheme: IconThemeData(color: DarkColors.accent),
      cardColor: DarkColors.surface,
    );
  }
}
