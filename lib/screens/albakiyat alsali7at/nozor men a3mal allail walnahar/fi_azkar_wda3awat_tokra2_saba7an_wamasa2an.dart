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
import 'fima_yod3a_bihi_fikol_sa3a_men_sa3at_alyawm.dart';

class FiAzkarWda3awatTokra2Saba7anWamasa2an extends StatefulWidget {
  static String screenRoute =
      'fi_azkar_wda3awat_tokra2_saba7an_wamasa2an_screen';
  const FiAzkarWda3awatTokra2Saba7anWamasa2an({super.key});

  @override
  State<FiAzkarWda3awatTokra2Saba7anWamasa2an> createState() =>
      _FiAzkarWda3awatTokra2Saba7anWamasa2anState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAzkarWda3awatTokra2Saba7anWamasa2anState
    extends State<FiAzkarWda3awatTokra2Saba7anWamasa2an> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_azkar_wda3awat_tokra2_saba7an_wamasa2an_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_azkar_wda3awat_tokra2_saba7an_wamasa2an_screen', value);
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
                      .addFavorite('في أذكار ودعوات تقرأ صباحا ومساءً',
                          FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أذكار ودعوات تقرأ صباحا ومساءً',
                          FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute,
                          FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أذكار ودعوات تقرأ صباحا ومساءً',
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
                      'إعلم أيّدك الله أن ما رغبت من الاحاديث في المحافظة على هاتين الساعتين مما لايحصى، وقد وردت فيهما أذكار ودعوات كثيرة عن النبي والأئمة صلوات الله عليهم أجمعين، ونحن في هذه الوجيزة نتبرك بإيراد نبذ يسيرة منها :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الأول :',
                  subtitle:
                      'روى ابن بابويه بسند معتبر عن أمير المؤمنين (عليه السلام) قال: من قرأ كلاًّ من قل هو الله أحد، وإنا أنزلناه، وآية الكرسي من قبل أن تطلع الشمس إحدى عشرة مرّة، منع ماله مما يخاف. وقال (عليه السلام): من قرأ قل هو الله أحد، وإنا أنزلناه قبل أن تطلع الشمس، لم يصبه في ذلك اليوم ذنب وإن جهد إبليس.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'روى الكليني وابن بابويه والشيخ الطوسي وغيرهم بأسناد معتبرة عن الصادق (عليه السلام) أنه قال: فريضة على كل مسلم أن يقول قبل طلوع الشمس عشر مرّات وقبل غروبها عشر مرّات: لاإلهَ إِلاّ الله وَحْدَهُ لاشَريكَ لَهُ، لَهُ المُلْكُ وَلَهُ الحَمْدُ يُحْيي وَيُميتُ وَهوَ حَي لايَموتُ بِيَدِهِ الخَيْرِ وَهوَ عَلى كُلِّ شَيٍ قَديرٌ. وفي بعض الروايات: يُحْيي وَيُميتُ وَيُميتُ ويُحْيي وكلمة (وَهوَ حَيُّ لايَموتُ بِيَدِهِ الخَيْرُ).\n\n'
                      'وردت في بعض الروايات وحذفت في عدة منها والكل حسن على الظاهر، والعمل بالكل أحسن، وفي بعض الروايات إن فاتك ذلك فاقضه قَضاء. وفي بعض الروايات: إنّ ذلك كفارة للذنوب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'روى ابن بابويه وغيره بأسناد كثيرة عن علي بن الحسين والصادق (عليه السلام): إنّ من كبّر الله تبارك وتعالى عند المساء مائة تكبيرة كان كمن أعتق مائة نسمة. وفي صحيحة أخرى عن الباقر (عليه السلام): من كبّر الله مائة تكبيرة قبل طلوع الشمس وقبل غروبها كتب الله له من الاجر كأجر من اعتق مائة رقبة. ومن قال: سُبْحانَ الله وَبِحَمْدِهِ عشر مرات كتب الله له عشر حسنات، ومن زاد زيدت له.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'روى ابن بابويه أيضاً بسند معتبر عن الصادق (عليه السلام) أنّه قال: قال رسول الله (صلّى الله عليه وآله وسلم): إنّ في الجنّة غرفا يرى ظاهرها من باطنها، وباطنها من ظاهرها، يسكنها من أمّتي من أطاب الكلام وأطعم الطعام وأفشى السلام وصلّى بالليل والناس نيام.\n\n'
                      'ثم قال (صلّى الله عليه وآله وسلم): إطابة الكلام هي أن تقول في الصباح والمساء عشر مرّات: سُبْحانَ الله وَالحَمْدُ لله ولا إلهَ إِلاّ الله وَالله أكْبَرُ. وفي المحاسن للبرقي بسند صحيح عن الباقر (عليه السلام) قال: مرّ النبي (صلّى الله عليه وآله وسلم) برجل يغرس غرسا في حائط له فوقف عليه فقال له: ألا أدلّك على شي أثبت أصلاً وأسرع ينعا وأطيب ثمراً ؟ قال: بلى يارسول الله (صلّى الله عليه وآله وسلم).\n\n'
                      'قال : إذا أصبحت وأمسيت فقل: سُبْحانَ الله وَالحَمْدُ لله وَلا إلهَ إِلاّ الله وَالله أكْبَرُ، فإن لك بكل تسبيح شجرات في الجنة من أنواع الفاكهة وهي الباقيات الصالحات التي قال الله تعالى في كتابه: إنّها خير وأبقى من مال الدنيا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'روى ابن بابويه بسند معتبر عن أمير المؤمنين (عليه السلام) أنّ من تلا هذه الآية قبيل المساء أو بعده ثلاث مرات لم يفته في ذلك اليوم شي من الخير، وصرف عنه جميع الشرور، وكذا من تلاها صباحا، وهي هذه الآية: فَسُبْحانَ الله حينَ تُمْسَونَ وَحينَ تُصْبِحونَ وَلَهُ الحَمْدُ في السَّماواتِ وَالارضِ وَعَشِيا وَحينَ تُظْهِرونَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'روى البرقي في المحاسن بسند موثق عن الرضا (عليه السلام) إنّ من قال ثلاثا حين يصبح ويُمْسي: بِسْمِ الله الرَّحْمنِ الرَّحيمِ لاحَوْلَ وَلاقوةَ إِلاّ بِالله العَليّ العَظيمِ لم يخف شيطانا ولاسلطانا ولاجذاما ولابرصا. وقال (عليه السلام): أما أنا فأقوله مائة مرة. وقد مر ذلك في تعقيب صلاة الفجر وصلاة العشاء سبع مرات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'بسند معتبر عن الصادق (صلوات الله وسلامه عليه) أنه فقد النبي (صلّى الله عليه وآله وسلم) رجلاً من الانصار فقال له: ما غيبتك عنّا ؟ فقال: الفقر يا رسول الله وطول السقم. فقال له رسول الله (صلّى الله عليه وآله وسلم) ألا أعلمك كلاما إذا قلته ذهب عنك الفقر والسقم ؟ قال بلى.\n\n'
                      'قال : إذا أصبحت وأمسيت فقل: لاحَوْلَ وَلاقُوَةَ إِلاّ بِالله تَوَكَلْتُ عَلى الحَيّ الَّذِي لايَموتُ وَالحَمْدُ لله الَّذِي لَمْ يَتَّخِذْ وَلَداً وَلَمْ يَكُنْ لَهُ شَريكٌ في المُلْكِ وَلَمْ يَكُنْ لَهُ وَلي مِنَ الذُّلِ وَكَبِّرْهُ تَكْبيراً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'ورد عن الصادق (عليه السلام) في أحاديث كثيرة معتبرة أنّه قال: قل قبل طلوع الشمس وقبل غروبها عشر مرات:\n\n'
                      'أعوذُ بِالله السَّميعِ العَليمِ مِنْ هَمزاتِ الشَياطينَ وَأعوذُ بِالله أنْ يَحْضِرونَ إنَّ الله هوَ السَّميعُ العَليمُ. وعلى بعض الروايات: وَأعوذُ بِكَ رَبِّ أنْ يَحْضُرُونَ وعلى بعضها: أسْتَعيذُ بِالله السَّميعِ العَليمِ مِنَ الشَّيطانِ الرَّجيمِ وَأعوذُ بِالله أنْ يَحْضُرونَ إلى اخر الدعاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'في فلاح السائل عن الصادق (عليه السلام) قال مايمنعكم أن تقولوا في كل صباح ومساء ثلاثا: اللَّهُمَّ مُقَلِّبَ القَلوبِ وَالابْصارِ ثَبِّتْ قَلبي عَلى دينَكَ وَلاتُزِغْ قَلْبي بَعْدَ إذ هَدَيْتَني، وَهَبْ لي مِنْ لَدُنْكَ رَحْمَةً إنَّكَ أنْتَ الوهّابُ وَأجرْني مِنَ النّار بِرَحْمَتِكَ، اللَّهُمَّ امْدُدْ لي في عُمْري وَأوسِعْ عَلى في رِزْقي وانْشِرْ عَلَيّ مِنْ رَحْمَتَكَ، وَإنْ كُنْتُ عِنْدَكَ في أمِّ الكِتابِ شَقيّا فَاجْعَلني سَعيداً فإنَّكَ تَمْحو ماتَشاءُ وتُثْبِتُ وَعِنْدَكَ أمُّ الكِتابِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'روى الطوسي رض وابن طاووس عن النبي (صلّى الله عليه وآله وسلم): أن من قال مرة إذا أصبح ومرة إذا أمسى: سُبْحانَ الله وَبِحَمْدِهِ سُبْحانَ الله العَظيمِ بعث الله ملكا إلى الجنة معه كساح من الفضة يكسح له من طين الجنة وهو مسك أذفر ثم يغرس له غرسا ثم يحيط عليه حائطا ثم يبوّب له بابا ثم يكتب على الباب هذا بستان فلان بن فلان.\n\n'
                      'وروى السيد في حديث معتبر آخر عن الصادق (عليه السلام): إنّ من سبّح بهذا التسبيح لغير التعجب محا الله عنه ألف سيئة واثبت له ألف حسنة وكتب له ألف شفاعة ورفع له ألف درجة وخلق له من هذه الكلمة طائراً أبيض يسبح الله تعالى بهذا التسبيح إلى يوم القيامة ويكتب له ثوابه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي عشر :',
                  subtitle:
                      'روى القطب الراوندي عن أمير المؤمنين (صلوات الله وسلامه عليه) قال: قال رسول الله صلى لله عليه وآله: من أصبح ولايذكر أربعة أخاف عليه زوال النعمة: الحَمْدُ لله الَّذِي عَرَّفَني نَفْسَهُ وَلَمْ يَتْرُكْني عَمْيانَ القَلْبِ، الحَمْدُ لله الَّذِي جَعَلَني مِنْ أمَّةِ مُحَمَّدٍ صَلّى الله عَلَيْهِ وَآلِهِ، الحَمْدُ لله الَّذِي جَعَلَ رِزْقي في يَدَيْهِ وَلَمْ يَجْعَلَ رِزْقي في أيْدي النّاسِ، الحَمْدُ لله الَّذِي سَتَرَ عُيوبي وَلَمْ يَفْضَحْني بَيْنَ الخَلائِقِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني عشر :',
                  subtitle:
                      'روى في كتاب (البلد الامين) عن سلمان الفارسي قدس: مامن عبد يقول حين يصبح ثلاثا: الحَمْدُ لله رَبِّ العالَمينَ الحَمْدُ لله حَمْداً كَثِيراً طَيّبا مُبارَكا فِيهِ إِلاّ صرف الله عنه سبعين نوعا من البلاء أدناها الهم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث عشر :',
                  subtitle:
                      'روى الكليني بسند معتبر عن الباقر (عليه السلام) قال: تقول إذا أصبحت: أصْبَحْتُ بِالله مؤمِنا عَلى دينِ مُحَمَّدٍ وَسِنَّتِهِ وَدينِ عَليّ وَسِنَّتِهِ وَدينِ الأَوْصِياء وَسُنَّتِهِمْ، آمَنْتُ بِسِرِّهِمْ وَعَلانيَتِهِمْ وَشاهِدِهِمْ وَغائِبِهِمْ، وَأعوذُ بِالله مِمّا اسْتَعاذَ مِنْهُ رَسولَ الله صَلّى الله عَلَيهِ وَآلِهِ وَعَليّ عَلَيهِ السَّلامُ وَالأَوْصِياء عَلَيْهِمُ السَّلامُ، وَأرْغَبُ إِلى الله فيما رَغِبوا إلَيهِ وَلاحَوْلَ وَلاقوةَ إِلاّ بِاللّهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع عشر :',
                  subtitle:
                      'روى الكليني عن الصادق (عليه السلام) فضلاً كَثِيراً لان يدعى بهذا الدعاء بعد الصباح قبلما تطلع الشمس: الله أكْبَرُ الله أكْبَرُ كَبِيراً وَسُبْحانَ الله بُكْرَةً وَأصيلاً وَالحَمْدُ لله رَبِّ العالَمينَ كَثِيراً لاشَريكَ لَهُ وَصَلّى الله عَلى مُحَمَّدٍ وَآلِهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس عشر :',
                  subtitle:
                      'في (البلد الامين) عن الصادق (عليه السلام): من قال في صبيحة يومه هذا القول ثلاثا لم يصبه بلاء حتى يمسي ومن قاله مساءً ثلاثا لم يصبه بلاء حتى يصبح: بِسْمِ الله الَّذِي لايَضُرُّ مَعَ اسْمِهِ شَيٌ في الارضِ وَلا في السَّماء وَهوَ السَّميعُ العَليمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس عشر :',
                  subtitle:
                      'روى الكليني وابن بابويه وغيرهما بأسناد موثقة وأسناد معتبرة عن الباقر (صلوات الله وسلامه عليه): إنّ نوحاً (عليه السلام) إنما سمي عبداً شكوراً لانّه كان يقول إذا أصبح وأمسى: اللَّهُمَّ إِنِّي أُشْهِدُكَ أنَّهُ ما أمْسى وَأصْبَحَ بي مِنْ نِعْمَةٍ أو عافيةٍ في دينٍ أو دُنْيا فَمِنْكَ وَحْدَكَ لاشَريكَ لَكَ، لَكَ الحَمْدُ وَلَكَ الشُّكْرَ بِها عَليَّ حَتّى تَرْضى إلاهَنا.\n\n'
                      'وفي بعض الروايات كان يقول: اللَّهُمَّ إِنَّهُ ماأصْبَحَ بي مِنْ نِعْمَةٍ أو عافيةٍ في دينٍ أو دُنْيا فَمِنْكَ وَحْدَكَ لاشَريكَ لَكَ لَكَ الحَمْدُ وَلَكَ الشُّكْرَ بِها عَليَّ حَتّى تَرْضى وَبَعْدَ الرِّضا عشر مرات، وكلاهما حسن.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع عشر :',
                  subtitle:
                      'روى الكليني والبرقي بأسناد معتبرة عن الصادق والكاظم (عليهما السلام) قالا: إذا أمسيت فنظرت إلى الشمس في غروب وإدبار فقل هذا القول فإنه أمان من كل سبع ومن شرّ الشيطان الرجيم وذرّيته ومن كل ماعضّ ولسع ومن اللّص والغول: بِسْمِ الله الرَّحْمنِ الرَّحيمِ، الحَمْدُ لله الَّذِي لَمْ يَتَّخِدْ وَلَداً وَلَمْ يَكُنْ لَهُ شَريكٌ في المُلْكِ وَالحَمْدُ لله الَّذِي يَصِفُ وَلايوصَفُ وَيَعْلَمُ وَلايُعْلَمُ، يَعْلَمُ خائِنَةَ الاعينِ وَماتُخْفي الصُدورُ، وَأعوذُ بِوجْهِ الله الكَريمِ وَبِاسْمِ الله العَظيمِ مِنْ شَرِّ ماذَرِأَ وَبَرِأَ وَمِنْ شَرِّ ماتَحْتَ الثَّرى وَمِنْ شَرِّ ماظَهَرَ وَما بَطَنْ وَمِنْ شَرِّ ماكانَ في اللَّيلِ والنَّهارِ وَمِنْ شَرِّ أبي قَتْرِةَ وَما وَلَدَ وَمِنْ شَرِّ الرَّسيسِ وَمِنْ شَرِّ ما وَصَفْتُ وَمالَمْ أصِفُ والحَمْدُ لله رَبِّ العالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن عشر :',
                  subtitle:
                      'روى الكليني بسند معتبر عن الباقر (صلوات الله وسلامه عليه) قال: من دعا بهذا الدعاء صباحا لم يضرّه في يومه شي، ومن دعا به مساءً لم يضره في ليلته شي إن شاء الله تعالى: اللَّهُمَّ إِنِّي أصْبَحْتُ في ذِمَّتِكَ وَجِوارِكَ، اللَّهُمَّ إِنِّي أسْتَوْدِعُكَ ديني وَنَفْسي وَدُنْيايَ وَآخِرَتي وَأهْلي وَمالي وَأعوذُ بِكَ ياعَظيمُ مِنْ شَرِّ خَلْقِكَ جَميعاً، وَأعوذُ بِكَ منْ شَرِّ مايَبْلِسُ بِهِ إبْليسُ وَجُنودَهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع عشر :',
                  subtitle:
                      'روى الكليني أيضاً بسند كالصحيح: إن رجلاً أتى الصادق (صلوات الله وسلامه عليه) فقال: علّمني دعاءا أدعو به في كلّ صباح ومساء. فقال (عليه السلام): قل: الحَمْدُ لله الَّذِي يَفْعَلُ مايَشاءُ وَلايَفْعَلُ مايَشاءُ غَيْرُهُ، الحَمْدُ لله كَما يُحِبُّ الله أنْ يُحْمَدَ الحَمْدُ لله كَما هوَ أهْلَهُ، اللَّهُمَّ أدْخِلْني في كُلِّ خَيْرٍ أدْخَلْتَ فيهِ مُحَمَّداً وَآلَ مُحَمَّدٍ وَأخْرِجْني مَنْ كُلِّ سُوءٍ أخْرَجْتَ مِنْهُ مُحَمَّداً وَآلَ مُحَمَّدٍ صَلّى الله عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العشرون :',
                  subtitle:
                      'في (البلد الامين) عن رسول الله (صلّى الله عليه وآله وسلم) قال: من قال هذا القول حين يصبح سبعا حفظه الله عزَّ وجلَّ يومه ذلك: فَالله خَيْرُ حافِظا وَهوَ أرْحَمُ الرّاحِمينَ إنَّ وَلييَ الله الَّذِي نَزَّلَ الكِتابَ وَهوَ يَتَولى الصّالِحينَ، فِإنْ تَوَلّوا فَقُلْ حَسْبي الله لا إلهَ إِلاّ هوَ عَلَيْهِ تَوَكَلْتُ وَهوَ رَبُّ العَرْشِ العَظيمِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي والعشرون :',
                  subtitle:
                      'روي في الكتب المعتبرة أنّ من صلى على محمد وآل محمد بهذه الصلوات ثلاث مرات صباحا وثلاث مرات في اَّخر النهار غفرت ذنوبه وأديم سروره واستجيب دعاؤه ووسع في رزقه وأعين على عدوه ورافق في الجنان محمداً (صلّى الله عليه وآله وسلم): اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ في الأولينَ وَصَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ في الاخِرينَ وَصَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ في المَلا الاعْلى وَصَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ في المُرْسَلينَ ، اللَّهُمَّ أعْطِ مُحَمَّداً الوَسيلَةَ وَالشَّرَفَ وَالفَضيلَةَ وَالدَّرَجَةَ الكَبيرَةَ، اللَّهُمَّ إِنِّي آمَنْتُ بمُحَمَّدٍ وَآلِهِ وَلَمْ أرَهُ فَلاتَحْرِمْني يَوْمَ القيامَةَ رؤيَتَهُ وَارْزُقْني صُحْبَتَهُ وَتَوَفَّني عَلى مِلَّتَهُ واسْقِني مِنْ حَوْضِهِ مَشْرَبا رَوِيّا سائِغا هَنيّا لا أظْمأُ بَعْدَهُ أبَداً، إنَّكَ عَلى كُلِّ شَيٍ قَديرٌ، اللَّهُمَّ كَما آمَنْتُ بِمُحَمَّدٍ صَلّى الله عَلَيهِ وَآلِهِ وَلَمْ أرَهُ فَأرِني في الجِنانِ وَجْهَهُ، اللَّهُمَّ بَلِّغْ روحَ مُحَمَّدٍ عَنِّي تَحيَّةً كَثيرةً وَسَلاما.\n\n'
                      'أقول : هذه هي الصلوات التي رواها الكفعمي عن الصادق (صلوات الله وسلامه عليه) أنّه قال: من أراد أن يسرّ محمداً وآل محمد (عليهم السلام) فليصلِّ بها عليهم. واعلم أن للصباح والمساء دعوات كثيرة لايسع وجيزتنا هذه لاكثر مما أوردناه، وسيأتي أيضاً عشر دعوات مما يدعى به في كل صباح ومساء ونحن قد أثبتناها في المفاتيح في خلال أعمال يوم عرفة في الباب الرابع، واقرأ أيضاً إن أمكنتك الفرصة دعاء العشرات ص143، ودعاء يستشير ص160.\n\n'
                      'ودعاء النور ص219، ودعاء العهد ص887: اللهم رب النور العظيم، وهذه الادعية كلها مذكورة في المفاتيح.\n\n'
                      'وقد أوردنا أيضاً في اَّداب تربة الحسين (عليه السلام) الدعاء: أصْبَحْتُ اللَّهُمَّ مُعْتَصِما بِذِمامِكَ ؛ تدعو به في كل صباح ومساء ماسكا بيدك السبحة من التربة لتأمن من كل ما يُخاف منه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute,
          pushBack: FiL2intibahMenAlnawmWsalatAllayl.screenRoute,
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
