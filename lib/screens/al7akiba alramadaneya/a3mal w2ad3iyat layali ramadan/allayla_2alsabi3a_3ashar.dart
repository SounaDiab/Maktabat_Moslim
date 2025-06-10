import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../../widgets/she3er.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_w2ad3iyat_layali_ramadan.dart';
import 'allayla_2al5amisa_3ashar.dart';
import 'allayla_2altasi3a_3ashar.dart';

class Allayla2alsabi3a3ashar extends StatefulWidget {
  static String screenRoute = 'allayla_2alsabi3a_3ashar_screen';
  const Allayla2alsabi3a3ashar({super.key});

  @override
  State<Allayla2alsabi3a3ashar> createState() => _Allayla2alsabi3a3asharState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Allayla2alsabi3a3asharState extends State<Allayla2alsabi3a3ashar> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_2alsabi3a_3ashar_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_allayla_2alsabi3a_3ashar_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context)
          .pushReplacementNamed(A3malW2ad3iyatLayaliRamadan.screenRoute);
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
                      .addFavorite('الليلة السابعة عشر',
                          Allayla2alsabi3a3ashar.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة السابعة عشر',
                          Allayla2alsabi3a3ashar.screenRoute,
                          Allayla2alsabi3a3ashar.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة السابعة عشر',
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
        body: ContainerScrollview(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
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
                  ],
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'ليلة مباركة جدّاً وفيها تقابل الجيشان في بدر ، جيش رسول الله (صلى الله عليه وآله وسلم) وجيش كفّار قريش، وفي يومها كانت غزوة بدر ونصر الله جيش رسول الله (صلى الله عليه وآله وسلم) على المشركين وكان ذلك أعظم فتوح الاسلام ولذلك قال علماؤنا يستحبّ الاكثار من الصّدقة والشّكر في هذا اليوم وللغسل والعبادة في ليله أيضاً فضل عظيم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'في روايات عديدة انّ النّبي (صلى الله عليه وآله وسلم) قال لاصحابه ليلة بدر من منكم يمضي في هذه اللّيلة الى البئر فيستقي لنا؟ فصمتوا ولم يقدم منهم أحد على ذلك، فأخذ امير المؤمنين (عليه السلام) قربة وانطلق يبغي الماء، وكانت ليلة ظلمآء باردة ذات رياح حتّى ورد البئر وكان عميقاً مظلماً، فلم يجد دلواً يستقي به فنزل في البئر وملا القربة، فارتقى وأخذ في الرّجوع، فعصفت عليه عاصفة جلس على الارض لشدّتها حتّى سكنت، فنهض واستأنف المسير واذا بعاصفة كالاولى تعترض طريقه فتجلسه على الارض، فلمّا هدأت العاصفة قام يواصل مسيره واذا بعاصفة ثالثة تعصف عليه فجلس على الارض، فلمّا زالت عنه قام وسلك طريقه حتّى بلغ النّبي (صلى الله عليه وآله وسلم) فسأله النّبي (صلى الله عليه وآله وسلم) فقال : يا أبا الحسن لماذا أبطأت ؟ فقال : عصفت عليّ عواصف ثلاث زعزعتني فمكثت لكي تزول ، فقال (صلى الله عليه وآله وسلم) : وهل علمت ما هي تلك العواصف يا علي ؟ فقال (عليه السلام) : لا ، فقال (صلى الله عليه وآله وسلم) : كانت العاصفة الاولى جبرئيل ومعه ألف ملك سلّم عليك وسلّموا، والثّانية كانت ميكائيل ومعه ألف ملك سلّم عليك وسلّموا، والثّالثة قد كانت اسرافيل ومعه ألف ملك سلّم عليك وسلّموا، وكلّهم قد هبطوا مدداً لنا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'الى هذا قد أشار من قال انّها كانت لامير المؤمنين (عليه السلام) ثلاثة آلاف منقبة في ليلة واحدة ويشير اليه السّيد الحميري في مدحه له (عليه السلام) في الشّعر :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'اُقسِمُ بِاللهِ وَآلائِهِ     وَالْمَرْءُ عَمّا قالَ مَسْؤُولُ\n\n'
                      'اِنَّ عَلِىَّ بنَ اَبى طالِب     عَلَى التُّقى وَالْبِرِّ مَجْبُولُ\n\n'
                      'كانَ اِذَا الْحَربُ مَرَتْهَا الْقَنا     وَاَحَجَمَتْ عَنْهَا البَهاليلُ\n\n'
                      'يَمْشي اِلَى الْقِرْنِ وَفي كَفِّهِ     اَبْيَضُ ماضِي الْحَدِّ مَصْقُولٌ\n\n'
                      'مَشْيَ الْعَفَرْنا بَيْنَ اَشْبالِهِ     اَبْرَزَهُ لِلْقَنَصِ الْغيلُ\n\n'
                      'ذاكَ الَّذي سَلَّمَ في لَيْلَة     عَلَيْهِ ميكالٌ وَجِبْريلُ\n\n'
                      'ميكالُ في اَلْف وَجِبْريلُ في     اَلْفِ وَيَتْلُوهُمْ سَرافيلُ\n\n'
                      'لَيْلَةَ بَدْر مَدَداً اُنْزِلُوا     كَاَنَّهُمْ طَيْرٌ اَبابيلُ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Allayla2altasi3a3ashar.screenRoute,
          pushBack: Allayla2al5amisa3ashar.screenRoute,
          soud: '',
          onTap: (double fontSize) {
            // تحديث حجم الخط
            setState(() {
              isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
            });
            print('fontSize: $fontSize');
            // إغلاق Dialog
            Navigator.of(context).pop();
          },
          onLongPress: () {
            final snackBar = SnackBar(
              content: Center(
                child: Text(
                  '${isTablet ? _fontSizeTablet.toInt() : _fontSize.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              width: 60,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.blue,
              duration: Duration(seconds: 2),
              shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                1,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
