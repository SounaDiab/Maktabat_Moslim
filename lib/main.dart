import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:maktabat_almoslim/Util/app_routes.dart';
import 'package:maktabat_almoslim/screens/favorites_provider.dart';
import 'package:maktabat_almoslim/screens/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/welcome_screen.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:firebase_core/firebase_core.dart';

import 'screens/kor2an/providers/bookmark.dart';
import 'screens/kor2an/providers/quran.dart';
import 'screens/kor2an/providers/show_overlay_provider.dart';
// import 'screens/kor2an/providers/style_provider.dart';
import 'screens/kor2an/providers/theme_provider.dart';
import 'screens/kor2an/providers/toast.dart';
// import 'firebase_options.dart';
// options: DefaultFirebaseOptions.currentPlatform,

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    print('✅ Firebase initialized');

    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    final prefs = await SharedPreferences.getInstance();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => FavoritesProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SearchProvider(),
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider<ShowOverlayProvider>(
            create: (context) => ShowOverlayProvider(),
          ),
          ChangeNotifierProvider<Quran>(
            create: (context) => Quran(prefs),
          ),
          ChangeNotifierProxyProvider<Quran, BookMarkProvider>(
            create: (context) => BookMarkProvider(prefs),
            update: (context, value, previous) =>
                previous!..update(value.currentPage),
          ),
          ChangeNotifierProxyProvider<Quran, ToastProvider>(
            create: (context) => ToastProvider(),
            update: (context, value, previous) =>
                previous!..update(value.hizbQuarter),
          ),
          // ChangeNotifierProvider(create: (ctx) => StyleProvider()),
        ],
        child: MyApp(savedThemeMode: savedThemeMode),
      ),
    );
  }, (error, stackTrace) {
    print('Caught error: $error');
  });
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  MyApp({required this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 40 : 16,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: isTablet ? 40 : 16,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar', 'LB')],
        locale: Locale('ar', 'LB'),
        title: 'مكتبة المسلم',
        // theme: ThemeData(
        //   useMaterial3: true,
        // ),
        theme: light,
        darkTheme: dark,
        home: WelcomeScreen(),
        routes: AppRoutes.routes,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
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
              body: Center(child: Text('Page not found: ${settings.name}')),
            ),
          );
        },
      ),
    );
  }
}
