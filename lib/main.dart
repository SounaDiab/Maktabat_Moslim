import 'dart:async';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Util/app_routes.dart';
import 'package:maktabat_almoslim/screens/favorites_provider.dart';
import 'package:maktabat_almoslim/screens/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/welcome_screen.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:firebase_core/firebase_core.dart';

import 'api/repository/repository.dart';
import 'api/web service/json_service.dart';
import 'business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import 'business logic/cubit/albakiyat_alsalihat_cubit.dart';
import 'business logic/cubit/alhakiba_alramadaneya_cubit.dart';
import 'business logic/cubit/herz_almoujahidin_cubit.dart';
import 'business logic/cubit/mafatih_aljinan_cubit.dart';
import 'screens/kor2an/providers/bookmark.dart';
import 'screens/kor2an/providers/quran.dart';
import 'screens/kor2an/providers/show_overlay_provider.dart';
import 'screens/kor2an/providers/theme_provider.dart';
import 'screens/kor2an/providers/toast.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void backgroundAlarmCallback() async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'alarm_channel',
    'صلاة',
    channelDescription: 'تنبيه من الخلفية',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('azan'),
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  await notificationsPlugin.show(
    1111,
    '🕌 وقت الصلاة',
    'حان وقت الصلاة!',
    notificationDetails,
  );
}

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AndroidAlarmManager.initialize();
    await Firebase.initializeApp();
    print('✅ Firebase initialized');
    tz.initializeTimeZones();

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
          RepositoryProvider<JsonService>(
            create: (_) => JsonService(),
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

Future<void> initializeNotifications() async {
  const android = AndroidInitializationSettings('@mipmap/ic_launcher');

  const settings = InitializationSettings(android: android);

  await notificationsPlugin.initialize(settings);
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  MyApp({required this.savedThemeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key selectableKey = UniqueKey();

  void _clearSelection() {
    setState(() {
      selectableKey = UniqueKey(); // إعادة بناء SelectableText
    });
  }

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
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (light, dark) => MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (BuildContext context) =>
                A3malLaylatAlkaderCubit(Repository(JsonService()))
                  ..getA3malLaylatAlkader(),
          ),
          BlocProvider(
            lazy: false,
            create: (BuildContext context) =>
                HerzAlmoujahidinCubit(Repository(JsonService()))
                  ..getHerzAlmoujahidin(),
          ),
          BlocProvider(
            lazy: false,
            create: (BuildContext context) =>
                AlhakibaAlramadaneyaCubit(Repository(JsonService()))
                  ..getAlhakibaAlramadaneya(),
          ),
          BlocProvider(
            lazy: false,
            create: (BuildContext context) =>
                MafatihAljinanCubit(Repository(JsonService()))
                  ..getMafatihAljinan(),
          ),
          BlocProvider(
            lazy: false,
            create: (BuildContext context) =>
                AlbakiyatAlsalihatCubit(Repository(JsonService()))
                  ..getAlbakiyatAlsalihat(),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // إخفاء الكيبورد لو كان ظاهر
            // اخفاء التحديد
            _clearSelection;
          },
          behavior: HitTestBehavior.translucent,
          child: MaterialApp(
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
        ),
      ),
    );
  }
}
