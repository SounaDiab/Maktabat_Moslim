import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../Util/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ⬇ تهيئة المنطقة الزمنية واحترام Asia/Beirut (يُعالج فروق DST)
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Beirut'));

  await AwesomeNotifications().initialize(
    null, // أيقونة الإشعار
    [
      NotificationChannel(
        channelKey: 'prayer_channel',
        channelName: 'تنبيهات الصلاة',
        channelDescription: 'تنبيه وقت الصلاة',
        defaultColor: ThemeData().primaryColor,
        importance: NotificationImportance.Max,
        playSound: true,
        soundSource:
            'resource://raw/azan', // ضع أذان.mp3 في android/app/src/main/res/raw
        enableVibration: true,
      ),
    ],
    debug: true,
  );
  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // طلب الإذن من المستخدم
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
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
        RepositoryProvider<JsonService>(
          create: (_) => JsonService(),
        ),
      ],
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
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
      light: LightTheme(isTablet: isTablet).themeData,
      dark: DarkTheme(isTablet: isTablet).themeData,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (light, dark) => MultiBlocProviders(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context)
                      .unfocus(); // إخفاء الكيبورد لو كان ظاهر
                  _clearSelection(); // 👈 كانت ناقصة أقواس
                },
                behavior: HitTestBehavior.translucent,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: const [Locale('ar', 'LB')],
                  locale: const Locale('ar', 'LB'),
                  title: 'مكتبة المسلم',
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
                        body: Center(
                            child: Text('Page not found: ${settings.name}')),
                      ),
                    );
                  },
                ),
              ),
              context: context)
          .MultiBloc,
    );
  }
}
