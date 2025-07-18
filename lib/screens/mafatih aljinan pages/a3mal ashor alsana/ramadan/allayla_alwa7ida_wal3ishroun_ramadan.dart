import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'a3mal_allaila_altasi3a_3ashara_ramadan.dart';
import 'alyawm_alwa7id_wal3ishroun_ramadan.dart';

class AllaylaAlwa7idaWal3ishrounRamadan extends StatefulWidget {
  static String screenRoute = 'allayla_alwa7ida_wal3ishroun_ramadan_screen';
  const AllaylaAlwa7idaWal3ishrounRamadan({super.key});

  @override
  State<AllaylaAlwa7idaWal3ishrounRamadan> createState() =>
      _AllaylaAlwa7idaWal3ishrounRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAlwa7idaWal3ishrounRamadanState
    extends State<AllaylaAlwa7idaWal3ishrounRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_alwa7ida_wal3ishroun_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_allayla_alwa7ida_wal3ishroun_ramadan_screen', value);
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
                      .addFavorite('الليلة الواحدة والعشرون',
                          AllaylaAlwa7idaWal3ishrounRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة الواحدة والعشرون',
                          AllaylaAlwa7idaWal3ishrounRamadan.screenRoute,
                          AllaylaAlwa7idaWal3ishrounRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة الواحدة والعشرون',
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
                      'وفضلها أعظم من اللّيلة التّاسعة عشرة وينبغي أن يؤدّى فيها الاعمال العامّة لليالي القدر من الغسل والاحياء والزّيارة والصّلاة ذات التّوحيد سبع مرّات ووضع المصحف على الرّأس ودعاء الجوشن الكبير وغير ذلك وقد أكّدت الاحاديث استحباب الغُسل والاحياء والجدّ في العبادة في هذه اللّيلة واللّيلة الثّالثة والعشرين وانّ ليلة القدر هي احدهما ، وقد سُئل المعصوم (عليه السلام) في عدّة أحاديث عن ليلة القدر أي اللّيلتين هي ؟ فلم يعيّن ، بل قال : « ما أيسَر ليلتين فيما تطلبُ » أو قال : « ما عَليْكَ اَنْ تَفعَلَ خيراً في لَيلَتَيْنِ » ونحو ذلك، وقال شيخنا الصّدوق فيما أملى على المشايخ في مجلس واحد من مذهب الاماميّة: ومن أحيى هاتين اللّيلتين بمذاكرة العلم فهو أفضل، وليبدأ من هذه اللّيلة في دعوات العشر الاواخر من الشّهر، منها هذا الدّعاء وقد رواه الكليني في الكافي عن الصّادق (عليه السلام) قال : تقول في العشر الاواخر من شهر رمضان كلّ ليلة :\n\n'
                      'اَعُوذُ بِجَلالِ وَجْهِكَ الْكَريمِ أنْ يَنْقِضيَ عَنّي شَهْرُ رَمَضانَ اَوْ يَطْلُعَ الْفَجْرُ مِنْ لَيْلَتي هذِهِ وَلَكَ قِبَلي ذَنْبٌ اَوْ تَبِعَةٌ تُعَذِّبُني عَلَيْهِ.\n\n'
                      'وروى الكفعمي في هامش كتاب البلد الامين انّ الصّادق (عليه السلام) كان يقول في كلّ ليلة من العشر الاواخر بعد الفرائض والنّوافل :\n\n'
                      'اَللّـهُمَّ اَدِّ عَنّا حَقَّ ما مَضى مِنْ شَهْرِ رَمَضانَ، وَاغْفِرْ لَنا تَقْصيرَنا فيهِ، وَتَسَلَّمْهُ مِنّا مَقْبُولاً وَلا تُؤاخِذْنا بِاِسْرافِنا عَلى اَنْفُسِنا، وَاجْعَلْنا مِنَ الْمَرْحُومينَ وَلا تَجْعَلْنا مِنَ الَْمحْرُومينَ.\n\n'
                      'وقال : من قاله غفر الله له ما صدر عنه فيما سلف من هذا الشّهر وعصمه من المعاصي فيما بقى منه.\n\n'
                      'ومنها ما رواه السّيد ابن طاووس في الاقبال عن ابن أبي عمير، عن مرازم قال : كان الصّادق (عليه السلام) يقول في كلّ ليلة من العشر الاواخر:\n\n'
                      'اَللّـهُمَّ اِنَّكَ قُلْتَ في كِتابِكَ الْمُنْزَلِ:(شَهْرُ رَمَضانَ الَّذي اُنْزِلَ فيهِ الْقُرْآنُ هُدىً لِلنّاسِ وَبَيِّنات مِنَ الْهُدى وَالْفُرْقانِ) فَعظَّمْتَ حُرْمَةَ شَهْرِ رَمَضانَ بما اَنْزَلْتَ فيهِ مِنَ الْقُرآنِ، وَخَصَصْتَهُ بِلَيْلَةِ الْقَدْرِ وَجَعَلْتَها خَيْراً مِنْ اَلْفِ شَهْر، اَللّـهُمَّ وَهذِهِ اَيّامُ شَهْرِ رَمَضانَ قَدِ انْقَضَتْ، وَلَياليهِ قَدْ تَصَرَّمَتْ، وَقَدْ صِرْتُ يا اِلـهي مِنْهُ اِلى ما اَنْتَ اَعْلَمُ بِهِ مِنّي وَاَحْصى لِعَدَدِهِ مِنَ الْخَلْقِ اَجْمَعينَ، فَاَسْأَلُكَ بِما سَأَلكَ بِهِ مَلائِكَتُكَ الْمُقَرَّبُونَ وَاَنْبِياؤُكَ الْمُرْسَلُونَ، وَعِبادُكَ الصّالِحُونَ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَأنَ تَفُكَّ رَقَبَتي مِنَ النّارِ، وَتُدْخِلَنِى الْجَنَّةَ بِرَحْمَتِكَ، وَاَنْ تَتَفَضَّلَ عَليَّ بِعَفْوِكَ وَكَرَمُكَ و تَتَقبَّل تَقَربي وَ تَسْتَجيْبَ دُعائي وتَمُنَّ عَليّ بالامن يوم الخوف مِنْ كُلِّ هَوْل اَعْدَدْتَهُ لِيَومِ الْقِيامَةِ، اِلـهي وَاَعُوذُ بِوَجْهِكَ الْكَريمِ، وَبِجَلالِكَ الْعَظيمِ اَنْ يَنْقَضِيَ اَيّامُ شهْرِ رَمَضانَ وَلَياليهِ وَلكَ قِبَلي تَبِعَةٌ اَوْ ذَنْبٌ تُؤاخِذُني بِهِ اَوْ خَطيئَةٌ تُريدُ اَنْ تَقْتَصَّهَا مِنّي لَمْ تَغْفِرْها لي سَيِّدي  سَيِّدي سَيِّدي أسألُك يا لا اِلـهَ إلاّ اَنْتَ اِذْ لا اِلـهَ إلاّ اَنْتَ اِنْ كُنْتَ رَضَيْتَ عَني في هذَا الشَّهْرِ فَاْزدَدْ عَنّي رِضاً، وَاِنْ لَمْ تَكُن رَضَيْتَ عنِّي فَمِنَ الانَ فَارْضَ عَنّي يا اَرْحَمَ الرّاحِمينَ، يا اَللهُ يا اَحَدُ يا صَمَدُ يا مَنْ لَمْ يَلِدْ وَلمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفُواً اَحَدٌ (وأكثر من قول ) يا مُلَيِّنَ الْحَديدِ لِداوُدَ عَلَيْهِ السَّلامُ يا كاشِفَ الضَرّ والكُرَبِ العِظام عَن ايّوب (عليه السلام) اَي مُفَرِّجَ هَمِّ يَعْقُوبَ عَلَيْهِ السَّلامُ، اَيْ مُنَفِّسَ غَمِّ يُوسُفَ عَلَيْهِ السَّلامُ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد كَما اَنْتَ أَهْلهُ اَنْ تُصَلِّيَ عَلَيْهِمْ اَجْمَعينَ وَافْعَلْ بي ما اَنْتَ اَهْلُهُ وَلا تَفْعَلْ بي ما اَنَا اَهْلُهُ.\n\n'
                      'ومنها ما رواه في الكافي مسنداً وفي المقنعة والمصباح مرسلاً، تقول أوّل ليلة منه أي في اللّيلة الحادية والعشرين :\n\n'
                      'يا مُولِجَ اللَّيْلِ فِي النَّهارِ، وَمُولِجَ النَّهارِ فِي اللَّيْلِ، وَمُخْرِجَ الْحَيِّ مِنَ الْمَيِّتِ، وَمُخْرِجَ الْمَيِّتِ مِنْ الْحَيِّ، يا رازِقَ مَنْ يَشاءُ بِغَيْرِ حِساب، يا اَللهُ يا رَحْمـنُ، يا اَللهُ يا رَحيمُ، يا اَللهُ يا اَللهُ يا اَللهُ لَكَ الاَسْماءُ الْحُسْنى، وَالاَمْثالُ الْعُلْيا، وَالْكِبْرِياءُ وَالالاءُ، اَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَجْعَلَ اسْمي في هذِهِ اللَّيْلَةِ فِي السُّعَداءِ، وَرُوحي مَعَ الشُّهَداءِ، وَاِحْساني في عِلِّيّينَ، وَاِساءَتي مَغْفُورَةً، وَاَنْ تَهَبَ لي يَقينَاً تُباشِرُ بِهِ قَلْبي، وَاِيماناً يُذْهِبُ الشَّكَّ عَنّي، وَتُرْضِيَني بِما قَسَمْتَ لي، وَآتِنا فِي الدُّنْيا حَسَنَةً وَفِي الاخِرَةِ حَسَنَةً، وَقِنا عَذابَ النّارِ الْحَريقِ، وَارْزُقْني فيها ذِكْرَكَ وَشُكْرَكَ، وَالرَّغْبَةَ اِلَيْكَ وَالاِنابَهَ وَالتَّوْفيقَ لِما وَفَّقْتَ لَهُ مُحَمَّداً وآلَ مُحَمَّداً عَلَيْهِ وَعَلَيْهِمُ السَّلامُ.\n\n'
                      'تتمّة أعمال اللّيلة الحادِيةَ وَالْعِشْرينَ.\n\n'
                      'روى الكفعمي عن السّيّد ابن باقي : تقول في اللّيلةِ الحادية والعشرين :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد، وَآلِ مُحَمَّد وَاقْسِمْ لي حِلْماً يَسُدُّ عَنّي بابَ الْجَهْلِ، وَهُدىً تَمُنُّ بِهِ عَلَيَّ مِنْ كُلِّ ضَلالَة، وَغِنىً تَسُدُّ بِهِ عَنّي بابَ كُلِّ فَقْر، وَقُوَّةً تَرُدُّ بِها عَنّي كُلَّ ضَعْف، وَعِزّاً تُكْرِمُني بِهِ عَنْ كُلِّ ذُلٍّ، وَرِفْعَةً تَرْفَعُني بِها عَنْ كُلِّ ضَعَة، وَاَمْناً تَرُدُّ بِهِ عَنّي كُلَّ خَوْف، وَعافِيَةً تَسْتُرُني بِها عَنْ كُلِّ بَلاء، وَعِلْماً تَفْتَحُ لي بِهِ كُلَّ يَقين، وَيَقيناً تُذْهِبُ بِهِ عَنّي كُلَّ شَكٍّ، وَدُعاءً تَبْسُطُ لي بِهِ الاِجابَةَ في هذِهِ اللَّيْلَةِ، وَفي هذِهِ السّاعَةِ، السّاعَةَ السّاعَةَ السّاعَةَ يا كَريمُ، وَخَوْفاً تَنْشُرُ لي بِهِ كُلَّ رَحْمَة، وَعِصْمَةً تَحُولُ بِها بَيْني وَبَيْنَ الذُّنُوبِ، حَتّى اُفْلِحَ بِها عِنْدَ الْمَعْصُومُينَ عِنْدَكَ، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'وروي عن حماد بن عثمان قال : دخلت على الصّادق (عليه السلام) ليلة احدى وعشرين من شهر رمضان فقال لي : يا حماد اغتسلت ، فقلت : نعم جعلت فداك، فدعا بحصير ثمّ قال : اليّ لزقي فصلّ فلم يزل يصلّي وأنا اُصلّي الى لزقه حتّى فرغنا من جميع صلواتنا، ثمّ أخذ يدعو وأنا اُءَمِّن على دعائه الى أن اعترض الفجر، فأذّن وأقام ودعا بعض غلمانه فقمنا خلفه، فتقدّم فصلّى بنا الغداة، فقرأ بفاتحة الكتابِ وَاِنّا اَنْزَلناهُ في لَيلَةِ الْقَدْرِ في الاُولى، وفي الرّكعة الثّانية بفاتحة الكتاب وقُل هُوَ اللهُ اَحَدٌ، فلمّا فرغنا من التّسبيح والتّحميد والتّقديس والثّناء على الله تعالى والصّلاة على رسول الله (صلى الله عليه وآله وسلم) والدّعاء لجميع المؤمنين والمؤمنات والمسلمين والمسلمات خرّ ساجداً لا أسمع منه الّا النّفس ساعة طويلة، ثمّ سمعته يقوللا اِلـهَ إلاّ اَنْتَ مُقَلِّبَ الْقُلُوبِ وَالاَبْصارِ، الى آخر الدّعاء المروي في الاقبال.\n\n'
                      'وروى الكليني انّه كان الباقر (عليه السلام)اذا كانت ليلة احدى وعشرين وثلاث وعشرين أخذ في الدّعاء حتّى يزول اللّيل (ينتصف) فاذا زال اللّيل صلّى . وروى انّ النّبي (صلى الله عليه وآله وسلم) كان يغتسل في كلّ ليلة من هذا العشر، ويستحبّ الاعتكاف في هذا العشر وله فضل كثير وهو أفضل الاوقات للاعتكاف، وروي انّه يعدل حجّتين وعمرتين، وكان رسول الله (صلى الله عليه وآله وسلم) اذا كان العشر الاواخر اعتكف في المسجد وضُرِبت له قُبّة من شعر وشمّر المئزَر وطَوى فِراشه واعلم انّ هذه ليلة تتجدّد فيها أحزان آل محمّد وأشياعهم ففيها في سنة أربعين من الهجرة كانت شهادة مولانا أمير المؤمنين صلوات الله عليه.\n\n'
                      'وروى انّه ما رفع حجر عن حجر في تلك اللّيلة الّا وكان تحته دماً عبيطاً كما كان ليلة شهادة الحسين (عليه السلام) ، وقال المفيد (رحمه الله): ينبغي الاكثار في هذه اللّيلة من الصّلاة على محمّد وآل محمّد والجدّ في اللّعن على ظالمي آل محمّد (عليهم السلام)واللّعن على قاتل امير المؤمنين (عليه السلام).\n\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlwa7idWal3ishrounRamadan.screenRoute,
        pushBack: A3malAllailaAltasi3a3asharaRamadan.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الليلة الواحدة والعشرون من رمضان.mp3',
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
