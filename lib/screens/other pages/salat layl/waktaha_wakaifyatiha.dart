// import 'package:flutter/material.dart';
// import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../widgets/add_custom_bottom_navigation_bar.dart';
// import '../../../widgets/list_of_nine_verses.dart';
// import '../../favorites_provider.dart';
// import '../../favorites_screen.dart';
// import '../salat_allayl.dart';
// import 'dou3aa_7azin.dart';
// import 'sawabaha_wa_fawa2idaha.dart';

// class WaktahaWakaifyatiha extends StatefulWidget {
//   static String screenRoute = 'waktaha_wakaifyatiha_screen';
//   const WaktahaWakaifyatiha({super.key});

//   @override
//   State<WaktahaWakaifyatiha> createState() => _WaktahaWakaifyatihaState();
// }

// double _fontSize = 18;
// double _fontSizeTablet = 30;

// class _WaktahaWakaifyatihaState extends State<WaktahaWakaifyatiha> {
//   bool isIcon = true;
//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteState();
//   }

//   Future<void> _loadFavoriteState() async {
//     final prefs = await SharedPreferences.getInstance();
//     bool? savedState = prefs.getBool('isFavorite_waktaha_wakaifyatiha_screen');
//     setState(() {
//       isIcon = savedState ?? true;
//     });
//   }

//   Future<void> _saveFavoriteState(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isFavorite_waktaha_wakaifyatiha_screen', value);
//   }

//   Future<bool> _onWillPop() async {
//     final args =
//         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
//     final previousPage = args?['previousPage'];
//     if (previousPage == 'favorite_screen') {
//       Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
//       return false;
//     } else {
//       Navigator.of(context).pushReplacementNamed(SalatAllayl.screenRoute);
//       return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double size = MediaQuery.of(context).textScaleFactor;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth >= 600;
//     return WillPopScope(
//       onWillPop: _onWillPop,
//       child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: isTablet ? 100 : 50,
//           centerTitle: true,
//           leading: IconButton(
//             onPressed: _onWillPop,
//             icon: Icon(
//               Icons.arrow_back,
//               size: isTablet ? 50 : 25,
//             ),
//           ),
//           actions: [
//             IconButton(
//               padding: EdgeInsets.only(left: isTablet ? 50 : 30),
//               icon: Icon(
//                 isIcon ? Icons.favorite_border : Icons.favorite_rounded,
//                 size: isTablet ? 40 : 25,
//                 color: isIcon ? Colors.black : Colors.red,
//               ),
//               onPressed: () async {
//                 setState(() {
//                   isIcon = !isIcon;
//                 });
//                 await _saveFavoriteState(isIcon);

