import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'dou3aa_allayla_alrabi3a_wal3ishroun_ramadan.dart';
import 'douaa_allayla_alsania_wal3ishroun_ramadan.dart';

class AllaylaAlsalisaWal3ishrounRamadan extends StatefulWidget {
  static String screenRoute = 'allayla_alsalisa_wal3ishroun_ramadan_screen';
  const AllaylaAlsalisaWal3ishrounRamadan({super.key});

  @override
  State<AllaylaAlsalisaWal3ishrounRamadan> createState() =>
      _AllaylaAlsalisaWal3ishrounRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAlsalisaWal3ishrounRamadanState
    extends State<AllaylaAlsalisaWal3ishrounRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_alsalisa_wal3ishroun_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_allayla_alsalisa_wal3ishroun_ramadan_screen', value);
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
                      .addFavorite('الليلة الثالثة والعشرون (ليلة القدر)',
                          AllaylaAlsalisaWal3ishrounRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة الثالثة والعشرون (ليلة القدر)',
                          AllaylaAlsalisaWal3ishrounRamadan.screenRoute,
                          AllaylaAlsalisaWal3ishrounRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة الثالثة والعشرون (ليلة القدر)',
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
                      'وهي أفضل من اللّيلتين السّابقتين ويستفاد من أحاديث كثيرة انّها هي ليلة القدر وفيها يقدّر كلّ أمر حكيم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'دُعاء اللّيلة الثّالِثة وَالْعِشْرينَ',
                  subtitle:
                      'يا رَبَّ لَيْلَةِ الْقَدْر وَجاعِلَها خَيْراً مِنْ اَلْفِ شَهْر، وَرَبَّ اللَّيْلِ والنَّهارِ، وَالْجِبالِ والْبِحارِ، والظُّلَمِ والاَْنْوارِ، وَالاَْرْضِ وَالسَّماءِ، يا بارِئُ يا مُصَوِّرُ، يا حَنّانُ يا مَنّانُ، يا اَللهُ يا رَحْمنُ، يا اَللهُ يا بَديعُ، يا اَللهُ يا اَللهُ يا اَللهُ، لَكَ الاَْسْماءُ الْحُسْنى، وَالاَْمْثالُ الْعُلْيا، وَالْكِبْرِياءُ وَالالاءُ، اَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَجْعَلَ اسْمي في هذِهِ اللَّيْلَةِ فِى السُّعَداءِ، وَرُوحي مَعَ الشُّهَداءِ وَاِحْساني في عِلِّيّينَ، وَاِساءَتي مَغْفُورَةً، وَاَنْ تَهَبَ لي يَقيناً تُباشِرُ بِهِ قَلْبي وَايماناً يُذهِبُ الشَّكَّ عَنّي، وَتُرْضِيَني بِما قَسَمْتَ لي، وَآتِنا فِي الدُّنْيا حَسَنَةً وَفِي الاخِرَةِ حَسَنَةً، وَقِنا عَذابَ النّارِ الْحَريقِ، وَارْزُقْني فيها ذِكْرَكَ وَشُكْرَكَ وَالرَّغْبَةَ اِلَيْكَ وَالانابَةَ والتَّوبَةَ والتَّوْفيقَ لِما وَفَّقْتَ لَهُ مُحَمَّداً وَآلَ مُحَمَّد عَلَيْهِمُ السَّلامُ.\n\n'
                      'وروى محمّد بن عيسى بسنده عن الصّالحين (عليهم السلام) قالوا : كرّر في اللّيلة الثّالثة والعشرين من شهر رمضان هذا الدّعاء ساجداً وقائماً وقاعداً وعلى كلّ حال وفي الشّهر كلّه وكيف أمكنك ومتى حضرك من دهرك تقول بعد تمجيده تعالى والصّلاة على نبيّه (صلى الله عليه وآله وسلم):\n\n'
                      'اَللّـهُمَّ كُنْ لِوَلِيِّكَ فلان بن فلان وتقول عوض فلان بن فلان الْحُجَّةِ بْنِ الْحَسَنِ صَلَواتُكَ عَلَيْهِ وَعَلى آبائِه في هذِهِ السَّاعَةِ وَفي كُلِّ ساعَة وَلِيّاً وَحافِظاً وَقائِداً وَناصِراً وَدَليلاً وَعَيْنا حَتّى تُسْكِنَهُ اَرْضَكَ طَوْعاً وَتُمَتِّعَهُ فيها طَويلاً (وتقول أيضاً) يا مُدَبِّرَ الاُمُورِ، يا باعِثَ مَنْ فِى الْقُبُورِ، يا مُجْرِيَ الْبُحُورِ، يا مُلَيِّنَ الْحَديدِ لِداوُدَ صَلِّ عَلى مُحَمَّد وَآل مُحَمد وافْعَلْ بي كَذ وَكَذا (وتسْأل حأجتك) اللَّيْلَةَ اللَّيْلَةَ.\n\n'
                      'وارفع يديك الى السّماء أي عند قولك يا مُدَبِّرَ الاُمُورِ الى آخر الدّعاء وادع بهذا الدّعاء راكعاً وساجداً وقائماً وقاعداً وكرّره وادع به في اللّيلة الاخيرة ايضاً.\n\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'لهذه اللّيلة عدّة أعمال خاصّة سوى الاعمال العامّة التي تشارك فيها اللّيلتين الماضيتين :',
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
                      'قراءة سورتي العنكبوت والرّوم، وقال الصّادق (عليه السلام) : انّ من قرأ هاتين السّورتين في هذه اللّيلة كان من أهل الجنّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle: 'قراءة سورة حم دُخّان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle: 'قراءة سورة القدر ألف مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يكرّر في هذه اللّيلة بل في جميع الاوقات هذا الدّعاء اَللّـهُمَّ كُنْ لِوَلِيِّكَ الخ ، وقد ذكرناه في خلال أدعية العشر الاواخر بعد دعاء اللّيلة الثّالثة والعشري.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle: 'يقول :\n'
                      'اَللّـهُمَّ امْدُدْ لي في عُمْري، وَاَوْسِعْ لي في رِزْقي، وَاَصِحَّ لي جِسْمي، وَبَلِّغْني اَمَلي، وَاِنْ كُنْتُ مِنَ الاَْشْقِياءِ فَاْمُحني مِنَ الاَْشْقِياءِ، وَاْكتُبْني مِنَ السُّعَداءِ، فَاِنَّكَ قُلْتَ في كِتابِكَ الْمُنْزَلِ عَلى نَبِيِّكَ الْمُرْسَلِ صَلَوتُكَ عَلَيْهِ وَآلِهِ:(يَمْحُو اللهُ ما يَشاءُ وَيُثْبِتُ وَعِنْدَهُ اُمُّ الْكِتابِ).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle: 'يقول :\n'
                      'اَللّـهُمَّ اجْعَلْ فيـما تَقْضي وَفيـما تُقَدِّرُ مِنَ الاَْمْرِ الَْمحْتُومِ، وَفيـما تَفْرُقُ مِنَ الاَْمْرِ الْحَكيمِ في لَيْلَةِ الْقَدْرِ، مِنَ الْقَضاءِ الَّذي لا يُردُّ وَلا يُبَدَّلُ اَنْ تَكْتُبَني مِنْ حُجّاجِ بَيْتِكَ الْحَرامِ في عامي هذا الْمَبْرُورِ حَجُّهُمْ الْمَشْكُورِ سَعْيُهُمُ، الْمَغْفُورِ ذُنُوبُهُمُ، الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ، وَاجْعَلْ فيـما تَقْضي وَتُقَدِّرُ اَنْ تُطيلَ عُمْري وَتُوَسِّعَ لي في رِزْقي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابع :',
                  subtitle: 'يدعو بهذا الدّعاء المروي في الاقبال :\n'
                      'يا باطِناً في ظُهُورِهِ، وَيا ظاهِراً في بُطُونِهِ وَيا باطِناً لَيْسَ يَخْفى، وَيا ظاهِراً لَيْسَ يُرى، يا مَوْصُوفاً لا يَبْلُغُ بِكَيْنُونَيِةِ مَوْصُوفٌ وَلا حَدٌّ مَحْدُودٌ، وَيا غائِباً غَيْرَ مَفْقُود، وَيا شاهِداً غَيْرَ مَشْهُود، يُطْلَبُ فَيُصابُ، وَلَمْ يَخْلُ مِنْهُ السَّماواتُ وَالاَْرْضِ وَمابَيْنَهُما طَرْفَةَ عَيْن، لا يُدْرِكُ بِكَيْف وَلا يُؤَيَّنُ بِاَيْن وَلا بِحَيْث، اَنْتَ نُورُ النُّورِ وَرَبَّ الاَْرْبابِ، اَحَطْتَ بِجَميعِ الاُمُورِ، سُبْحانَ مَنْ لَيْسَ كَمِثْلِهِ شَيْءٌ وَهُوَ السَّميعُ الْبَصيرُ سُبْحانَ مَنْ هُوَ هكَذا وَلا هكَذا غَيْرُهُ . ثمّ تدعو بما تشاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن :',
                  subtitle:
                      'أن يأتي غسلاً آخر في آخر اللّيل سوى ما يغتسله في أوّله واعلم انّ للغسل في هذه اللّيلة واحياؤها وزيارة الحسين (عليه السلام) فيها والصّلاة مائة ركعة فضل كثير وقد أكّدتها الاحاديث.\n\n'
                      'روى الشّيخ في التهذيب عن أبي بصير قال : قال لي الصّادق (عليه السلام) : صلّ في اللّيلة التي يرجى أن تكون ليلة القدر مائة ركعة تقرأ في كلّ ركعة قُل هُوَ اللهُ اَحَدٌ عشر مرّات قال : قلت : جعلت فداك فإن لم أقو عليها قائماً قال : صلّها جالساً ، قلت : فإن لم أقو ، قال : ادّها وأنت مستلق في فراشك.\n\n'
                      'وعن كتاب دعائم الاسلام انّ رسول الله (صلى الله عليه وآله وسلم) كان يطوي فراشه ويشدّ مئزره للعبادة في العشر الاواخر من شهر رمضان، وكان يوقظ أهله ليلة ثلاث وعشرين، وكان يرشّ وجوه النّيام بالماء في تلك اللّيلة وكانت فاطمة صلوات الله عليها لا تدع أهلها ينامون في تلك اللّيلة وتعالجهم بقلّة الطّعام وتتأهّب لها من النّهار، أي كانت تأمرهم بالنّوم نهاراً لئلاّ يغلب عليهم النّعاس ليلاً، وتقول: محروم من حرم خيرها.\n\n'
                      'وروي انّ الصّادق (عليه السلام) كان مدنفاً فأمر فأخرج الى المسجد فكان فيه حتّى أصبح ليلة ثلاث وعشرين من شهر رمضان.\n\n'
                      'قال العلامة المجلسي (رحمه الله): عليك في هذه اللّيلة أن تقرأ من القرآن ما تيسّر لك، وأن تدعو بدعوات الصّحيفة الكاملة لا سيّما دعاء مكارم الاخلاق ودعاء التّوبة، وينبغي أن يراعى حرمة أيّام ليالي القدر والاشتغال فيها بالعبادة وتلاوة القرآن المجيد والدّعاء، فقد روي باسناد معتبرة انّ يوم القدر مثل ليلته.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Dou3aaAllaylaAlrabi3aWal3ishrounRamadan.screenRoute,
        pushBack: DouaaAllaylaAlsaniaWal3ishrounRamadan.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الليلة الثالثة والعشرون من رمضان.mp3',
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
