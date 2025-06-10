import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../rajab.dart';
import 'alyawm_al2a5ir_men_alshaher.dart';
import 'alyawm_al2awal_men_rajab.dart';

class Al2a3malAl5asaBrajab extends StatefulWidget {
  static String screenRoute = 'al2a3mal_al5asa_brajab_screen';
  const Al2a3malAl5asaBrajab({super.key});

  @override
  State<Al2a3malAl5asaBrajab> createState() => _Al2a3malAl5asaBrajabState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Al2a3malAl5asaBrajabState extends State<Al2a3malAl5asaBrajab> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_al2a3mal_al5asa_brajab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_al2a3mal_al5asa_brajab_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Rajab.screenRoute);
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
                      .addFavorite(
                          'في الأعمال الخاصة بليالي أو أيام خاصة من رجب',
                          Al2a3malAl5asaBrajab.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في الأعمال الخاصة بليالي أو أيام خاصة من رجب',
                          Al2a3malAl5asaBrajab.screenRoute,
                          Al2a3malAl5asaBrajab.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في الأعمال الخاصة بليالي أو أيام خاصة من رجب',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'الليلة الاُولى : هي ليلة شريفة وقد ورد فيها أعمال :',
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
                  subtitle:
                      'أن يقول اذا رأى الهلال: اَللّـهُمَّ اَهِلَّهُ عَلَيْنا بِالاَْمْنِ وَالاْيمانِ وَالسَّلامَةِ وَالاِْسْلامِ رَبّي وَرَبُّكَ اللهُ عَزَّوَجَلَّ وروي عن النّبي (صلى الله عليه وآله وسلم)انّه كان اذا رأى هلال رجب قال :\n\n'
                      'َللّـهُمَّ بارِكْ لَنا في رَجَب وَشَعْبانَ، وبَلِّغْنا شَهْرَ رَمَضانَ، واَعِنّا عَلَى الصِّيامِ وَالْقِيامِ وَحِفْظِ اللِّسانِ، وَغَضِّ الْبَصَرِ، وَلا تَجْعَلْ حَظَّنا مِنْهُ الْجُوعَ وَالْعَطَشَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'أن يغتسل، فمن بعض العلماء عن النّبي (صلى الله عليه وآله وسلم) انّه قال : من أدرك شهر رجب فاغتسل في أوّله وأوسطه وآخره خرج مِن ذنوبه كيوم ولدته اُمّه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle: 'أن يزور الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يُصلّي بعد صلاة المغرب عشرين ركعة يقرأ في كلّ ركعة فاتحة الكتاب وقُل هو الله احد مرّة ويسلم بين كلّ ركعتين ليحفظ في أهله وماله ووَلده، ويجار مِن عذاب القبر، ويجوز على الصّراط كالبرق الخاطف من غير حساب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يصلّي ركعتين بعد العشاء يقرأ في أوّل ركعة منها فاتحة الكتاب وألم نشرح مرّة، وقل هو الله احدٌ ثلاث مرّات، وفي الرّكعة الثّانية فاتحة الكتاب وألم نشرح وقُلْ هُوَ اللهُ احدٌ والمعوّذتين، فاذا سلّم قال: لا اِلـهَ إلاَّ اللهُ ثلاثين مرّة، وصلّى على النّبي (صلى الله عليه وآله وسلم) ثلاثين مرّة ليغفر الله له ذنوبه ويخرج منها كيوم ولدته اُمّه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يصلّي ثلاثين ركعة يقرأ في كلّ ركعة فاتحة الكتاب وقُلْ يا أيّها الكافِرُونَ مرّة، وسورة التوحيد ثلاث مرّات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابع :',
                  subtitle:
                      'أن يأتي بما ذكره الشّيخ في المصباح حيث قال : العمل في أوّل ليلة من رجب : روى ابو البختري وهب بن وهب عن الصّادق (عليه السلام): عن أبيه، عن جدّه، عن عليّ (عليه السلام) قال : كان يعجبه أن يفرغ نفسه أربع ليال في السّنة، وهي أوّل ليلة من رجب، وليلة النّصف من شعبان، وليلة الفطر، وليلة النّحر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'وروى عن أبي جعفر الثّاني (عليه السلام) انّه قال : يستحبّ أن يدعو بهذا الدّعاء أوّل ليلة من رجب بعد العشاء الاخرة :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي اَساَلُكَ بِاَنَّكَ مَلِكٌ، واَنَّكَ عَلى كُلِّ شَيْيء  مُقْتَدِرٌ، وَاَنَّكَ ما تَشاءُ مِنْ أَمْر يَكُونُ، اَللّـهُمَّ اِنّي اَتَوجَّهُ اِلَيْكَ بِنَبِيِّكَ مُحَمَّد نَبِيِّ الرَّحْمَةِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، يا مُحَمَّدُ يا رَسُولَ اللهِ، اِنّي اَتَوجَّهُ بِكَ اِلَى اللهِ رَبِّكَ وَرَبِّي لِيُنْجِحَ لي بِكَ طَلِبَتي، اَللّـهُمَّ بِنَبِيِّكَ مُحَمَّد وَالاَْئِمَّةِ مِنْ اَهْلِ بَيْتِهِ صَلَّى اللهُ عَلَيْهِ وَعَلَيْهِمْ اَنْجِحْ طَلِبَتي . ثمّ تسأل حاجتك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'وروى عليّ بن حديد قال : كان موسى بن جعفر (عليه السلام) يقول وهو ساجد بعد فراغه من صلاة اللّيل :',
                  subtitle:
                      'لَكَ الَْمحْمِدَةُ أنْ اَطَعْتُكَ، وَلَكَ الْحُجَّةُ أنْ عَصَيْتُكَ، لا صُنْعَ لي وَلا لِغَيْري في اِحْسان إِلاّ بِكَ، ياكائِن (كائناً) قَبْلَ كُلِّ شَيْيء ، وَيا مُكَوِّنَ كُلِّ شَيْيء ، اِنَّكَ عَلى كُلِّ شَيْيء  قَديرٌ، اَللّـهُمَّ اِنّي اَعُوذُ بِكَ مِنَ الْعَديلَةِ عِنْدَ الْمَوْتِ، وَمِنْ شَرِّ الْمَرْجِعِ فِي الْقُبُورِ، وَمِنَ النَّدامَةِ يَوْمَ الاْزِفَةِ، فَاَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، واَنْ تَجْعَلَ عَيْشي عَيْشَةً نَقِيَّةً وَميتَتي ميتَةً سَوِيَّةً، وَمُنْقَلَبي مُنْقَلَباً كَريماً، غَيْرَ مُخْز وَلا فاضِح، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِهِ الاَْئِمَّةَ، يَنابيعِ الْحِكْمَةِ وَاُولِى النِّعْمَةِ وَمَعادِنِ الْعِصْمَةِ، وَاْعصِمْني بِهِمْ مِنْ كُلِّ سُوء، وَلا تَأخُذْني عَلى غِرَّة، وَلا عَلى غَفْلَة، وَلا تَجْعَلْ عَواقِبَ اَعْمالي حَسْرةً، وَارْضَ عَنّي فَاِنَّ مَغْفِرَتَكَ لِلظّالِمينَ، وَاَنَا مِنَ الظّالِمينَ اَللّـهُمَّ اغْفِرْ لي ما لا يَضُرُّكَ، واَعْطِني ما لا يَنْقُصُكَ، فَاِنَّكَ الْوسيعُ رَحْمَتُهُ، الْبدَيعُ حِكْمَتُهُ، وَاَعْطِني السَّعَةَ وَالدِّعَةَ، والاَْمْنَ وَالصِّحَّةَ، وَالْبُخُوعَ وَالْقُنُوعَ، وَالشُّكْرَ وَالْمُعافاةَ، والتَّقْوى وَالصَّبْرَ، وَالصِّدْقَ عَلَيْكَ وَعَلى اَوْلِيائِكَ، وَالْيُسْرَ وَالشُّكْرَ، وَاَعْمِمْ بِذلِكَ يا رَبِّ اَهْلي وَوَلَدي وَاِخْواني فيكَ وَمَنْ اَحْبَبْتُ وَاَحَبَّني، وَوَلَدْتُ وَوَلَدَني مِنَ الْمُسْلِمينَ وَالْمُؤْمِنينَ يا رَبَّ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'قال ابن أشيم: هذا الدّعاء يعقب الثّماني ركعات صلاة اللّيل قبل صلاة الوتر، ثمّ تصلي الثلاث ركعات صلاة الوتر فاذا سلّمت قلت وأنت جالِس :',
                  subtitle:
                      'اَلْحَمْدُ للهِ الَّذي لا تَنْفَدُ خَزائِنُهُ، وَلا يَخافُ آمِنُهُ، رَبِّ اِنِ ارْتَكَبْتُ الْمَعاصِيَ فَذلِكَ ثِقَةٌ مِنّي بِكَرَمِكَ اِنَّكَ تَقْبَلُ التَّوْبَةَ عَنْ عِبادِكَ، وَتَعْفُو عَنْ سَيِّئاتِهِمْ، وَتَغْفِرُ الزَّلَلَ، وَاِنَّكَ مُجيبٌ لِداعيكَ وَمِنْهُ قَريبٌ، وَاَنَا تائِبٌ اِلَيْكَ مِنَ الْخَطايا، وَراغِبٌ اِلَيْكَ في تَوْفيرِ حَظّي مِنَ الْعَطايا، يا خالِقَ الْبَرايا، يا مُنْقِذي مِنْ كُلِّ شَديدَة، يا مُجيري مِنْ كُلِّ مَحْذُور، وَفِّرْ عَلَيَّ السُّرُورَ، وَاكْفِني شَرَّ عَواقِبِ الاْمُورِ، فَاَنْتَ اللهُ عَلى نَعْمائِكَ وَجَزيلِ عَطائِكَ مَشْكُورٌ وَلِكُلِّ خَيْر مَذْخُورٌ.\n\n'
                      'واعلم انّ لكلّ ليلة من ليالي هذا الشّهر الشّريف صلاة خاصّة ذكرها علماؤنا ولا يسمح لنا المقام نقلها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAl2awalMenRajab.screenRoute,
        pushBack: AlyawmAl2a5irMenAlshaher.screenRoute,
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
