import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../adab_alziyarat.dart';
import 'fi_zikr_al2isted3a2.dart';

class FiAdabAlziyarat extends StatefulWidget {
  static String screenRoute = 'fi_adab_alziyarat_screen';
  const FiAdabAlziyarat({super.key});

  @override
  State<FiAdabAlziyarat> createState() => _FiAdabAlziyaratState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAdabAlziyaratState extends State<FiAdabAlziyarat> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_fi_adab_alziyarat_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_adab_alziyarat_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(AdabAlziyarat.screenRoute);
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
                          'في آداب الزيارة', FiAdabAlziyarat.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في آداب الزيارة',
                          FiAdabAlziyarat.screenRoute,
                          FiAdabAlziyarat.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في آداب الزيارة',
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
                  'وهي عديدة نقتصر منها على امور :',
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
                  subtitle: 'الغُسل قبل الخروج لسفر الزّيارة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'أن يتجنّب في الطّريق التكلّم باللّغو والخصام والجدال.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'أن يغتسل لزيارة الائمة (عليهم السلام) وأن يدعو بالمأثورة من دعواته، وستذكر في أوّل زيارة الوارث.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle: 'الطّهارة من الحدث الاكبر والاصغر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يلبس ثياباً طاهرة نظيفة جديدة ويحسن أن تكون بيضاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يقصر خطاه اذا خرج الى الرّوضة المقدّسة، وان يسير وعليه السّكينة والوقار، وأن يكون خاضعاً خاشعاً، وأن يطأطِيء رأسه فلا يلتفت الى الاعلى ولا الى جوانبه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابع :',
                  subtitle:
                      'أن يتطيّب بشيء من الطّيب فيما عدا زيارة الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن :',
                  subtitle:
                      'أن يشتغل لسانه وهو يمضي الى الحرم المطهّر بالتكبير والتّسبيح والتّهليل والتّمجيد، ويعطّر فاه بالصّلاة على محمّد وآله (عليهم السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التّاسع :',
                  subtitle:
                      'أن يقف على باب الحرم الشّريف ويستأذن ويجتهد لتحصيل الرّقّة والخضوع والانكسار والتفكير في عظمة صاحب ذلك المرقد المنوّر وجلاله، وانّه يرى مقامه ويسمع كلامه ويردّ سلامه كما يشهد على ذلك كلّه عندما يقرأ الاستئذان، والتّدبّر في لطفهم وحُبّهم لشيعتهم وزائريهم، والتّأمّل في فساد حال نفسه وفي جفائه عليهم برفضه ما لا يحصى من تعاليمهم، وفيما صدر عنه نفسه من الاذى لهم أو لخاصّتهم وأحبابهم وهو في المال اذىً راجع اليهم (عليهم السلام) فلو التفت الى نفسه التفات تفكير وتدقيق لتوقّفت قدماه عن المسير وخشع قلبه ودمعت عينه، وهذا هو لُبّ آداب الزّيارة كلّها، وينبغي لنا هُنا أن نورد أبيات السّخاوي والحديث الّذي رواه العلاّمة المجلسي (رحمه الله) في البحار نقلاً عن كتاب عيون المعجزات، امّا أبيات السّخاوي وهي ما ينبغي أن يتمثّل به في تلك الحالة فهي :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'قالُوا غَدًا نَأْتي دِيارَ الْحِمى   وَيَنْزِلُ الرَّكْبُ بِمَغْناهُمُ\n\n'
                      'فَكُلُّ مَنْ كانَ مُطيعاً لَهُمْ   اَصْبَحَ مَسْرُوراً بِلُقْياهُمُ\n\n'
                      'قُلْتُ فَلي ذَنْبٌ فَما حيلَتي   بَاَيّ وَجْه اَتَلَقّاهُمُ\n\n'
                      'قالُوا اَلَيْسَ الْعَفْوُ مِنْ شَاْنِهِمْ   لا سِيَّما عَمَّنْ تَرَجّاهُمُ\n\n'
                      'فَجِئْتُهُم اَسْعى اِلى بابِهِمْ   اَرْجُوهُمُ طَوْراً وَاَخْشاهُمُ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وأمّا الرّواية الشريفة فهي انّه استأذن ابراهيم الجمّال وكان من الشّيعة على عليّ بن يقطين وهو وزير هارون الرّشيد، فحجبه لانّه جمّال، فحجّ عليّ بن يقطين في تلك السّنة فاستأذن بالمدينة على موسى بن جعفر (عليه السلام) فحجبه فرآه ثاني يومه خارج الدّار ، فقال عليّ بن يقطين : يا سيّدي ما ذنبي ؟ فقال : حجبتك لانّك حجبت أخاك ابراهيم الجمّال وقد أبى الله أن يشكر سعيك أو يغفر لك ابراهيم الجمّال ، قال عليّ : فقلت يا سيّدي ومولاي من لي بابراهيم الجمّال في هذا الوقت وأنا بالمدينة وهو بالكوفة ؟ فقال : اذا كان الليل فامض الى البقيع وحدك من غير أن يعلم بك أحد من أصحابك وغلمانك، وتجد نجيباً هناك مسرّجاً فاركبه وامض الى الكوفة ، فوافى البقيع وركب النّجيب ولم يلبث أن أناخه على باب ابراهيم الجمّال بالكوفة (في مدّة قصيرة) فقرع الباب وقال : أنا عليّ بن يقطين ، فقال ابراهيم الجمّال من داخل الدّار : وما يعمل عليّ بن يقطين الوزير ببابي ، فقال عليّ بن يقطين : ما هذا انّ أمري عظيم وآلى عليه أن يأذن له، فلمّا دخل قال : يا ابراهيم انّ المولى (عليه السلام) أبى أن يقبلني أو تغفر لي ، فقال : يغفر الله لك، فآلى عليّ بن يقطين على ابراهيم الجمّال أن يطأ خدّه، فامتنع ابراهيم من ذلك، فآلى عليه ثانياً ففعل فلم يزل ابراهيم يطأ خدّه وعليّ بن يقطين يقول : اَللّـهُمَّ اشْهَدْ، ثمّ انصرف وركب النّجيب ورجع الى المدينة من ليلته وأناخه بباب المولى موسى بن جعفر (عليه السلام) فأذن له ودخل عليه فقبله.\n\n'
                      'من هذا الحديث يعرف مبلغ حقوق الاخوان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'تقبيل العتبة العالية المباركة ، قال الشّيخ الشّهيد (رحمه الله): ولو سجد الزّائر ونوى بالسّجدة الشكر لله تعالى على بلوغه تلك البقعة كان أولى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي عشر :',
                  subtitle:
                      'أن يقدّم للدّخول رجله اليمنى ويقدّم للخروج رجله اليُسرى كما يصنع عند دخُول المساجد والخروج منها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني عشر :',
                  subtitle:
                      'أن يقف على الضّريح بحيث يمكنه الالتصاق به، وتوهّم انّ البعد أدب وهم، فقد نص على الاتّكاء على الضّريح وتقبيله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث عشر :',
                  subtitle:
                      'أن يقف للزّيارة مستقبلاً القبر مُستدبِراً القبلة وهذا الادب ممّا يخصّ زيارة المعصوم على الظّاهر، فاذا فرغ من الزّيارة فليضع خدّه الايمن على الضّريح ويدعو الله بتضرّع ثمّ ليضع الخدّ الايسر ويدعو الله بحقّ صاحب القبر أن يجعله من أهل شفاعته ويبالغ في الدّعاء والالحاح ثمّ يمضي الى جانب الرّأس فيقف مُستقبل القبلة فيدعو الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع عشر :',
                  subtitle:
                      'أن يزُور وهُو قائم على قَدَميه الّا اذا كان له عُذر منْ ضعف أو وجع في الظّهر أو في الرّجل أو غير ذلك من الاعذار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس عشر :',
                  subtitle:
                      'أن يكبّر اذا شاهد القبر المطهّر قبل الشّروع في الزّيارة، وفي رواية انّ من كبّر امام الامام (عليه السلام) وقال : لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ كتب له رضوان الله الاكبر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس عشر :',
                  subtitle:
                      'أن يزُور بالزّيارات المأثورة المرويّة عن سادات الانام (عليهم السلام) ويترك الزّيارات المخترعة التي لفقها بعض الاغبياء من عوام النّاس الى بعض الزّيارات فأشغل بها الجهّال.\n\n'
                      'روى الكليني (رحمه الله) عن عبد الرّحيم القصير ، قال : دخلت على الصّادق (عليه السلام) فقلت : جعلت فداك قد اخترعت دعاءاً من نفسي ، فقال (عليه السلام) : دعني عن اختراعك اذا عرضتك حاجة فلذ برسول الله (صلى الله عليه وآله وسلم) وصلّ ركعتين واهدهما اليه الخ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابع عشر :',
                  subtitle:
                      'أن يصلّي صلاة الزّيارة وأقلّها ركعتان ، قال الشّيخ الشّهيد : فان كان الزّيارة للنّبي (صلى الله عليه وآله وسلم)فليصلّ الصّلاة في الرّوضة، وإن كانت لاحد الائمة فعند الرّأس، ولو صلاها بمسجد المكان أي مسجد الحرم جاز، وقال العلامة المجلسي (رحمه الله) : انّ صلاة الزّيارة وغيرها فيما أرى يفضل أن تؤتى خلف القبر أو عند الرّأس الشّريف، وقال أيضاً العلامة بحر العلوم في الدرّة :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'وَمِنْ حَديثِ كَرْبَلا وَالْكَعْبَةْ   لِكَرْبَلا بانَ عُلُوُّ الرُّتْبَةْ\n\n'
                      'وَغَيْرُها مِنْ سائِرِ الْمَشاهِدِ   اَمْثالُها بِالنَّقْلِ ذِي الشّواهِدِ\n\n'
                      'وَراعِ فيهِنَّ اقْتِرابَ الرَّمْسِ   وَآثِرِ الصَّلاةَ عِنْدَ الرَّأسِ\n\n'
                      'وَصَلِّ خَلْفَ الْقَبْرِ فَالصَّحيحُ   كَغَيْرِهِ في نَدْبِها صَريحُ\n\n'
                      'وَالْفَرْقُ بَيْنَ هذِهِ الْقُبُورِ   وَغَيْرِها كَالنُّورِ فَوْقَ الطُّورِ\n\n'
                      'فَالسَّعْيُ لِلصَّلاةِ عِنْدَها نُدِبْ   وَقُرْبُها بَلِ اللُّصُوقُ قَدْ طُلِبْ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن عشر :',
                  subtitle:
                      'تلاوة سورة يس في الرّكعة الاولى وسورة الرّحمن في الثّانية ان لم تكن صلاة الزّيارة التي يصلّيها مأثورة على صفة خاصّة، وان يدعو بعدها بالمأثور أو بما سنح له في امور دينه ودُنياه، وليعمّم الدّعاء فانّه أقرب الى الاجابة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التّاسع عشر :',
                  subtitle:
                      'قال الشّهيد (رحمه الله) : ومن دخل المشهد والامام يصلّي بدأ بالصّلاة قبل الزّيارة وكذلك لو كان قد حضر وقتها والّا فالبدء بالزّيارة أولى لانّها غاية مقصده، ولو أقيمت الصّلاة استحبّ للزّائرين قطع الزّيارة والاقبال على الصّلاة ويكره تركه، وعلى ناظر الحرم أمرهم بذلك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العشرون :',
                  subtitle:
                      'عدّ الشّهيد (رحمه الله) من آداب الزّيارة تلاوة شيء من القرآن عند الضّريح واهداؤه الى المزور والمنتفع بذلك الزّائر وفيه تعظيم للمزور.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي والعشرون :',
                  subtitle:
                      'ترك اللّغو وما لا ينبغي من الكلام وترك الاشتغال بالتكلّم في امور الدّنيا فهو مذموم قبيح في كلّ زمان ومكان، وهو مانع للرّزق ومجلبة للقساوة لا سيّما في هذه البقاع الطّاهرة والقُباب السّامية التي أخبر الله تعالى بجلالها وعظمتها في سورة نور (في بُيُوت اَذِنَ اللهُ اَنْ تُرْفَعَ) الاية.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني والعشرون :',
                  subtitle:
                      'والعشرون : أن لا يرفع صوته بما يزور به كما نبّهت عليه في كتاب هديّة الزّائر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث والعشرون :',
                  subtitle:
                      'أن يودّع الامام (عليه السلام) بالمأثور أو بغيره اذا أراد الخروج من البلد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع والعشرون :',
                  subtitle:
                      'أن يتوب الى الله ويستغفر من ذنوبه، وأن يجعل أعماله وأقواله بعد الزّيارة خيراً منها قبلها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس والعشرون :',
                  subtitle:
                      'الانفاق على سدنة المشهد الشّريف، وينبغي لهؤلاء أن يكونوا من أهل الخير والصّلاح والدّين والمروّة، وأن يحتملوا ما يصدر من الزّوار فلا يصبوا سخطهم عليهم ولا يحتدموا عليهم، قائمين بحوائج المحتاجين، مُرشدين للغُرباء اذا ضلّوا، وبالاجمال فالخدم ينبغي أن يكونوا خداماً قائمين بما لزم من تنظيف البُقعة الشّريفة وحراستها ومُحافظة الزّائرين وغير ذلك من الخدمات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس والعشرون :',
                  subtitle:
                      'الانفاق على المجاورين لتلك البُقعة من الفقراء والمساكين المتعفّفين والاحسان اليهم لا سيّما السّادة وأهل العلم المنقطعين الذين يعيشُون في غُربة وضيق وهم يرفعون لواء ا لتّعظيم لشعائر الله وقد اجتمعت فيهم جهات عديدة تكفي احداها لفرض اعانتهم ورعايتهم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابع والعشرون :',
                  subtitle:
                      'قال الشّهيد: انّ من جُملة الاداب تعجيل الخُروج عند قضاء الوطر من الزّيارة لتعظم الحُرمة وليشتد الشّوق، وقال أيضاً: والنّساء اذا زُرن فليكنّ منفردات عن الرّجال والاولى أن يزرن ليلاً وليكنّ متنكّرات أي يبدلن الثّياب النّفيسة بالدّانية الرّخيصة لكي لا يعرفن وليبرزن متخفّيات متستّرات ولو زرن بين الرّجال جاز وإن كره.\n\n'
                      'أقول : من هذه الكلمة تُعرف مبلغ القُبح والشّناعة في ما دأبت عَليه النّسوة في زماننا من أن يتبرّجن للزّيارة فيبرزن بنفايس الثّياب فيزاحمن الاجانب من الرّجال في الحرم الطّاهر ويضاغطنهم بأبدانهنّ مقتربات من الضّرائح الطّاهرة أو يجلسن في قبلة المُصلّين من الرّجال ليقرأن الزّيارة فيلفتن الخواطر ويصدّن القائمين بالعبادة في تلك البُقعة الشّريفة من المصلّين والمتضرّعين والباكين عن عبادتهم، فيكنّ '
                      'بذلك من الصّادات عن سبيل الله الى غير ذلك من التّبعات وأمثال هذه الزّيارات ينبغي حقّاً أن تعدّ من منكرات الشّرع لا من العبادات، وتحصى من المُوبقات لا القربات ، وقد روي عن الصّادق (عليه السلام) انّ أمير المؤمنين (عليه السلام) قال لاهل العراق : يا أهل العراق نُبّئتُ انّ نِساءكُم يوافينَ الرّجال في الطّريق أما تستحيون؟ وقال : لعن الله من لا يغار.\n\n'
                      'وفي الفقيه روى الاصبغ بن نباتة عن امير المؤمنين (عليه السلام) قال : سمعته يقول : يظهر في آخر الزّمان واقتراب السّاعة وهو شرّ الازمنة نسوة كاشِفات عاريات متبرّجات، من الدّين خارجات، داخلات في الفِتن، مائلات الى الشّهوات، مسرعات الى اللّذات، مستحلاّت المحرّمات، في جهنّم خالدات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن والعشرون :',
                  subtitle:
                      'ينبغي عند ازدحام الزّائرين للسّابقين الى الضّريح أن يخفّفوا زيارتهم وينصرفوا ليفُوز غيرهم بالدّنوّ من الضّريح الطّاهر كما كانوا هم من الفائزين.\n\n'
                      'أقول لزيارة الحسين صلوات الله عليه آداب خاصّة سنذكرها في مقام ذكر زيارته (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: FiZikrAl2isted3a2.screenRoute,
        pushBack: FiZikrAl2isted3a2.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في اداب الزيارات.mp3',
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
