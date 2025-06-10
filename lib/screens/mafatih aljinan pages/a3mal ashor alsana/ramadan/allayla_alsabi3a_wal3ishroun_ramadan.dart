import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'dou3aa_allayla_alsabi3a_wal3ishroun_ramadan.dart';
import 'dou3aa_allayla_alsamina_wal3ishroun_ramadan.dart';

class AllaylaAlsabi3aWal3ishrounRamadan extends StatefulWidget {
  static String screenRoute = 'allayla_alsabi3a_wal3ishroun_ramadan_screen';
  const AllaylaAlsabi3aWal3ishrounRamadan({super.key});

  @override
  State<AllaylaAlsabi3aWal3ishrounRamadan> createState() =>
      _AllaylaAlsabi3aWal3ishrounRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAlsabi3aWal3ishrounRamadanState
    extends State<AllaylaAlsabi3aWal3ishrounRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_alsabi3a_wal3ishroun_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_allayla_alsabi3a_wal3ishroun_ramadan_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ramadan.screenRoute);
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
                      .addFavorite('الليلة السابعة والعشرون',
                          AllaylaAlsabi3aWal3ishrounRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة السابعة والعشرون',
                          AllaylaAlsabi3aWal3ishrounRamadan.screenRoute,
                          AllaylaAlsabi3aWal3ishrounRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة السابعة والعشرون',
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
                      'ورد فيها الغسل وروي انّ الامام زين العابدين (عليه السلام) كان يقول فيها من اوّل اللّيلة الى آخرها: اَللّـهُمَّ ارْزُقْني التَّجافِيَ عَنْ دارِ الغُرُورِ، وَالاِنابَةَ اِلى دارِ الْخُلُودِ، وَالاسْتِعْدادَ لِلْمَوْتِ قَبْلَ حُلُولِ الْفَوْتِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'آخر ليلة من الشّهر هي ليلة كثيرة البركات وفيها أعمال :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle: 'الغُسل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle: 'زيارة الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'قراءة سور الانعام والكهف ويس ومائة مرّة اَسْتَغْفِرُ اللهَ واَتُوبُ اِلَيْهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يدعو بهذا الدّعاء الذي رواه الكليني عن الصّادق (عليه السلام) :\n'
                      'اَللّـهُمَّ هذا شَهْرُ رَمَضانَ الَّذي اَنْزَلْتَ فيهِ الْقُرْآنَ، وَقَدْ تَصَرَّمَ وَاَعُوذُ بِوَجْهِكَ الْكَريمِ يا رَبِّ أنْ يَطْلُعَ الْفَجْرُ مِنْ لَيْلَتي هذِهِ، اَوْ يَتَصَرَّمَ شَهْرُ رَمَضانَ وَلَكَ قِبَلي تَبِعَةٌ اَوْ ذَنْبٌ تُريدُ اَنْ تُعَذِّبَني بِهِ يَوْمَ اَلْقاكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يدعو بالدّعاء يا مُدَبِّرَ الاُمُورِ الخ الذي مضى في أعمال اللّيلة الثّالثة والعشرين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يودّع شهر رمضان بدعوات الوداع التي رواها الكليني والصّدوق والمفيد والطّوسي والسّيد ابن طاووس رضوان الله عليهم ولعلّ احسنها هو الدّعاء الخامس والاربعون من الصّحيفة الكاملة ، وروى السّيد ابن طاووس عن الصّادق (عليه السلام) قال : مَن ودّع شهر رمضان، في آخر ليلة منه وقال : اَللّـهُمَّ لا تَجْعَلْهُ آخرَ الْعَهْدِ مِنْ صِيامي لِشَهْرِ رَمَضانَ وَاَعُوذُ بِكَ اَنْ يَطْلُعَ فَجرُ هذِهِ اللَّيْلَةِ إلاّ وَقَد غَفَرْتَ لي غفر الله تعالى له قبل أن يصبح ورزقه الانابة اليه وروى السّيد والشّيخ الصّدوق عن جابر بن عبد الله الانصاري قال : دخلت على رسول الله (صلى الله عليه وآله وسلم) في آخر جمعة من شهر رمضان فلمّا أبصر بي قال لي : يا جابر هذا آخر جُمعة من شهر رمضان فودّعه وقل : اَللّـهُمَّ لا تَجْعَلْهُ اخرَ الْعَهْدِ مِنْ صِيامِنا اِيّاهُ فَاِنْ جَعَلْتَهُ فَاجْعَلْني مَرْحُوماً وَلا تَجْعَلني مَحْرُوماً، فانّه من قال ذلك ظفر باحدى الحسنيين امّا ببلوغ شهر رمضان من قابل، وأمّا بغفران الله ورحمته.\n\n'
                      'وروى السّيد ابن طاووس والكفعمي عن النّبي (صلى الله عليه وآله وسلم) قال : من صلّى آخر ليلة من شهر رمضان عشر ركعات يقرأ في كلّ ركعة فاتحة الكتاب مرّة واحدة وقُلْ هُوَ اللهُ اَحَدٌ عشر مرّات ويقول في ركوعه وسجوده عشر مرّات سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ، ويتشهّد في كلّ ركعتين ثمّ يسلّم فاذا فرغ من آخر عشر ركعات وسلّم استغفر الله ألف مرّة، فاذا فرغ من الاستغفار سجد ويقول في سجوده : يا حِيُّ يا قَيُّومُ، يا ذَا الْجَلالِ وَالاِكْرام، يا رِحْمنَ الدُّنْيا وَالاخِرَةِ وَرَحيمَهُما، يا اَرْحَمَ الرّاحِمينَ، يا اِلـهَ الاَوَّلينَ وَالاخِرينَ، اِغْفِرْ لَنا ذُنُوبَنا، وَتَقَبَّلْ مِنّا صَلاتَنا وَصِيامَنا وَقِيامَنا.\n\n'
                      'قال النّبي (صلى الله عليه وآله وسلم) : والذي بعثني بالحقّ نبيّاً انّ جبرئيل أخبرني عن اسرافيل عن ربّه تبارك وتعالى انّه لا يرفع رأسه من السّجود حتّى يغفر الله له ويتقبّل منه شهر رمضان ويتجاوز عن ذنوبه الخبر، وقد روّيت هذه الصّلاة في ليلة عيد الفطر أيضاً ولكن في تلك الرّواية انّه يسبّح بالتسبيحات الاربع في الرّكوع والسّجود.\n\n'
                      'وورد في دعاء السّجود بعد الصّلاة عوض اِغْفِرْ لَنا ذُنُوبَنا الى آخر الدّعاء اِغْفِرْ لي ذُنُوبي وَتَقَبَّلْ صَوْمي وَصَلاتي وَقِيامي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Dou3aaAllaylaAlsaminaWal3ishrounRamadan.screenRoute,
        pushBack: Dou3aaAllaylaAlsabi3aWal3ishrounRamadan.screenRoute,
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
