import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'fi_ad3iyat_al3ilal_walmarad.dart';
import 'fi_zikr_dou3a2ain_lildin.dart';

class FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha extends StatefulWidget {
  static String screenRoute = 'fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha_screen';
  const FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha({super.key});

  @override
  State<FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha> createState() => _FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airahaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airahaState extends State<FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute);
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
                      .addFavorite('في ذكر بعض ماورد للهم والغم والخوف وغيرها',
                          FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في ذكر بعض ماورد للهم والغم والخوف وغيرها',
                          FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute,
                          FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في ذكر بعض ماورد للهم والغم والخوف وغيرها',
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
                  title: 'ويشتمل على اثني عشر دعاءً :'
                  'الأول :',
                  subtitle:
                      'روي عن الباقر (عليه السلام) قال : إذا أتى بك أمر تخافه، استقبل القبلة فصلِّ ركعتين، ثم قل : ياأبْصَرَ الناظِرينَ وَياأسْمَعَ السامِعينَ وَياأسْرَعَ الحاسِبينَ وَياأرْحَمَ الرّاحِمينَ، وقل هذه الكلمات سبعين مرة كلما دعوت بهذه الكلمات سألت حاجتك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'قال رسول الله (صلّى الله عليه وآله وسلم) : من أصابه همّ أو غمّ أو كرب أو بلاء أو لاْواءٌ (شدة) فليقل : الله رَبّي لاأشْرِكُ بِهِ شَيْئاً تَوَكَلْتُ عَلى الحَيّ الَّذي لايَموتُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'عن الصادق (عليه السلام) لما طرح إخوة يوسف، يوسف في الجبّ أتاه جبرائيل (عليه السلام) فقال : ياغلام ماتصنع ههنا فقال :\n\n'
                      'إنّ إخوتي ألقوني في الجبّ، قال : فتحب أن تخرج منه، قال: ذاك إلى الله عزَّ وجلَّ، إن شاء أخرجني فقال له: إنّ اللّه تعالى يقول لك: أدعني بهذا الدعاء، حتى أخرجك من الجبّ. فقال له وما الدعاء ؟ فقال قل : اللّهُمَّ إِنِّي أَسْأَلُكَ بِأنَّ لَكَ الحَمْدَ لا إلهَ إِلاّ أنْتَ المَنّانُ بَديعُ السَّماواتِ وَالارْضِ ذُو الجَلالِ وَالاكْرامِ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ تَجْعَلَ لي مِمّا أنا فيه فَرَجاً وَمَخْرَجاً. ثم جاءت السيارة وأخرجته من الجبّ كما ذكره الله في كتابه المجيد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال: إذا خفت أمراً فقل: اللّهُمَّ إنَّكَ لا يَكْفي مِنْكَ أحَدٌ وَأنْتَ تَكْفي مِنْ كُلِّ أحَدٍ مِنْ خَلْقِكَ فَإكْفِني كَذا وَكَذا. وفي حديث اَّخر قال: تقول: ياكافياً مِنْ كُلِّ شَيٍ وَلايَكْفي مِنْكَ شَيٌ في السَّماواتِ وَالارْضِ اكْفِني ماأهَمَّني مِنَ أمرِ الدُّنْيا وَالاخِرَةِ وَصَلِّ عَلى مُحَمَّدٍ وَآلِهِ.\n\n'
                      'وقال الصادق (عليه السلام) من دخل على سلطان يهابه فليقل : بِالله أسْتَفْتِحُ وَبِالله أسْتَنْجِحُ وَبِمُحَمَّدٍ صَلّى الله عَلَيْهِ وَآلِهِ أتَوَجَّهُ، اللّهُمَّ ذَلِّلْ لي صُعُوبَتَهُ وَسَهِّلْ لي حُزُونَتَهُ فَإنَّكَ تَمْحو ماتَشاءُ وَتُثْبِتُ وَعِنْدَكَ أُمُّ الكِتابِ.\n\n'
                      'ويقول كذلك : حَسْبي اللّهُ لا إلهَ إِلاّ هوَ عَلَيْهِ تَوَكَّلْتُ وَهوَ رَبُّ العَرْشِ العَظيمِ، وَأمْتَنِعُ بِحَوْلْ الله وَقُوَّتِهِ مِنْ حَوْلِهِمْ وَقُوَّتِهِمْ، وَأمْتَنِعُ بِرَبِّ الفَلَقِ مِنْ شَرِّ ما خَلَقَ، وَلا حَوْلَ وَلا قوَّةَ إِلاّ بِاللّهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'وروي أنّ هذا دعاء الباقر (عليه السلام) في الأمر يحدث : اللّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأغْفِرْ لي وارْحَمْني وَزَكِّ عَمَلي ويَسِّرْ مُنْقَلَبي وَاهْدِ قَلْبي وَآمِنْ خَوْفي وَعافِني في عُمْري كُلِّهُ وَثَبِّتْ حُجَّتي وَاغْفِرْ خَطاياي وَبَيّضْ وَجْهي وَاعْصِمْني في ديني وَسَهِّلْ مَطْلَبي وَوَسِّعْ عَلَيَّ في رِزْقي فَإنّي ضَعيفٌ، وَتَجاوَزْ عَنْ سَيِ ماعِنْدي بِحُسْنِ ما عِنْدَكَ وَلا تَفْجَعْني بِنَفْسي وَلا تَفْجَعْ لي حَميما وَهَبْ لي ياإلهي لَحْظَةً مِنْ لَحَظاتِكَ تَكْشِفُ بِها عَنّي جَميعَ مابِهِ ابْتَلَيْتَني وَتَرُدُّ بِها عَلَيَّ ما هوَ أحْسَنُ عادَتِكَ عِنْدي، فَقَدْ ضَعُفَتْ قوَّتي وَقَلَّتْ حيلَتي وانْقَطَعَ مِنْ خَلْقِكَ رَجائي وَلَمْ يَبْقَ إِلاّ رَجاؤكَ وَتَوَكُلي عَلَيْكَ، وَقُدْرَتُكَ عَلَيَّ يارَبِّ أنْ تَرْحَمَني وَتُعافيني كَقُدْرَتِكَ عَلَيَّ أنْ تُعَذِّبَني وَتَبْتَليني. إلهي ذِكْرُ عَوائِدِكَ يؤنِسُني وَالرَّجاءُ لانعامِكَ يُقَوّيني وَلَمْ أخْلُ مِنْ نِعْمِكَ مِنْذُ خَلَقْتَني، فَأنْتَ رَبّي وَسَيّدي وَمَفْزَعي وَمَلْجأي وَالحافِظْ لي وَالذّابُّ عَنّي وَالرَّحيمَ بِي والمُتَكَفِّلُ بِرِزْقي وَفي قَضائِكَ وَقُدْرَتِكَ كُلُّ ما أنا فيهِ، فَلْيَكُنْ ياسَيِّدي وَمَوْلاي فيما قَضَيْتَ وَقَدَّرْتَ وحَتَّمْتَ تَعْجيلُ خَلاصي مِمّا أنا فيهِ جَميعِهُ وَالعافيةُ لي فَإنّي لاأجِدُ لِدَفْعِ ذلكِ أحدا غَيْرَكَ وَلا أعْتَمِدُ فيهِ إِلاّ عَلَيكَ فَكُنْ ياذا الجَلالِ وَالاكْرامِ عِنْدَ حُسْنَ ظَنّي بِكَ وَرَجائي لَكَ، وَارْحَمْ تَضَرُّعي وإسْتكانَتي وَضَعْفَ رُكْني، وَأمْنُنْ بِذلِكَ عَلَيَّ وَعَلى كُلِّ داعٍ دَعاكَ ياأرْحَمْ الرّاحمينَ وَصَلّى اللّهُ عَلى مُحَمَّدٍ وَآلِهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : كان علي بن الحسين (عليه السلام) يقول : ماأبالي إذا قلت هذه الكلمات لو اجتمع علي الانس والجن :\n\n'
                      'بِسْمِ الله وَبِالله وَمِنَ الله وإِلى الله وَفي سَبيلِ الله وَعلى مِلَّةِ رَسولِ الله صَلّى الله عَلَيْهِ وَآلِهِ. اللّهُمَّ إلَيْكَ أسْلَمْتُ نَفْسي وَإلَيْكَ وَجَّهْتُ وَجْهي وَإلَيْكَ ألْجأتُ ظَهْري وَإلَيْكَ فَوَّضْتُ أمْري، اللّهُمَّ احْفَظْني بِحِفْظِ الايمانِ مِنْ بَيْنِ يَدَيَّ وَمِنْ خَلْفِي وَعَنْ يَميني وَعَنْ شِمالي وَمِنْ فَوْقي وَمنْ تَحْتي وما قِبَلي وَادْفَعْ عَنّي بِحَوْلِكَ وَقُوَّتِكَ فَإنَّهُ لاحَوْلَ وَلاقوَّةَ إِلاّ بِكَ .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'يدعى لدفع الكربة والخوف من السلطان بدعاء أهل البيت (عليهم السلام) : ياكائِنا قَبْلَ كُلِّ شَيٍ وَيامُكَوّنَ كُلِّ شَيٍ وَياباقياً بَعْدَ كُلِّ شيٍ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَافْعَلْ بِي كَذا وَكَذا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'عن محمد التقي (عليه السلام) قال: للفرج يواظب على هذا الدعاء : يامَنْ يَكْفي مِنْ كُلِّ شَيٍ وَلا يُكْفى مِنْهُ شَيٌ إكْفِني ماأهَمَّني.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'عن زين العابدين (عليه السلام) أنه كان يقول لابنه : يابني من أصابه منكم مصيبة، أو نزلت به نازلة فليتوضأ، وليسبغ الوضؤ، ثم يصلي ركعتين أو أربع ركعات، ثم يقول في اَّخرهنّ : يامَوْضِعَ كُلِّ شَكْوى وَياسامِعَ كُلِّ نَجْوى وَياشاهِدَ كُلّ مَلا وَياعالِمَ كُلِّ خَفيَّةٍ وَيا دافِعَ مايَشاءُ مِنْ بَليّةٍ، ياخَليلَ إبْراهيمَ يانَجيّ موسى يامُصطفيَ مُحَمَّدٍ صَلّى الله عَلَيهِ وَآلِهِ أدْعوكَ دُعاءَ مَنْ اشْتَدَّتْ فاقَتُهُ وَقَلَّتْ حيلَتُهُ وَضَعُفَتْ قوَّتُهُ دُعاءَ الغَريبِ الغَريقِ المُضْطَرُّ الَّذي لايَجِدُ لِكَشْفِ ماهو فيهِ إِلاّ أنْتَ ياأرْحَمَ الرّاحمينَ. فإنّه لايدعو به أحد إِلاّ كشف الله عنه إن شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'عن الصادق (عليه السلام) لرفع الهم والحزن، تغتسل فتصلّي ركعتين وتقول: يافارِجَ الهَمِّ وَياكاشِفَ الغَمِّ يارَحْمنَ الدُّنيا وَالاخِرَةِ وَرَحيمَهُما فَرِّجْ هَمّي وَاكْشِفْ غَمّي ياالله الواحِدُ الاحَدُ الصَمَدُ الَّذي لَمْ يَلِدُ وَلَمْ يولَدْ ولَمْ يَكُنْ لَهُ كفوا أحَدْ إعْصِمْني وَطَهِّرْني وَإذْهِبْ بِبَليَّتي. واقرأ اَّية الكرسي والمعوذتين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي عشر :',
                  subtitle:
                      'روي أنك تقول لرفع الهم في السجود مائة مرة: ياحَيُّ ياقَيومُ يا لا إلهَ إِلاّ أنْتَ بِرَحْمَتِكَ أسْتَغيثُ فَاكْفِني ماأهَمَّني ولاتَكِلْني إِلى نَفْسي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني عشر :',
                  subtitle:
                      'عن موسى بن جعفر (عليه السلام) أنه قال لسماعة إذا كانت لك يا سماعة إلى الله حاجة فقل: اللّهُمَّ إِنِّي أَسْأَلُكَ بِحَقِّ مُحَمَّدٍ وَعَليّ فَإنَّ لَهُما عِنْدَكَ شَأنا مِنَ الشَأنِ وَقَدْراً مِنَ القَدْرِ، فَبِحَقِّ ذلكَ الشَأنِ وَبِحَقِّ ذلكَ القَدْرِ أنْ تُصَلّي عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ تَفْعَلَ كَذا وَكَذا.\n\n'
                      'فإنه إذا كان يوم القيامة، لم يبق ملك مقرب ولا نبي مرسل ولامؤمن ممتحن إِلاّ وهو يحتاج الى محمد وعلي صلوات الله عليهما واَّلهما، في ذلك اليوم.\n\n'
                      'أقول : وأنا الفقير روى ابن أبي الحديد عن أمير المؤمنين (عليه السلام) قال: سألت ذات يوم رسول الله (صلّى الله عليه وآله وسلم) أن يدعو لي بالمغفرة، فقال : سأدعو، ثم قام فصلى، فرفع يده للدعاء، فتسمعت إليه فسمعته يقول : اللّهُمَّ بِحَقِّ عَليّ عِنْدَكَ اغْفِرْ لِعَليّ، فقلت يارسول الله: ماهذا الدعاء ؟ قال : وهل أجد من هو أحب إلى الله منه لاستشفع به إلى اللّه.\n\n'
                      'أقول : أوردنا بعض مايناسب هذا الفصل من الدعاء في الباب الأول عند ذكر دعوات سجدة الشكر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiAd3iyatAl3ilalWalmarad.screenRoute,
          pushBack: FiZikrDou3a2ainLildin.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في ذكر بعض ما ورد للهم والغم والخوف وغيرها.mp3',
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
