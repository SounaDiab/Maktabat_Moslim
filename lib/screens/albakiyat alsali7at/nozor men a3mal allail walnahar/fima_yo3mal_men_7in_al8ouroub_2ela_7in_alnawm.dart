import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../nozor_men_a3mal_allail_walnahar.dart';
import 'fi_l2intibah_men_alnawm_wsalat_allayl.dart';
import 'fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha.dart';

class FimaYo3malMen7inAl8ouroub2ela7inAlnawm extends StatefulWidget {
  static String screenRoute =
      'fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm_screen';
  const FimaYo3malMen7inAl8ouroub2ela7inAlnawm({super.key});

  @override
  State<FimaYo3malMen7inAl8ouroub2ela7inAlnawm> createState() =>
      _FimaYo3malMen7inAl8ouroub2ela7inAlnawmState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FimaYo3malMen7inAl8ouroub2ela7inAlnawmState
    extends State<FimaYo3malMen7inAl8ouroub2ela7inAlnawm> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm_screen',
        value);
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
          .pushReplacementNamed(NozorMenA3malAllailWalnahar.screenRoute);
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
                      .addFavorite('فيما يعمل من حين الغروب إلى حين النوم',
                          FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'فيما يعمل من حين الغروب إلى حين النوم',
                          FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute,
                          FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'فيما يعمل من حين الغروب إلى حين النوم',
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
                      'إعلم أن ما ينبغي لك عند الغروب هو أن تبادر إلى المسجد وأن تقول عند اصفرار الشمس: أمْسى ظُلْمي مُسْتَجيراً بِعَفْوِكَ وَامْسَتْ ذُنُوبِي مُسْتَجيرةً بِمَغْفِرَتِكَ وَأمْسى خَوفي مُسْتَجيراً بِأمانِكَ وَأمْسى ذُلّي مُسْتَجيراً بِعِزِّكَ وَأمْسى فَقْري مُسْتَجيراً بِغِناكَ وَأمْسى وَجْهي البالي مُسْتَجيراً بِوجْهِكَ الدّائِمِ الباقي، اللَّهُمَّ ألبِسْني عافِيَتَكَ وَغَشِّني بِرَحْمَتِكَ وَجَلّلْنِي كَرامَتَكَ وَقِني شَرَّ خَلْقِكَ مِنَ الجِنِّ وَالانْسِ ياالله يارَحْمنُ يارَحيمُ.\n\n'
                      'وينبغي الاشتغال حينئذ بالتسبيح والاستغفار، فهذه الساعة تضاهي الغداة شرفا وفضلاً وقال تعالى: وسَبِّحْ بِحَمْدِ رَبِّكَ قَبْلَ طُلُوع الشَّمس وقَبْلَ الغُروبِ، وعن الصادق (صلوات الله وسلامه عليه) قال: إذا تغيّرت الشمس (أي أشرفت على الغروب) فاذكر الله عزَّ وجلَّ. فإذا كنت مع من يشغلك فقم وادع (أي ابتعد عنهم) واشتغل بالدعاء وتقول عند الغروب: يامَنْ خَتَمَ النُبوّةَ بِمُحَمَّدٍ صَلّى الله عَلَيهِ وَآلِهِ إخْتِمْ لي في يومي هذا بِخَيرٍ وَشَهْري بِخَيرٍ وَسَنَتي بِخَيرٍ وعُمْري بِخَيرٍ، وتهلل وتستعيذ بالله بالتهليل والاستعاذة المأثورة التي ستذكر في دعوات الصباح والمساء، ثم تضع يدك على رأسك وتمرّها على وجهك، وتأخذ لحيتك بيدك وتقول: أحَطْتُ عَلى نَفْسي وَأهْلي وَمالي وَوَلَدي مِنْ غائِبٍ وَشاهِدٍ بِالله الَّذِي لا إلهَ إِلاّ هُوَ عالِمُ الغَيْبِ وَالشَّهادَةِ الرَّحْمنُ الرَّحيمُ الحيّ القَيومُ لاتَأخِذَهُ سِنَةٌ وَلانَومٌ. وتقرأ الآية إلى العَليُّ العَظيمُ.\n\n'
                      'ثم تبادر إلى صلاة المغرب ولاينبغي تأخيرها عن أوّل وقتها وقد بالغت الاحاديث المأثورة في المنع عن تأخيرها عن أوّل وقتها ، وإذا أردت أن تصلي فأذّن وأقم متأدبا بمامرّ من اَّدابها، وقل بين الاذان والاقامة: اللَّهُمَّ إِنِّي أَسْأَلُكَ بإقْبالِ لَيْلِكَ وَإدْبارِ نَهارِكَ وَحُضورِ صَلَواتِكَ وَأصْواتِ دُعاتِكَ وتَسْبيحِ مَلائِكَتِكَ أنْ تُصَلّي عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ وَأنْ تَتوبَ عَليّ إنَّكَ أنْتَ التَوابُ الرَّحيمُ. ثم تصلي المغرب بجميع اَّدابه وشرائطه وتكبّر بعد الفراغ من الصلاة بالثلاث تكبيرات وتسبّح تسبيح الزهراء (عليها السلام).\n\n'
                      'ثم تقول: إنَّ الله وَمَلائِكَتَهُ يُصَلّونَ عَلى النَبيّ ياأيُّها الَّذينَ آمَنوا صَلُّوا عَلَيهِ وَسَلِّموا تَسْلِيماً، اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ النَبيّ وَعَلى ذُرّيَتِهِ وَعَلى أهْلِ بِيْتِهِ. وتقول سبع مرات: بِسْمِ الله الرَّحْمنِ الرَّحيمِ وَلا حَوْلَ ولا قُوَّةَ إِلاّ بِالله العَليّ العَظيمِ. ثم تقول ثلاثا: الحَمْدُ لله الَّذِي يَفْعَلُ مايَشاءُ وَلايَفْعَلُ مايَشاءُ غَيرَهُ.\n\n'
                      'ثم تقول: سُبْحانَكَ لا إلهَ إِلاّ أنْتَ اغْفِرْ لي ذُنوبي جَميعاً فإنَّهُ لايَغْفِرُ الذُّنوبَ كُلِّها جَميعاً إِلاّ أنْتَ.\n\n'
                      'وإن شئت أن تزيد في التعقيب فالافضل أن ترجي الزيادة إلى الفراغ من نافلة المغرب، ثم تنهض للنافلة وهي أربع ركعات بسلامين، ويكره التكلم بين صلاة المغرب ونافلتها، وتقرأ في الركعة الأولى من النافلة سورة قل ياأيها الكافرون، وفي الثانية التوحيد، وتقرأ في الركعتين الاخيرتين منها ماشئت، وينبغي أن تقرأ في الركعة الثالثة سورة الحديد من أوّلها إلى: عليم بذات الصدور، وفي الرابعة اَّخر سورة الحشر من: لو انزلنا هذاالقرآن إلى اَّخر السورة، ويجزي في هذه النافلة كما في سائر النوافل الاقتصار على الفاتحة وحدها وينبغي الجهر بالقراءة فيها كسائر نوافل الليل.\n\n'
                      'فإذا فرغت من نافلة المغرب فلك أن تعقّب بما شئت من‌التعقيبات العامّة، ثم تسجد سجدة الشكر على نحو ما مرّ، وأدنى مايجزي في سجدة الشكر أن تقول: شكراً شكراً شكراً. وروى الكليني عن الصادق (عليه السلام) قال: إذا فرغت من صلاة المغرب فامسح جبينك بيدك وقل ثلاثا: بِسْمِ الله الَّذِي لا إلهَ إِلاّ هُوَ عالِمُ الغَيبِ وَالشَّهادَةِ الرَّحْمنُ الرَّحيمُ، اللَّهُمَّ اذْهِبْ عَنِّي الهَمَّ وَالحُزْنَ. وينبغي أن تصلي صلاة الغفيلة وقد وصفناها في كتاب (المفاتيح) وغيره.\n\n'
                      'فإذا غاب الشفق تؤذّن للعشاء وتقيم متأدّبا بما مرّ من اَّدابهما، ثم تأخذ في فريضة العشاء بشرائطها واَّدابها وينبغي أن تطيل قنوتها، والتعقيب بعدها، فوقتها يتسع لذلك. فتعقب بما يدعى به في كل صباح ومساء، ثم تعقب بما يدعى به في كل مساء خاصة. وهي كثيرة، منها: دعاء لطلب الرزق مذكور في (المفاتيح) ويستحب قراءة سورة القدر ست مرات ثم تقول: اللَّهُمَّ رَبَّ السَّماواتِ السَبْعِ وَما أظَلَّتْ وَرَبَّ الارَضينَ السَبْعِ وَما أقَلَّتْ وَرَبَّ الشَّياطينِ وَما أظَلّتْ وَرَبَّ الرِّياحِ وَما ذَرَّتْ، اللَّهُمَّ رَبَّ كُلَّ شَيٍ وَإلهَ كُلِّ شَيٍ وَمَليكَ كُلَّ شَيٍ ؛ أنْتَ الله المُقْتَدِرُ عَلى كُلِّ شَيٍ أنْتَ الله الأول فَلا شَيَ قَبْلَكَ وَأنْتَ الاخِرُ فَلا شَيَ بَعْدَكَ وَأنْتَ الظّاهِرُ فَلا شَيَ فَوْقَكَ وَأنْتَ الباطِنُ فَلا شَيَ دونَكَ، وَرَبَّ جَبْرَئيلَ وَميكائيلَ وَإسرافيلَ وَإلهَ إِبْراهيمَ وَإسْحاقَ وَيَعْقوبَ.\n\n'
                      'أَسْأَلُكَ أنْ تُصَلّي عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ تَتَولاّ ني بِرَحْمَتِكَ وَلاتُسَلِّطَ عَليَّ أحَداً مِنْ خَلْقِك مِمَّنْ لاطاقَةَ لي بِهِ، اللَّهُمَّ إِنِّي أتَحَبَّبُ إلَيكَ فَحَبّبني وَفي النّاسِ فَعَزِّزْني وَمِنْ شَرِّ شَياطينِ الجِنِّ وَالانْسِ فَسَلِّمْني يارَبِّ العالمينَ وَصَلِّ عَلى مُحَمَّدٍ وَآلِهِ.\n\n'
                      'ثم تدعو بما تحب، ثم تسجد سجدة الشكر، ثم تصلي الوتيرة، وهي نافلة تؤتى عن جلوس بعد صلاة العشاء وهي ركعتان ويستحب أن يُتلى فيها مائة آية من القراَّن الكريم ويحسن أن يقرأ بعد الحمد في الركعة الأولى منها سورة الواقعة، وفي الركعة الثانية سورة التوحيد. وتدعو بعد السلام بما شئت من الدعوات.\n\n'
                      'وإذا شئت أن ترقد فينبغي لك أن تتأهب لموافاة المنون، وأن تكون على طهر وأن تتوب من الذنوب، وتفرغ قلبك من هموم الدنيا، وتتذكر أجلك واَّونه النوم في اللحد وحدك من دون أنيس يؤانسك، وأن تضع وصيتك تحت وسادتك، وأن تعزم على القيام لصلاة الليل فإن فخر المؤمن وزينته في الدنيا والاخرة هي الصلاة في آخر الليل وتقرأ عند النوم سورة: قل هو الله أحد، وسورة ألهاكم التكاثر وآية الكرسي.\n\n'
                      'ثم تقول ثلاثا: الحَمْدُ لله الَّذِي عَلا فَقَهَرْ وَالحَمْدُ لله الَّذِي بَطَنَ فَخَبَرَ وَالحَمْدُ لله الَّذِي مَلَكَ فَقَدَرَ وَالحَمْدُ لله الَّذِي يُحْيي المَوتي وَيُميتُ الاحْياءَ وَهُوَ عَلى كُلِّ شَيٍ قَديرٌ.\n\n'
                      'ثم تسبح تسبيح الزهراء سلام الله عليها، وتنام على يمينك على هيئة الميت في اللحد، وأما أن تنام على هيئة المحتضر فقد قال فيه شيخنا ثقة الاسلام النوري في كتابه (دار السلام): إننا لم نعثر عليه في خبر ولا أثر نعم ذكره الغزالي ولاشك إنّ الرشد في خلافه (انتهى).\n\n'
                      'وإذا شئت ان تنتبه من نومك لصلاة الليل أو غيرها وخشيت غلبة النوم عليك فاقرأ الآية الاخيرة من سورة الكهف وهي: قُلْ إنَّما أنا بَشَرٌ مِثْلُكُمْ يوحى إِليَّ أَنَّما إلهَكُمْ إلهٌ وَاحِدٌ فَمَنْ كانَ يَرْجو لِقاءَ رَبِّهِ فَليَعْمَلْ عَمَلاً صالِحا وَلايُشْرِكْ بِعِبادَةِ رَبِّهِ أحَداً.\n\n'
                      'وروي عن الصادق (صلوات الله وسلامه عليه): إنّه مامن أحد يقرأ هذه الآية عند النوم إِلاّ وينتبه في الساعة التي يريد أن ينتبه فيها.\n\n'
                      'وإذا خفت العقرب أو غيره من الهوام فاقرأ هذا الدعاء الذي ضمن الباقر (عليه السلام) لمن دعا به السلامه من العقرب والهوام إلى الصباح: أعوذُ بِكَلِماتِ الله التّامّاتِ الَّتي لايُجاوِزُهُنَّ بَرُّ وَلا فاجِرٌ مِنْ شَرِّ ماذَرَأَ وَمِنْ شَرِّ مابَرَأَ وَمِنْ شَرِّ كُلِّ دابَّةٍ هوَ آخِذٌ بِناصيَتِها إنَّ رَبّي عَلى صِراطٍ مُسْتَقيمٍ. وإذا خشيت أن تحتلم فادع بهذا الدعاء: اللَّهُمَّ إِنِّي أعوذُ بِكَ مِنَ الاحْتِلامِ وَمِنْ سوءِ الاحْلامِ وَمِنْ أنْ يَتَلاعَبَ بِيَ الشَيْطانُ في اليَقْظَةِ وَالمَنامِ. وإذا كنت تخشى انهيار الدار أو المكان الذي تنام فيه فاقرأ هذه الآية: إنَّ الله يُمْسِكُ السَّماواتِ وَالارضَ أنْ تَزولا وَلَئِنْ زالَتا إنْ أمْسَكَهُما مِنْ أحَدٍ مِنْ بَعْدِهِ إنَّهُ كانَ حَلِيماً غَفُوراً.\n\n'
                      'وإذا كنت ترهب اللص فاقرأ آخر آية من سورة بني إسرائيل وأولها: قُلْ ادْعُوا الله أو ادْعوا الرَّحْمنَ، وتكحل عند النوم بسبعة أميال أربعة منها في العين اليمنى وثلاثة في اليسرى وقل عند الاكتحال: اللَّهُمَّ إِنِّي أَسْأَلُكَ بِحَقِّ مُحَمَّدٍ وَآل مُحَمَّدٍ أنْ تُصَلّي عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ تَجْعَلَ النّورَ في بَصَري وَالبَصيرَةَ في ديني وَاليَقينَ في قَلْبي وَالاخْلاصَ في عَمَلي وَالسَّلامَةَ في نَفْسي والسَّعَةَ في رِزْقي وَالشُكْرَ لَكَ أبَداً ما أبْقَيْتَني إنَّكَ عَلى كُلِّ شَيٍ قَديرٌ.وينبغي أن تترك نوم الغداة والنوم بعد العصر. وإذا أردت أن تنام فأطفي السراج ونم مستقبل القبلة، ولاتنم على سطح لم يحوّط ولاتحدث بما رأيته في المنام كل أحد إِلاّ من كان عالما ناصحا رَؤُوفاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiL2intibahMenAlnawmWsalatAllayl.screenRoute,
          pushBack: FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/فيما يعمل من حين الغروب الى حين النوم.mp3',
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
