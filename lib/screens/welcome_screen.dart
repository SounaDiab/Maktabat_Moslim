import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'other_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about/about_us.dart';
import 'books.dart';
import 'favorites_screen.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WelcomeScreen extends StatefulWidget {
  static String screenRoute = 'welcome_screen';
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isMode = true;
  File? _backgroundImage;
  final String _imagePathKey = 'background_image_path';
  @override
  void initState() {
    super.initState();
    _localBackgroundImage();
    Future.delayed(const Duration(seconds: 1), () {
      _checkForUpdates();
    });
  }

  Future<void> _checkForUpdates() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: Duration(seconds: 10),
        minimumFetchInterval: Duration(hours: 1),
      ),
    );
    await remoteConfig.fetchAndActivate();
    final latestVersion = remoteConfig.getString('latest_version');
    final forceUpdate = remoteConfig.getBool('force_update');
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;

    if (forceUpdate && currentVersion != latestVersion) {
      // Show update dialog or notification
      print('New version available: $latestVersion');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('تحديث جديد متوفر'),
                content: Text(
                    'يتوفر إصدار جديد ($latestVersion). يُرجى التحديث للمتابعة.'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse(
                              'https://play.google.com/store/apps/details?id=com.hassandiab.maktabat_almoslim'),
                          mode: LaunchMode.externalApplication);
                      SystemNavigator.pop();
                    },
                    child: Text('تحديث'),
                  ),
                ],
              ),
          barrierDismissible: false);
    } else {
      print('App is up to date: $currentVersion');
    }
  }

  Future<void> _localBackgroundImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString(_imagePathKey);
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _backgroundImage = File(imagePath);
      });
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File selectedImage = File(image.path);
      setState(() {
        _backgroundImage = selectedImage;
      });
      _saveBackgroundImage(selectedImage.path);
    }
  }

  Future<void> _saveBackgroundImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imagePathKey, path);
  }

  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      // Handle denied permissions
      print('Permission denied');
    } else {
      print('Permission granted');
    }
  }

  Future<void> resetBackground() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_imagePathKey);
    setState(() {
      _backgroundImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.sizeOf(context).width;
    double sizeHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final isLandscape = screenWidth >= 1000;
    return WillPopScope(
      onWillPop: () async => true,
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: sizeWidth,
                height: sizeHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    opacity: 1,
                    image: _backgroundImage != null
                        ? FileImage(_backgroundImage!)
                        : AssetImage('images/background2.jpg'),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 50,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        width: isTablet ? sizeWidth / 0.560 : sizeWidth / 0.594,
                        top: sizeHeight / 1000,
                        left: 1,
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              isMode = !isMode;
                              isMode
                                  ? AdaptiveTheme.of(context).setLight()
                                  : AdaptiveTheme.of(context).setDark();
                            });
                          },
                          icon: Icon(
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            size: isTablet ? 50 : 30,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(-1, 3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: isTablet
                            ? isLandscape
                                ? sizeWidth / 2.8
                                : sizeWidth / 3.6
                            : sizeWidth > 360
                                ? sizeWidth / 3.9
                                : sizeWidth / 5.5,
                        top: isTablet
                            ? isLandscape
                                ? sizeHeight / 14
                                : sizeHeight / 9.5
                            : sizeHeight < 820
                                ? sizeHeight / 12
                                : sizeHeight / 11,
                        child: Text(
                          'مكتبة المسلم',
                          style: TextStyle(
                            fontSize: isTablet ? 50 : 26,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal',
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset:
                                    isTablet ? Offset(-3, 9) : Offset(-1, 3),
                                blurRadius: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            color: Colors.transparent,
                            width: sizeWidth,
                            margin: EdgeInsets.only(
                              left: isTablet
                                  ? isLandscape
                                      ? 250
                                      : 60
                                  : 20,
                              right: isTablet
                                  ? isLandscape
                                      ? 250
                                      : 60
                                  : 20,
                              top: isLandscape ? 100 : 250,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.2),
                                elevation: 0.1,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, Books.screenRoute);
                                print(sizeWidth);
                                print(sizeHeight);
                              },
                              child: Text(
                                'الكتب',
                                style: TextStyle(
                                  fontSize: isTablet ? 40 : 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Tajawal',
                                  letterSpacing: 3,
                                  shadows: [
                                    Shadow(
                                      offset: isTablet
                                          ? Offset(-3, 9)
                                          : Offset(-1, 3),
                                      blurRadius: 10,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: sizeWidth,
                            margin: EdgeInsets.symmetric(
                                horizontal: isTablet
                                    ? isLandscape
                                        ? 250
                                        : 60
                                    : 20),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.2),
                                elevation: 0.1,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, OtherScreen.screenRoute);
                              },
                              child: Text(
                                'التقويم',
                                style: TextStyle(
                                  fontSize: isTablet ? 40 : 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Tajawal',
                                  letterSpacing: 3,
                                  shadows: [
                                    Shadow(
                                      offset: isTablet
                                          ? Offset(-3, 9)
                                          : Offset(-1, 3),
                                      blurRadius: 10,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        width: sizeWidth / 1.1,
                        top: isTablet
                            ? isLandscape
                                ? sizeHeight / 1.28
                                : sizeHeight / 1.16
                            : sizeHeight / 1.235,
                        left: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AboutUs.screenRoute);
                                  },
                                  icon: Icon(
                                    Icons.info,
                                    size: isTablet ? 50 : 30,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: isTablet
                                            ? Offset(-3, 9)
                                            : Offset(-1, 3),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, FavoritesScreen.screenRoute);
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    size: isTablet ? 50 : 30,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(-1, 3),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    resetBackground();
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    size: isTablet ? 50 : 30,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(-1, 3),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    requestPermissions();
                                    pickImage();
                                  },
                                  icon: Icon(
                                    Icons.image,
                                    size: isTablet ? 50 : 30,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        offset: Offset(-1, 3),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
