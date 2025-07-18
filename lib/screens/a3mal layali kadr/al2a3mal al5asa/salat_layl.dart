import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'dou3a2_ba3d_salat_alwater.dart';
import 'dou3a2_ya_batinan.dart';

class SalatLayl extends StatefulWidget {
  static String screenRoute = 'salat_layl_screen';
  const SalatLayl({super.key});

  @override
  State<SalatLayl> createState() => _SalatLaylState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatLaylState extends State<SalatLayl> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_layl_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_layl_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl5asa.screenRoute);
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
                      .addFavorite('صلاة الليل', SalatLayl.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('صلاة الليل', SalatLayl.screenRoute,
                          SalatLayl.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الليل',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'فضل صلاة الليل: إِنَّ الرّوايات المأثورة عن المعصومين عليهم السلام في فضل قيام الليل كثيرة. وروي أنّها شرف المؤمن، وأنّها تورث صحّة البدن، وهي كفّارة لذنوب النّهار، ومزيل لوحشة القبر، تبيّض الوجه، وتطيّب النكهة، وتجلب الرّزق، وأَنَّ الْمالَ وَالْبَنين زِينَةُ الْحَياةُ الدُّنْيا، وثماني ركعات من آخر الليل والوتر زينة الآخرة، وقد يجمعهما اللّه لأقوام، وأنّه كذب من زعم أنّه يصلّي صلاة اللّيل وهو يجوع، إنَّ صلاة اللّيل تضمن رزق النّهار.وعن الإمام الصّادق عليه السلام قال: "قال النبي صلى الله عليه وآله وسلم في وصيته لعليّ عليه السلام: يا عَلي، أوصيك في نفسك بعدّة خصال فاحفظها، ثمّ قال: اللّهُمَّ، أعِنه، ثمّ ذَكَر عِدّة خصال إلى أن قال: وعليك بصلاة اللّيل، وعَلَيْكَ بِصَلاة اللّيل، وعَلَيْكَ بِصَلَاةِ اللّيل، وعَلَيْكَ بِصَلَاةِ الزَّوالِ، وعَلَيْكَ بِصَلَاةِ الزَّوالِ، وعَلَيْكَ بِصَلَاةِ الزَّوالِ".وقتها: ويبدأ وقتها عند انتصاف اللّيل. وكلّما اقترب الوقت من طلوع الفجر الصّادق ازدادت فضيلة، فإذا بان الفجر وكان المصلّي قد أتى منها أربع ركعات، فليقتصر على الحمد وحدها، فيما بقي من الرّكعات.كيفيّتها: صلاة الليل ثماني ركعات، يسلّم بعد كلّ ركعتين، ويحسن أن يقرأ "التوحيد" ستّين مرّة في الثنائية الأولى، يقرأها بعد "الحمد" في كل ركعة منهما ثلاثين مرّة، لكي ينصرف من الصّلاة، ولم يكُ بينه وبين اللّه عزّ وجلّ ذنب، أو أن يقرأ بعد "الحمد" في الأولى: "التّوحيد"، وفي الثّانية: "قل يا أيُّها الكافرون". ويقرأ في سائر الرّكعات ما شاء من السّور، ويجزي "الحمد" و"التّوحيد" في كل ركعة، ويجوز الاقتصار على "الحمد" وحدها.القنوت: ويجزي في القنوت أن تقول:سُبْحانَ اللهِ ثلاث مرّات، أو أن تقول: اللّهُمَّ، اغْفِرْ لَنَا وَارْحَمْنا وَعَافِنا وَاعْفُ عَنَّا فِي الدُّنْيا وَالآخِرَةِ، إِنَّكَ عَلَى كُلّ شَيْءٍ قَدِيرٌ، أو أن تقول: رَبِّ اغْفِرْ وَارْحَمْ وَتَجَاوَزْ عَمَّا تَعْلَم، إِنَّكَ أَنْتَ الْأَعَزُّ الْأَجَلُّ الْأَكْرَمْ. ركعتا الشفع وركعة والوتر: فإذا فرغت من الركعات الثّماني صلاة الليل، فصلّ الشفع ركعتين، والوتر ركعة واحدة، واقرأ في هذه الثّلاث ركعات بعد "الحمد": "قل هو الله أحد"، حتّى يكون لك أجر ختمة كاملة من القرآن، فإنَّ لسورة التوحيد أجر ثلث القرآن، أو اقرأ في الأولى من الشّفع: "الحمد" و"قل أعوذ برب الناس"، وفي الثّانية: "الحمد" و"قل أعوذ برب الفلق".الدُّعاء: ويستحب أن تدعو إذا فرغت من الشّفع بدعاء:إِلهِي، تَعَرَّضَ لَكَ فِي هذَا اللَّيْلِ الْمُتَعَرِّضُونَ، وَقَصَدَكَ الْقاصِدُونَ، وَأَمَّلَ فَضْلَكَ وَمَعْرُوفَكَ الطَّالِبُونَ. وَلَكَ فِي هذَا اللَّيْلِ نَفَحاتٌ وَجَوائِزُ، وَعَطايا وَمَواهِبُ، تَمُنُّ بِها عَلَى مَنْ تَشَاءُ مِنْ عِبادِكَ، وَتَمْنَعُها مَنْ لَمْ تَسْبِقْ لَهُ الْعِنايَةُ مِنْكَ، وَها أَنَا ذَا عُبَيْدُكَ الْفَقِيرُ إِلَيْكَ، الْمُؤَمِّلُ فَضْلَكَ وَمَعْرُوفَكَ، فَإِنْ كُنْتَ، يا مَوْلايَ، تَفَضَّلْتَ فِي هـذِهِ اللَّيْلَةِ عَلَى أَحَدٍ مِنْ خَلْقِكَ، وَعُدْتَ عَلَيْهِ بِعائِدَةٍ مِنْ عَطْفِكَ، فَصَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، الطَّيِّبينَ الطَّاهِرِينَ، الْخَيِّرِينَ الْفاضِلِينَ، وَجُدْ عَلَيَّ بِطَوْلِكَ وَمَعْرُوفِكَ، يا رَبَّ الْعالَمِينَ، وَصَلَّى اللهُ عَلَى مُحَمَّدٍ خاتَمِ النَّبِيِّينَ وَآلِهِ الطَّاهِرِينَ وَسَلَّمَ تَسْلِيماً، إِنَّ اللهَ حَمِيدٌ مَجِيدٌ. اللّهُمَّ، إِنّي أَدْعُوكَ كَما أَمَرْتَ، فَاسْتَجِبْ لِي كَما وَعَدْتَ، إِنَّكَ لا تُخْلِفُ الْمِيعادَ.فإذا فرغت من ركعتي الشّفع، فانهض لركعة الوتر، واقرأ فيها: "الحمد" و"التّوحيد"، أو اقرأ بعد "الحمد" سورة "التّوحيد" ثلاث مرّات، والمعوذتين، أعني: "قل أعوذ برب الفلق"، و"قل أعوذ برب الناس". ويستحب أن تبكي في القنوت من خشية اللّه، وتدعو لك ولإخوانك المؤمنين، ويستحب أن تذكر أربعين نفساً منهم.روى الصّدوق في الفقيه أنّ النّبي صلى الله عليه وآله وسلم كان يقول في الوتر في قنوته:اللّهُمَّ، اهْدِنِي فِيمَنْ هَدَيْتَ، وَعافِنِي فِيمَنْ عافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبارِكْ لِي فَيما أَعْطَيْتَ، وَقِني شَرَّ ما قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلا يُقْضَى عَلَيْكَ، سُبْحانَكَ رَبَّ الْبَيْتِ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَأُؤْمِنُ بِكَ وَأَتَوَكَّلُ عَلَيْكَ، وَلا حَوْلَ وَلا قُوَّةَ إِلّا بِكَ يا رَحِيمُ.وينبغي أن يقول سبعين مرّة: أَسْتَغْفِرُ اللهَ رَبِّي وَأَتُوبُ إِلَيْهِ. وينبغي في ذلك أن يرفع يده اليسرى للاستغفار، ويحصي عدده باليمنى. وروي أنّ النّبيّ صلى الله عليه وآله وسلم كان يستغفر في الوتر سبعين مرّة، ويقول سبع مرّات: هَذا مَقامُ الْعائِذِ بِكَ مِنَ النَّارِ.\n'
                      'وروي أيضاً أنّ الإمام زين العابدين عليه السلام كان يقول في السّحر في صلاة الوتر، ثلاث مئة مرّة: الْعَفْوَ الْعَفْوَ. وليقل بعد ذلك: رَبِّ اغْفِرْ لِي، وَارْحَمْنِي، وَتُبْ عَلَيَّ، إِنَّكَ أَنْتَ التَّوَّابُ الْغَفُورُ الرَّحِيمُ. وينبغي أن يطيل القنوت، فإذا فرغ منه ركع، فإذا رفع رأسه دعا بهذا الدُّعاء الذي رواه الشّيخ في التهذيب، عن مُوسى بن جعفر عليهما السلام:هَذا مَقَامُ مَنْ حَسَناتُهُ نِعْمَةٌ مِنْكَ، وَشُكْرُهُ ضَعِيفٌ، وَذَنْبُهُ عَظِيمٌ، وَلَيْسَ لِذلِكَ إِلّا رِفْقُكَ وَرَحْمَتُكَ، فَإِنَّكَ قُلْتَ فِي كِتابِكَ الْمُنْزَلِ عَلَى نَبِيّكَ الْمُرْسَلِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ (كانُوا قَلِيلاً مِنَ اللَّيْلِ ما يَهْجَعُونَ وَبِالْأَسْحارِ هُمْ يَسْتَغْفِرُونَ)، طالَ هُجُوعي، وَقَلَّ قِيامِي، وَهذَا السَّحَرُ، وَأَنَا أَسْتَغْفُرِكَ لِذُنُوبِي اسْتِغْفارَ مَنْ لا يَجِدُ لِنَفْسِهِ ضَرَّاً وَلا نَفْعاً، وَلا مَوْتاً وَلا حَياةً وَلا نُشُوراً.ثمَّ تسجد وتتم الصّلاة، وتسبّح بعد السّلام تسبيح الزّهراء عليها السلام.ثمَّ تسجد وتقول خمس مرات: سُبُّوحٌ قُدُّوسٌ رَبُّ الْمَلائِكَةِ وَالرُّوحِ، ثمَّ تجلس وتقرأ آية الكرسي، ثمّ تهوي ثانياً إلى السّجود، وتكرّر الذّكر نفسه خمس مرّات.دعاء بعد صلاة الوتر:إِلهِي، كَيْفَ أَصْدُرُ عَنْ بابِكَ بِخَيْبَةٍ مِنْكَ، وَقَدْ قَصَدْتُهُ عَلَى ثِقَةٍ بِكَ. إِلهِي، كَيْفَ تُؤْيسُنِي مِنْ عَطائِكَ، وَقَدْ أَمَرْتَنِي بِدُعائِكَ، صَلِّ عَلَى مُحَمَّدٍ وآلِ مُحَمَّدٍ، وَارْحَمْنِي إِذا اشْتَدَّ الْأَنِينُ، وَحُظِرَ عَلَيَّ الْعَمَلُ، وَانْقَطَعَ مِنِّي الْأَمَلُ، وَأَفْضَيْتُ إِلَى الْمَنُونِ، وَبَكَتْ عَلَيَّ الْعُيُونُ، وَوَدَّعَنِي الْأَهْلُ وَالْأَحْبابُ، وَحُثِيَ عَليَّ التُّرابُ، وَنُسِيَ اسْمِي، وَبَلِيَ جِسْمِي، وَانْطَمَسَ ذِكْرِي وَهُجِرَ قَبْرِي، فَلَمْ يَزُرْنِي زَائِرٌ، وَلَمْ يَذْكُرْنِي ذاكِرٌ، وَظَهَرَتْ مِنِّي الْمَآثِمُ، وَاسْتَوْلَتْ عَلَيَّ الْمَظالِمُ، وَطالَتْ شِكايَةُ الْخُصُومِ، وَاتَّصَلَتْ دَعْوَةُ الْمَظْلُومِ، صَلِّ اللّهُمَّ، عَلَى مُحَمَّدٍ وآَلِ مُحَمَّدٍ، وَأَرْضِ خُصُومِي عَنِّي، بِفَضْلِكَ وَإِحْسانِكَ، وَجُدْ عَلَيَّ بِعَفْوِكَ وَرِضْوانِكَ. إِلهِي، ذَهَبَتْ أَيَّامُ لَذَّاتِي، وَبَقِيَتْ مَآثِمِي وَتَبِعاتِي، وَقَدْ أَتَيْتُكَ مُنِيباً تَائِباً، فَلا تَرُدَّنِي مَحْرُوماً وَلا خَائِباً. اللّهُمَّ، آمِنْ رَوْعَتِي، وَاغْفِرْ زَلَّتِي، وَتُبْ عَلَيَّ، إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Ba3dSalatAlwater.screenRoute,
          pushBack: Dou3a2YaBatinan.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة الليل.mp3',
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
