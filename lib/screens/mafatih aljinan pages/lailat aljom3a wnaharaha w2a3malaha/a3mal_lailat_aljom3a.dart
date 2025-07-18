import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'a3mal_nahar_aljom3a.dart';
import 'salat_2imam_almahdi.dart';

class A3malLailatAljom3a extends StatefulWidget {
  static String screenRoute = 'a3mal_lailat_aljom3a_screen';
  const A3malLailatAljom3a({super.key});

  @override
  State<A3malLailatAljom3a> createState() => _A3malLailatAljom3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malLailatAljom3aState extends State<A3malLailatAljom3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_lailat_aljom3a_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_lailat_aljom3a_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
              }
            },
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
                          'أعمال ليلة الجمعة', A3malLailatAljom3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال ليلة الجمعة',
                          A3malLailatAljom3a.screenRoute,
                          A3malLailatAljom3a.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال ليلة الجمعة',
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
                  'فكثيرة وهُنا نقتصر على عدّة منها:',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الأول :',
                  subtitle:
                      'الإكثار من قول سُبْحانَ اللهِ وَاللهُ اَكْبَرُ وَلا اِلـهَ إلاّ اللهُ والاكثار من الصلاة على محمّد وآله فقد روي انّ ليلة الجمعة ليلتها غرّاء ويومها يوم زاهِر فأكثروا من قول سُبْحانَ اللهِ وَاللهُ اَكْبَرُ وَلا اِلـهَ إلاّ اللهُ واكثروا من الصلاة على محمّد وآل محمّد (عليهم السلام) وفي رواية اُخرى انّ أقلّ الصلاة على محمّد وآله في هذه الليلة مائة مرّة وما زدت فهو أفضل وعن الصّادق (عليه السلام) انّ الصلاة على محمّد وآله في ليلة الجمعة تعدل ألف حسنة وتمحو ألف سيّئة وترفع ألف درجة ويستحبّ الاستكثار فيها من الصلاة على محمّد وآل محمّد صلوات الله عليهم من بعد صلاة العصر يوم الخميس الى آخر نهار يوم الجمعة. وروى بسند صحيح عن الصّادق (عليه السلام) قال : اذا كان عصر الخميس نزل من السّماء ملائكة في أيديهم أقلام الذّهب وقراطيس الفضّة لا يكتبُون الى ليلة السّبت الاّ الصلاة على محمّد وآله محمّد وقال الشّيخ الطّوسي ويستحبّ في يوم الخميس الصلاة على النّبيّ (صلى الله عليه وآله) ألف مرّة ويستحبّ أن يقول فيه : اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَعَجِّلْ فَرَجَهُمْ وَأَهْلِكْ عَدُوَّهُمْ مِنَ الْجِنِّ وَالاِنْسِ مِنَ الاَْوَّلينَ وَالاخِرينَ وان قال ذلك من بعد العصر يوم الخميس الى آخر نهار يوم الجمعة كان له فضل كثير وقال الشيخ ايضاً: ويستحبّ أن تستغفر آخر نهار يوم الخميس فتقول : اَسْتَغْفِرُ اللهَ الَّذي لا اِلـهَ إلاّ هُوَ الْحَيُّ الْقَيُّومُ وَاَتُوبُ اِلَيْهِ تَوْبَةَ عَبْد خاضِع مِسْكين مُسْتَكين لا يَسْتَطيعُ لِنَفْسِهِ صَرْفاً وَلا عَدْلاً وَلا نَفْعاً وَلا ضَرّاً وَلا حَياةً وَلا مَوْتاً وَلا نُشُوراً وَصَلَّى اللهُ عَلى مُحَمَّد وَعِتْرَتِهِ الطَّيِّبينَ الطّاهِرينَ الاَْخْيارِ الاَبْرارِ وَسَلَّمَ تَسْليماً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'أن يقرأ ليلة الجُمعة سورة بني اسرائيل والكهف والسّور الثلاث المبدوءة بطس وسورة الم السّجدة ويس وص والاحقاف والواقعة وحم السّجدة وحم الدّخان والطور واقتربت والجمعة فان لم تسنح له الفرصة فليختار من هذه السّور الواقعة وما قبلها ، فقد روي عن الصّادق (عليه السلام) قال : من قرأ بني اسرائيل في كلّ ليلة جمعة لم يمت حتّى يدرك القائم (عليه السلام) فيكون من أصحابه ، وقال (عليه السلام) : من قرأ سورة الكهف كلّ ليلة جمعة لم يمت الاّ شهيداً وبعثه الله مع الشّهداء ووقف يوم القيامة مع الشّهداء ، وقال (عليه السلام): من قرأ الطّواسين الثّلاثة في ليلة الجُمعة كان من أوليآء الله وفي جوار الله وفي كنفه ولم يصبه في الدّنيا بؤس أبداً واعطي في الاخرة من الجنّة حتّى يرضى وفوق رضاه وزوّجه الله مائة زوجة من الحور العين، وقال (عليه السلام): من قرأ سورة السّجدة في كلّ ليلة جمعة أعطاه الله كتابه بيمينه ولم يحاسبه بما كان منه وكان مِن رفقآء محمّد وأهل بيته (عليهم السلام). وبسند معتبر عن الباقِر (عليه السلام) قال : مَنْ قرأ سورة ص في ليلة الجُمعة أعطي من خير الدّنيا والاخرة ما لم يُعط أحدٌ من النّاس الاّ نبيّاً مُرسلاً أو ملكاً مقرّباً وأدخله الله الجنّة، وكلّ من أحبّ من أهل بيته حتّى خادمه الذي يخدمه وان لم يكن في حدّ عياله ولا في حدّ من يشفع له، وعن الصّادق (عليه السلام) قال: من قرأ في ليلة الجُمعة أو يوم الجُمعة سُورة الأحقاف لم يصبه الله بروعة في الحياة الدّنيا وامّنه من فزع يوم القيامة، وقال (عليه السلام) مَن قرأ الواقعة كلّ ليلة جُمعة أحبّه الله تعالى وأحبّه الى النّاس اجمعين ولم ير في الدّنيا بؤساً أبداً ولا فقراً ولا فاقة ولا آفة من آفات الدّنيا وكان من رفقاء أمير المؤمنين (عليه السلام) وهذه السّورة سورة أمير المؤمنين (عليه السلام) وروي انّ من قرأ سُورة الجُمعة كلّ ليلة جمعة كانت كفّارة له ما بين الجمعة الى الجُمعة، وروي مثله فيمن قرأ سورة الكهف في كلّ ليلة جمعة وفيمن قرأها بعد فريضتي الظّهر والعصر يوم الجُمعة. واعلم انّ الصّلوات المأثورة في ليلة الجُمعة عديدة منها صلاة أمير المؤمنين (عليه السلام) ومنها الصلاة ركعتان يقرأ في كلّ ركعة الحمد وسورة اذا زلزلت خمس عشرة مرّة فقد روي انّ من صلاّها أمّنه الله تعالى من عذاب القبر وأهوال يوم القيامة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'أن يقرأ سورة الجُمعة في الرّكعة الاُولى من فريضتي المغرب والعشاء، ويقرأ التّوحيد في الثّانية من المغرب، والأعلى في الثّانية من العشآء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'ترك انشاد الشّعر، ففي الصّحيح عن الصّادق صَلوات الله وَسلامُه عليه انّه يكره رواية الشّعر للصّائم والمحرم وفي الحرم وفي يوم الجُمعة وفي اللّيالي ، قال الراوي : وان كان شعراً حقّاً؟ فأجاب (عليه السلام) : وان كان حقّاً. وفي حديث معتبر عن الصّادق (عليه السلام) انّ النّبي (صلى الله عليه وآله) قال : من أنشد بيتاً من الشّعر في ليلة الجُمعة أو نهارها لم يكن له سواه نصيب من الثّواب في تلك الليلة ونهارها، وعلى رواية اُخرى لم تقبل صلاته في تلك الليلة ونهارها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يكثر من الدّعاء لاخوانه المؤمنين كما كانت تصنع الزّهراء (عليها السلام)، واذا دعا لعشر من الاموات منهم فقد وجبت له الجنّة كما في الحديث.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يدعو بالمأثور من أدعيتها وهي كثيرة ونحن نقتصر على ذكر نبذ يسيرة منها. بسند صحيح عن الصّادق (عليه السلام) انّ من دعا بهذا الدّعاء ليلة الجُمعة في السّجدة الاخيرة من نافلة العشاء سبع مرّات فرغ مغفوراً له والأفضل أن يكرّر العمل في كلّ ليلة:\n\n'
                      'اَللّـهُمَّ اِنّي أَسْأَلُكَ بِوَجْهِكَ الْكَريمِ وَاسْمِكَ الْعَظيمِ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِهِ وَاَنْ تَغْفِرَ لي ذَنْبِيَ الْعَظيمَ وعن النّبيّ قال : من قال هذه الكلمات سبع مرّات في ليلة الجمعة فمات ليلته دخل الجنّة ومن قالها يوم الجمعة فمات في ذلك اليوم دخل الجنّة، من قال:\n\n'
                      'اَللّـهُمَّ اَنْتَ رَبّي لا اِلـهَ إلاّ اَنْتَ خَلَقْتَني وَاَنَا عَبْدُكَ وَابْنُ اَمَتِكَ وَفي قَبْضَتِكَ وَناصِيَتي بِيَدِكَ اَمْسَيْتُ عَلى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ اَعُوذُ بِرِضاكَ مِنْ شَرِّ ما صَنَعْتُ اَبُوءُ بِنِعْمَتِكَ (بِعَمَلى) وَاَبُوءُ بِذَنْبى (بِذُنُوبى) فَاغْفِرْ لى ذُنُوبى اِنَّهُ لا يَغْفِرُ الذُّنُوبَ إلاّ اَنْتَ.\n\n'
                      'وقال الشّيخ الطّوسي والسيّد والكفعمي والسيّد ابن باقي يستحبّ أن يدعى بهذا الدّعاء في ليلة الجمعة ونهارها وفي ليلة عرفة ونهارها ونحن نروي الدّعاء عن كتاب المصباح للشّيخ وهو:\n\n'
                      'اَللّـهُمَّ مَنْ تَعَبَّأَ وَتَهَيّأَ وَاَعَدَّ وَاسْتَعَدَّ لِوِفادَة اِلى مَخْلُوق رَجاءَ رِفْدِهِ وَطَلَبَ نائِلِهِ وَجائِزَتِهِ فَاِلَيْكَ يا رَبِّ تَعْبِيَتى وَاسْتِعْدادي رَجاءَ عَفْوِكَ وَطَلَبَ نائِلِكَ وَجائِزَتِكَ فَلا تُخَيِّبْ دُعائي يا مَنْ لا يَخيبُ عَلَيْهِ سائِلٌ (السّائِلُ) وَلا يَنْقُصُهُ نائِلٌ فَاِنّي لَمْ آتِكَ ثِقَةً بِعَمَل صالِح عَمِلْتُهُ وَلا لِوِفادَةِ مَخْلُوق رَجَوْتُهُ اَتَيْتُكَ مُقِرّاً عَلى نَفْسي بِالاِْساءةِ وَالظُّلْمِ مُعْتَرِفاً بِاَنْ لا حُجَّةَ لي وَلا عُذْرَ اَتَيْتُكَ اَرْجُو عَظيمَ عَفْوِكَ الَّذى عَفَوْتَ (عَلَوْتَ) بِهِ (عَلى) عَنِ الْخاطِئينَ (الْخَطّائينَ) فَلَمْ يَمْنَعْكَ طُولُ عُكُوفِهِمْ عَلى عَظيمِ الْجُرْمِ اَنْ عُدْتَ عَلَيْهِمْ بِالرَّحْمَةِ فَيا مَنْ رَحْمَتُهُ واسِعَةٌ وَعَفْوُهُ عَظيمٌ يا عَظيمُ يا عَظيمُ يا عَظيمُ لا يَرُدُّ'
                      'غَضَبَكَ إلاّ حِلْمُكَ وَلا يُنْجي مِنْ سَخَطِكَ إلاَّ التَّضَرُّعُ اِلَيْكَ فَهَبْ لي يا اِلـهي فَرَجاً بِالْقُدْرَةِ الَّتي تُحْيي بِها مَيْتَ الْبِلادِ وَلا تُهْلِكْني غَمّاً حَتّى تَسْتَجيبَ لي وَتُعَرِّفَنِي الاِجابَةَ في دُعائي وَاَذِقْني طَعْمَ الْعافِيَةِ إلى مُنَتَهى اَجَلي وَلا تُشْمِتْ بي عَدُوّى وَلا تُسلّطهُ عَلَيَّ وَلا تُمَكِّنْهُ مِنْ عُنُقي اَللّـهُمَّ (اِلـهي) اِنْ وَضَعْتَني فَمَنْ ذَا الَّذي يَرْفَعُني وَاِنْ رَفَعْتَني فَمَنْ ذَا الَّذي يَضَعُني وَاِنْ اَهْلَكْتَني فَمَنْ ذَا الَّذي يَعْرِضُ لَكَ في عَبْدِكَ اَوْ يَسْأَلُكَ عَنْ اَمْرِهِ وَقَدْ عَلِمْتُ اَنَّهُ لَيْسَ فى حُكْمِكَ ظُلْمٌ وَلا فى نَقَمَتِكَ عَجَلَةٌ وَاِنَّما يَعْجَلُ مَنْ يَخافُ الْفَوْتَ وَاِنَّما يَحْتاجُ اِلَى الظُّلْمِ الضَّعيفُ وَقَدْ تَعالَيْتَ يا اِلـهى عَنْ ذلِكَ عُلُوّاً كَبيراً اَللّـهُمَّ اِنّى اَعُوذُ بِكَ فَاَعِذْنى وَاَسْتَجيرُ بِكَ فَاَجِرْنى وَاَسْتَرْزِقُكَ فَارْزُقْنى وَاَتَوَكَّلُ عَلَيْكَ فَاكْفِنى وَاَستَنْصِركَ عَلى عَدُوّى (عدوّك) فَانْصُرْنى وَاَسْتَعينُ بِكَ فَاَعِنّى وَاَسْتَغْفِرُكَ يا اِلـهى فَاغْفِرْ لى آمينَ آمينَ آمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'أن يدعو بدعاء كميل وَسَيذكر في الفصل الاتي ان شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'أن يقرأ الدّعاء : اَللّـهُمَّ يا شاهِدَ كُلِّ نَجْوى ويدعى به ليلة عرفة أيضاً وسيأتي ان شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'أن يقول عشر مرّات يا دائِمَ الْفَضْلِ عَلى الْبَريِّةِ يا باسِطَ الْيَدَيْنِ بِالْعَطِيَّةِ يا صاحِبَ الْمَواهِبِ السَّنِيَّةِ صَلِّ عَلى مُحَمِّد وَآلِهِ خَيْرِ الْوَرىْ سَجِيَّةً وَاغْفِرْ لَنا يا ذَا الْعُلى فى هذِهِ الْعَشِيَّةِوهذا الذّكر الشّريف وارد في ليلة عيد الفطر أيضاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشِر :',
                  subtitle:
                      'أن يأكل الرُّمّان كما كانَ يعمل الصّادق (عليه السلام) في كلّ ليلة الجُمعة ولعلّ الاحسن أن يجعل الاكل عند النّوم ، فقد روي انّ من أكل الرُّمان عند النّوم أمن في نفسه الى الصّباح وينبغي أن يبسط لاكل الرّمّان منديلاً يحتفظ بما يتساقط من حبّه فيجمعه ويأكله وكما ينبغي أن لا يشرك أحداً في رُمّانته. روى الشيخ جعفر بن احمد القمّي في كتاب العروس عن الصّادق (عليه السلام) انّ من قال بين نافلة الصّبح وفريضته مائة مرّة: سُبْحانَ رَبِّيَ الْعَظيمِ وَبِحَمْدِهِ اَسْتَغْفِرُ اللهَ رَبّى وَاَتُوبُ اِلَيْهِ بنى الله له بيتاً في الجنّة، وهذا الدّعاء رواه الشّيخ والسّيد وغيرهما وقالوا : يستحبّ أن يدعى به في السّحر ليلة الجُمعة، وهذا هو الدّعاء:\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وآلِهِ وَهَبْ لِيَ الْغَداةَ رِضاكَ وَاَسْكِنْ قَلْبى خَوْفَكَ وَاقْطَعْهُ عَمَّنْ سِواكَ حَتّى لا اَرْجُوَ وَلا اَخافَ إلاّ إِيّاكَ اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وآلِهِ وَهَبْ لى ثَباتَ الْيَقينِ وَمَحْضَ الاِخْلاصِ وَشَرَفَ التَّوْحيدِ وَدَوامَ الاِسْتِقاَمة وَمَعْدِنَ الصِّبْرِ والرِّضا بِالْقَضاءِ وَالْقَدَرِ يا قاضِيَ حَوائِجِ السّائِلينَ يا مَنْ يَعْلَمُ ما في ضَميرِ الصّامِتينَ صَلِّ عَلى مُحَمَّد وآلِهِ وَاسْتَجِبْ دُعائى وَاغْفِرْ ذَنْبى وَاَوْسِعْ رِزْقي وَاقْضِ حَوائِجي في نَفْسي وَاِخْواني في ديني وَاَهْلي اِلـهي طُمُوحُ الامالِ قَدْ خابَتْ إلاّ لَدَيْكَ وَمَعاكِفُ الْهِمَمِ قَدْ تَعَطَّلَتْ إلاّ عَلَيْكَ وَمَذاهِبُ الْعُقُولِ قَدْ سَمَتْ إلاّ اِلَيْكَ فَاَنْتَ الَّرجاءُ وَاِلَيْكَ الْمُلْتَجَأُ يا اَكْرَمَ مَقْصُود وَاَجْوَدَ مَسْؤُول هَرَبْتُ اِلَيْكَ بِنَفْسى يا مَلْجَاَ الْهارِبينَ بِاَثْقالِ الذُّنُوبِ اَحْمِلُها عَلى ظَهْرى لا اَجِدُ لى اِلَيْكَ شافِعاً سِوى مَعْرِفَتي بِاَنَّكَ اَقْرَبُ مَنْ رَجاهُ الطّالِبُونَ وَاَمَّلَ مالَدَيْهِ الرّاغِبُونَ يا مَنْ فَتَقَ الْعُقُولَ بِمَعْرِفَتِهِ وَاَطْلَقَ الاَلْسُنَ بِحَمْدِهِ وَجَعَلَ مَا امْتَنَّ بِهِ عَلى عِبادِهِ في كِفاء لِتَاْدِيَةِ حَقِّهِ (اَنالَ بِهِ حَقّه) صَلِّ عَلى مُحَمَّد وآلِهِ وَلا تَجْعَلْ لِلشَّيْطانِ عَلى عَقْلى سَبيلاً وَلا لِلْباطِلِ على عَمَلى دَليلاً فاذا طلع الفجر يوم الجمعة فليقل : اَصْبَحْتُ فى ذِمَّةِ اللهِ وَذِمَّةِ مَلائِكَتِهِ وَذِمَمِ اَنْبِيائِهِ وَرُسُلِهِ عَلَيهِمُ السَّلامُ وَذِمَّةِ مُحمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَذِمَمِ الاَوصياءِ مِنْ آلِ محَمَّد عَلَيْهِمُ السَّلامُ آمَنْتُ بِسِرّ آلِ مُحَمَّد عَلَيْهِمُ السَّلامُ وَعَلانِيَتِهِمْ وَظاهِرِهِمْ وَباطِنِهِمْ وَاَشْهَدُ اَنَّهُمْ فى عِلْمِ اللهِ وَطاعَتِهِ كَمُحَمَّد صَلَّى اللهُ عَلَيْهِ وآلِهِ.\n\n'
                      'وروي انّ مَنْ قال يوم الجمعة قبل صلاة الصّبح ثلاث مرّات : اَسْتَغْفِرُ اللهَ الَّذي لا اِلـهَ إلاّ هُوَ الْحَيُّ الْقَيُّومُ وَاَتُوبُ اِلَيْهِ غُفِرَتْ ذنوبه ولو كانت اكثر من زَبَد البحر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: A3malNaharAljom3a.screenRoute,
        pushBack: Salat2imamAlmahdi.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال ليلة الجمعة.mp3',
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