//                 if (!isIcon) {
//                   Provider.of<FavoritesProvider>(context, listen: false)
//                       .addFavorite(
//                           'وقتها وكيفيتها', WaktahaWakaifyatiha.screenRoute);
//                 } else {
//                   Provider.of<FavoritesProvider>(context, listen: false)
//                       .removeFavorite(
//                           'وقتها وكيفيتها',
//                           WaktahaWakaifyatiha.screenRoute,
//                           WaktahaWakaifyatiha.screenRoute);
//                 }
//               },
//             ),
//           ],
//           title: Text(
//             'وقتها وكيفيتها',
//             style: TextStyle(
//               fontSize: isTablet
//                   ? 40
//                   : size > 1.0
//                       ? 20
//                       : 23,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: ContainerScrollview(
//           widget: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: Text(
//                         'بسم الله الرحمن الرحيم',
//                         style: TextStyle(
//                           fontSize: isTablet ? _fontSizeTablet : _fontSize,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Text(
//                         'اللهم صلِّ على محمد وآل محمد',
//                         style: TextStyle(
//                           fontSize: isTablet ? _fontSizeTablet : _fontSize,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 child: ListOfNineVerses(
//                   title: '',
//                   subtitle:
//                       'وقتها من إنتصاف الليل إلى طلوع الفجر، وأفضله السحر وهو الثلث الأخير من الليل. وهي إحدى عشر ركعة، "نافلة الليل": ( ثمان ركعات + ركعتا الشفع + ركعة الوتر )\n\n'
//                       'ثمان ركعات كل إثنتين على حدة تقرأ فيها ما شئت من السور، وإن كان يستحب في أول ركعتين أن تقرأ الحمد والتوحيد في الأولى، والحمد والكافرون في الثانية.\n\n'
//                       'ثم ركعتا الشفع تقرأ فيها ما شئت ويستحب أن تقرأ في الأولى الحمد والفلق وفي الثانية الحمد والناس بدون قنوت.\n\n'
//                       'ثم ركعة الوتر ويستحب أن تقرأ فيها الحمد مرة واحدة والتوحيد ثلاث مرات والمعوذتين مرة واحدة وتقنت فيها بالقنوت التالي، تقرأ دعاء الفرج:\n\n'
//                       '- لا إله إلا الله الحليم الكريم لا إله إلا الله العلي العظيم، سبحان الله رب السماوات السبع ورب الأراضين السبع وما فيهن وما بينهن رب العرش العظيم، والحمد لله رب العالمين وسلام على المرسلين.\n'
//                       '- تستغفر لأربعين مؤمناً ومؤمنةً أحياءً وأمواتاً: "اللهم إغفر لفلان.......\n'
//                       '- تستغفر لنفسك سبعين مرة: "أستغفر الله ربي وأتوب إليه".\n'
//                       '- تقول: "العفو" ثلاثمائة مرة، وتقول بعدها: "ربّ اغفر لي وارحمني وتُب عليّ إنك أنت التوّاب الرحيم".\n'
//                       '- وتقول: "هذا مقام العائذ بك من النار، أسـتغفر الله الذي لا إله إلا هـو الحي القيوم ذو الجـلال والإكرام لجميع ظلمي وجرمي وإسرافي على نفسي وأتوب إليك" سبع مرات، وتنهي الصلاة.\n\n'
//                       'فإن فرغت من الصلاة فسبّح تسبيحة الزهراء سلام الله عليها، ثم تقرأ هذا الدعاء: "الحمد لله لرب الصباح لفالق الإصباح، سبحان ربي الملك القدّوس العزيز الحكيم، يا حي يا قيوم يا بَرّ يا رحيم يا غني يا كريم أرزقني من التجارة أعظمها فضلاً وأوسعها رزقاً وخيرها عافية فإنه لا خير فيما لا عافية له".\n\n'
//                       'ثم تسجد وتقول: "سُبّوحْ قُدّوسْ رب الملائكة والروح"، ثم تجلس وتقرأ آية الكرسي خمس مرات. وتسجد سجدتي الشكر لله سبحانه وتعالى...',
//                   weight: FontWeight.w600,
//                   size: isTablet ? _fontSizeTablet : _fontSize,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: AddCustomBottomNavigationBar(
//           pushNext: Dou3aa7azin.screenRoute,
//           pushBack: SawabahaWaFawa2idaha.screenRoute,
//           soud: '',
//           onTap: (double fontSize) {
//             // تحديث حجم الخط
//             setState(() {
//               isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
//             });
//             print('fontSize: $fontSize');
//             // إغلاق Dialog
//             Navigator.of(context).pop();
//           },
//           onLongPress: () {
//             final snackBar = SnackBar(
//               content: Center(
//                 child: Text(
//                   '${isTablet ? _fontSizeTablet.toInt() : _fontSize.toInt()}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               width: 60,
//               behavior: SnackBarBehavior.floating,
//               backgroundColor: Colors.blue,
//               duration: Duration(seconds: 2),
//               shape: ShapeBorder.lerp(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 1,
//               ),
//             );
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../counter page/tesbiha_page.dart';
import '../salat_allayl.dart';
import 'dou3aa_7azin.dart';
import 'name_list_page.dart';
import 'sawabaha_wa_fawa2idaha.dart';

class WaktahaWakaifyatiha extends StatefulWidget {
  static String screenRoute = 'waktaha_wakaifyatiha_screen';
  const WaktahaWakaifyatiha({super.key});

  @override
  State<WaktahaWakaifyatiha> createState() => _WaktahaWakaifyatihaState();
}

class _WaktahaWakaifyatihaState extends State<WaktahaWakaifyatiha> {
  bool isIcon = true;
  bool _showHiddenButtons = false;

  double _fontSize = 18;
  double _fontSizeTablet = 30;

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_waktaha_wakaifyatiha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_waktaha_wakaifyatiha_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(SalatAllayl.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showHiddenButtons = !_showHiddenButtons;
          });
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: isTablet ? 100 : 50,
            centerTitle: true,
            leading: IconButton(
              onPressed: _onWillPop,
              icon: Icon(
                Icons.arrow_back,
                size: isTablet ? 50 : 25,
              ),
            ),
            actions: [
              IconButton(
                padding: EdgeInsets.only(left: isTablet ? 50 : 30),
                icon: Icon(
                  isIcon ? Icons.favorite_border : Icons.favorite_rounded,
                  size: isTablet ? 40 : 25,
                  color: isIcon ? Colors.black : Colors.red,
                ),
                onPressed: () async {
                  setState(() {
                    isIcon = !isIcon;
                  });
                  await _saveFavoriteState(isIcon);

                  if (!isIcon) {
                    Provider.of<FavoritesProvider>(context, listen: false)
                        .addFavorite(
                            'وقتها وكيفيتها', WaktahaWakaifyatiha.screenRoute);
                  } else {
                    Provider.of<FavoritesProvider>(context, listen: false)
                        .removeFavorite(
                            'وقتها وكيفيتها',
                            WaktahaWakaifyatiha.screenRoute,
                            WaktahaWakaifyatiha.screenRoute);
                  }
                },
              ),
            ],
            title: Text(
              'وقتها وكيفيتها',
              style: TextStyle(
                fontSize: isTablet
                    ? 40
                    : size > 1.0
                        ? 20
                        : 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Stack(
            children: [
              ContainerScrollview(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'بسم الله الرحمن الرحيم',
                        style: TextStyle(
                          fontSize: isTablet ? _fontSizeTablet : _fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'اللهم صلِّ على محمد وآل محمد',
                        style: TextStyle(
                          fontSize: isTablet ? _fontSizeTablet : _fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    ListOfNineVerses(
                      title: '',
                      subtitle:
                          'وقتها من إنتصاف الليل إلى طلوع الفجر، وأفضله السحر وهو الثلث الأخير من الليل. وهي إحدى عشر ركعة، "نافلة الليل": ( ثمان ركعات + ركعتا الشفع + ركعة الوتر )\n\n'
                          'ثمان ركعات كل إثنتين على حدة تقرأ فيها ما شئت من السور، وإن كان يستحب في أول ركعتين أن تقرأ الحمد والتوحيد في الأولى، والحمد والكافرون في الثانية.\n\n'
                          'ثم ركعتا الشفع تقرأ فيها ما شئت ويستحب أن تقرأ في الأولى الحمد والفلق وفي الثانية الحمد والناس بدون قنوت.\n\n'
                          'ثم ركعة الوتر ويستحب أن تقرأ فيها الحمد مرة واحدة والتوحيد ثلاث مرات والمعوذتين مرة واحدة وتقنت فيها بالقنوت التالي، تقرأ دعاء الفرج:\n\n'
                          '- لا إله إلا الله الحليم الكريم لا إله إلا الله العلي العظيم، سبحان الله رب السماوات السبع ورب الأراضين السبع وما فيهن وما بينهن رب العرش العظيم، والحمد لله رب العالمين وسلام على المرسلين.\n'
                          '- تستغفر لأربعين مؤمناً ومؤمنةً أحياءً وأمواتاً: "اللهم إغفر لفلان.......\n'
                          '- تستغفر لنفسك سبعين مرة: "أستغفر الله ربي وأتوب إليه".\n'
                          '- تقول: "العفو" ثلاثمائة مرة، وتقول بعدها: "ربّ اغفر لي وارحمني وتُب عليّ إنك أنت التوّاب الرحيم".\n'
                          '- وتقول: "هذا مقام العائذ بك من النار، أسـتغفر الله الذي لا إله إلا هـو الحي القيوم ذو الجـلال والإكرام لجميع ظلمي وجرمي وإسرافي على نفسي وأتوب إليك" سبع مرات، وتنهي الصلاة.\n\n'
                          'فإن فرغت من الصلاة فسبّح تسبيحة الزهراء سلام الله عليها، ثم تقرأ هذا الدعاء: "الحمد لله لرب الصباح لفالق الإصباح، سبحان ربي الملك القدّوس العزيز الحكيم، يا حي يا قيوم يا بَرّ يا رحيم يا غني يا كريم أرزقني من التجارة أعظمها فضلاً وأوسعها رزقاً وخيرها عافية فإنه لا خير فيما لا عافية له".\n\n'
                          'ثم تسجد وتقول: "سُبّوحْ قُدّوسْ رب الملائكة والروح"، ثم تجلس وتقرأ آية الكرسي خمس مرات. وتسجد سجدتي الشكر لله سبحانه وتعالى...',
                      weight: FontWeight.w600,
                      size: isTablet ? _fontSizeTablet : _fontSize,
                    ),
                  ],
                ),
              ),
              if (_showHiddenButtons)
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(TesbihPage.screenRoute);
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.red,
                          size: isTablet ? 40 : 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(NameListPage.screenRoute);
                        },
                        child: Icon(
                          Icons.group_add,
                          color: Colors.red,
                          size: isTablet ? 40 : 20,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          bottomNavigationBar: AddCustomBottomNavigationBar(
            pushNext: Dou3aa7azin.screenRoute,
            pushBack: SawabahaWaFawa2idaha.screenRoute,
            soud: '',
            onTap: (double fontSize) {
              setState(() {
                isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
              });
              Navigator.of(context).pop();
            },
            onLongPress: () {
              final snackBar = SnackBar(
                content: Center(
                  child: Text(
                    '${isTablet ? _fontSizeTablet.toInt() : _fontSize.toInt()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                width: 60,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.blue,
                duration: const Duration(seconds: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}
