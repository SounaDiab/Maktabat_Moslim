import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'ziyarat_alna7iya_almokadasa.dart';
import 'ziyarat_alsayida_zainab.dart';

class SalatJa3farAltayar extends StatefulWidget {
  static String screenRoute = 'salat_ja3far_altayar_screen';
  const SalatJa3farAltayar({super.key});

  @override
  State<SalatJa3farAltayar> createState() => _SalatJa3farAltayarState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatJa3farAltayarState extends State<SalatJa3farAltayar> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_ja3far_altayar_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_ja3far_altayar_screen', value);
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
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
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
                      .addFavorite('صلاة جعفر الطيار عليه السلام',
                          SalatJa3farAltayar.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة جعفر الطيار عليه السلام',
                          SalatJa3farAltayar.screenRoute,
                          SalatJa3farAltayar.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة جعفر الطيار عليه السلام',
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
                      'من الموارد الموثقة و المضمونة لغفران الذنوب صغيرها و كبيرها و قضاء الحوائج بأجمعها هذه الصلاة التي نحلها رسول الله الأعظم عليه و آله و سلم و التي يقول عنها الشيخ عباس القمي في مفاتيح الجنان.\n\n'
                      'وهي الاكسير الاعظم والكبريت الاحمر وهي مرويّة بما لها من الفضل العظيم باسناد معتبرة غاية الاعتبار واهمّ ما لها من الفضل غفران الذّنوب العظام وأفضل أوقاتها صدر النّهار يوم الجمعة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'كيفية وفضيلة و أحكام صلاة جعفر الطيار :',
                  subtitle:
                      'اعلم أن هذه الصلاة من المتواترات , و رواها العامة و الخاصة بأسانيد كثيرة , ويرى المخالفون استحبابها أيضاً إلا النادر منهم أما أكثرهم فينسب هذه الصلاة إلى العباس عم النبي بسبب العداوة الباطنية التي يكنونها تجاه الإمام أمير المؤمنين عليه السلام و أقاربه . و لا توجد بعد النوافل اليومية صلاة كهذه الصلاة من حيث صحة السند و كثير الثواب.\n\n'
                      'وروى بسند معتبر عن الإمام زين العابدين عليه السلام أنه عندما رجع جعفر الطيار أخو أمير المؤمنين عليه السلام من هجر الحبشة كان وصوله في يوم فتح خيبر بيد أمير المؤمنين عليه السلام فتلقاه رسول الله صل الله عليه و آله وسلم على غلوة من معرسه بخيبر , فلما رآه جعفر أسرع إليه هرولة فاعتنقه رسول الله صل الله عليه و آله وسلم وحادثه شيئاً ثم ركب العضباء و أردفه , فلما انبعثت بهما الراحلة أقبل عليه فقال : ياجعفر يا أخ ألا أحبوك ؟ ألا أعطيك ؟ ألا أصطفيك ؟ قال : فظن الناس أنه يعطي جعفراً عظيماً من المال , قال : وذلك '
                      'لما فتح الله على نبيه خبير و غنًمه أرضهاً و أموالها و أهلها , فقال جعفر : بلى فداك أبي و أمي . فعلًمه صلّ الله عليه و آله و سلم صلاة التسبيح , وقال الإمام الصادق عليه السلام أن صفة هذه الصلاة أربع ركعات بتشهدين و تسليمين , يُقرأ في الركعة الأولى بعد الحمد , سورة {إذا زلزلت } وفي الثانية بعد الحمد سورة { والعادات } , وفي الثالثة بعد الحمد سورة { إذا جاء نصر الله } وفي الركعة الرابعة بعد الحمد سورة { قل هو الله أحد } .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ويقول في كل ركعة بعد الفراغ من القراءة قبل الركوع :',
                  subtitle:
                      'سُبْحَانَ وَ الْحَمْدُ للهِ وَلا إِلهَ إِلا اللهُ وَ اللهُ أَكْبَرٌ.\n\n'
                      'خمس عشرة مرة , يعيدها نفسها في الركوع عشر مرات , وبعد رفع الرأس من الركوع أي قبل الهوي : عشر مرات , و في السجدة الأولى عشر مرات , و بعد السجدة الأولى عشر مرات , و في السجدة الثانية عشر مرات , وبعد أن يرفع رأسه و قبل أن يقوم ثانية عشر مرات , يفعل ذلك في كل ركعة من الركعات الأربع ثلاثمائة مرة , فيكون المجموع ألفاً و مائتي تسبيحة.\n\n'
                      'وفي رواية معتبرة أُخرى أن رسول الله صلّ الله عليه و آله وسلم قال : لو تأتي بهذه الصلاة كل يوم فهو أفضل لك من الدنيا و ما فيها , ولو فعلت ذلك في كل يوم مرة غُفرت لك ذنوبك التي فعلتها ما بين الصلاتين . و إذا أديتها كل جمعة أو في كل شهر أو في السنة مرة فإن الذنوب التي عملتها ما بين الصلاتين تٌغفر لك و في رواية معتبرة أخرى : و إن كانت بقدر زبد البحار و رمال الصحراء فإن الله تعالى يغفرها لك , بل '
                      'حتى لو كنت وليت من الزحف وهو أسوأ الذنوب فإن الله تعالى يغفر لك . وفي رواية أخرى : إن استطعت فأدها كل يوم , و إن لم تستطع ففي كل أسبوع مرة , فإن لم تستطع ففي الشهر مرة فإن لم تستطع ففي السنة مرة , فإن لم تستطع ففي العمر مرة واحدة ليغفر الله لك الصغائر و الكبائر من ذنوبك , و جديدها و قديمها , و عمدها و خطئها و أما الدعاء المستحب لهذه الصلاة.\n\n'
                      '',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'فروي الكليني بسند معتبر عن الإمام الصادق عليه السلام أنه تقول في السجدة الأخيرة من صلاة جعفر بعد أن تكون قد فرغت من التسبيحات :',
                  subtitle:
                      'سُبْحانَ مَنْ لَبِسَ الْعِزَّ وَالْوَقارَ سُبْحانَ مَنْ تَعَطَّفَ بِالْمَجْدِ وَتَكَرَّمَ بِهِ سُبْحانَ مَنْ لا يَنْبَغِي التَّسْبيحُ إلاّ لَهُ سُبْحانَ مَنْ اَحْصى كُلِّ شَىْء عِلْمُهُ سُبْحانَ ذِي الْمَنِّ وَالنِّعَمِ سُبْحانَ ذِي الْقُدْرَةِ وَالْكَرَمِ اَللّـهُمَّ اِنّي أَسْأَلُكَ بِمَعاقِدِ الْعِزِّ مِنْ عَرْشِكَ وَمُنْتَهَى الرَّحْمَةِ مِنْ كِتابِكَ وَاسْمِكَ الاْعْظَمِ وَكَلِماتِكَ التّامَّةِ الَّتى تَمَّتْ صِدْقاً وَعَدْلاً صَلِّ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ . ثم تطلب حاجتك.\n\n'
                      'وروي الشيخ في المصباح هذا الدعاء مع هذه الزيادة : سبحان ذي القدرة و الكرم سبحان ذي العزة و الفضل سبحان ذي القوة و الطول اللهم إني أسألك …. إلى آخر الدعاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'و أيضاً روى الشيخ و السيد عن مفضل بن عمر أنه قال : رأيت الإمام الصادق عليه السلام يوماً يؤدي صلاة جعفر ثم قرأ هذا الدعاء :',
                  subtitle:
                      'يا رب يا رب يا رب حتى ينقطع النفس , يا رباه يا رباه يا رباه حتى ينقطع النفس , رب رب يا رب كذلك حتى ينقطع النفس , يا الله يا الله يا الله كذلك حتى ينقطع النفس , يا رحيم يا رحيم يا رحيم حتى ينقطع النفس , يارحمن يا رحمن يا رحمن سبعاً , يا أرحم الراحمين سبعاً , ثم قرأ هذا الدعاء :\n\n'
                      'اَللّـهُمَّ اِنّي اَفْتَتِحُ الْقَوْلَ بِحَمْدِكَ وَاَنْطِقُ بِالثَّناءِ عَلَيْكَ وَاُمَجِّدُكَ وَلاغايَةَ لِمَدْحِكَ وَاُثْني عَلَيْكَ وَمَنْ يَبْلُغُ غايَةَ ثَنائِكَ وَاَمَدَ مَجْدِكَ وَاَنّى لِخَليقَتِكَ كُنْهُ مَعْرِفَةِ مَجْدِكَ وَاَيَّ زَمَن لَمْ تَكُنْ مَمْدُوحاً بِفَضْلِكَ مَوْصُوفاً بِمَجْدِكَ عَوّاداً عَلَى الْمُذْنِبينَ بِحِلْمِكَ تَخَلَّفَ سُكّانُ اَرْضِكَ عَنْ طاعَتِكَ فَكُنْتَ عَلَيْهِمْ عَطُوفاً بِجُودِكَ جَواداً بِفَضْلِكَ عَوّاداً بِكَرَمِكَ يا لا اِلـهَ إلاّ اَنْتَ الْمَنّانُ ذُوالْجَلالِ وَالاْكْرامِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'ثم قال عليه السلام : يا مفضل كلما كانت عندك حاجة ضرورية , صلّ صلاة جعفر و أقرأ هذا الدعاء و أطلب حوائجك من الله تعالى فإنها تقضى إن شاء الله تعالى.',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'دعاء آخر بعد هذه الصلاة برواية الشيخ و السيد رحمهما الله :',
                  subtitle:
                      'سبحان من لبس العز وتردى به ، سبحان من تعطف بالمجد وتكرم به ، سبحان من لا ينبغى التسبيح الا له ،جل جلاله ، سبحان من احصى كل شىء بعلمه ، وخلقه بقدرته ، سبحان ذى المن والنعم ،سبحان ذى القدرة والكرم .. اللهم انى اسئلك بمعاقد العز من عرشك ، ومنتهى الرحمة من كتابك ، وباسمك الاعظم ، وكلماتك التامات التى تمت صدقا وعدلا اللهم أنت الحي القيوم العلي العظيم الخالق الرازق المحيي المميت البدئ البديع، لك الكرم ولك المجد ولك المن ولك الجود ولك الامر، وحدك لا شريك لك، يا واحد يا أحد يا صمد، يا من لم يلد ولم يولد ولم يكن له كفوا أحد، يا أهل التقوى وأهل المغفرة يا أرحم الراحمين، يا عفو يا غفور يا ودود يا شكور أنت أبر بي من أبي وأمي، وأرحم بي من نفسي ومن الناس أجمعين ،يا كريم يا جواد .. اللهم انى صليت هذه الصلوة ابتغاء مرضاتك ، وطلب نائلك ومعروفك ،ورجاء رفدك '
                      'وجائزتك ، وعظيم عفوك وقديم غفرانك ..اللهم فصل على محمد وال محمد ، وارفعها في عليين ،وتقبلها منى ، واجعل نائلك ومعروفك ورجاء ما ارجو منك ،فكاك رقبتى من النار ، والفوز بالجنة ، وما جمعتَ من انواع النعيم ، ومن حسن الحور العين ، واجعل جائزتى منك العتق من النار، وغفران ذنوبى وذنوب والدي، وما ولدا ،وجميع اخوانى واخواتى المؤمنين والمؤمنات ، والمسلمين والمسلمات ، الاحياء منهم والاموات ، وان تستجيب دعائى ، وترحم صرختى وندائى ، ولا تردنى خائبا خاسرا ،واقلبنى مفلحا منجحا مرحوما ، مستجابا دعائى ، مغفورا لي يا ارحم الراحمين ..يا عظيم يا عظيم يا عظيم ، قد عظم الذنب من عبدك فليحسن العفو منك ،يا حسن التجاوز ، يا واسع المغفرة ، يا باسط اليدين بالرحمة ، يا نفاحا بالخيرات ، يا معطى المسئولات ، يا فكاك الرقاب من النار ، صل على محمد وال محمد وفك رقبتى من النار ،واعطني سؤلى واستجب دعائي ، وارحم صرختي وتضرعي وندائي ، '
                      'واقض لي حوائجي كلها لدنياي واخرتي وديني ، ما ذكرت منها وما لم اذكر ، واجعل لي فى ذلك الخيرة ، ولا تردني خائبا خاسرا ، واقلبني مفلحا منجحا ، مستجابا لي دعائي ، مغفورا لى مرحوما ، يا ارحم الراحمين .. يا محمد يا اباالقاسم يا رسول الله ، يا امير المؤمنين ، انا عبدكما ومولاكما ،غير مستنكف ولا مستكبر ، بل خاضع ذليل ، عبد مقر ، متمسك بحبلكما ، معتصم من ذنوبي بولا يتكما ، اتقرب الى الله تعالى بكما واتوسل الى الله بكما ،واقدمكما بين يدى حوائجي الى الله عز وجل ، فاشفعا لي فى فكاك رقبتي من النار،وغفران ذنوبي ، واجابة دعائي .. اللهم فصل على محمد واله ، وتقبل دعائي ،واغفر لى يا ارحم الراحمين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'أما أحكام هذه الصلاة فنوردها في عدة مقاصد :',
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
                      'اعلم أن المشهور بين العلماء و الأقوى أن صلاة جعفر يمكن القيام بها بدلاً من النوافل اليومية يحسب له أجر كليهما . و كذلك يمكن أن ينوي بها قضاء النافلة , و قد وردت الأحاديث بهذا المضمون . و جوّز بعض أداء و قضاء صلاة الفريضة بكيفية صلاة جعفر , ولا يخلو من قوة , ولكن الأحوط الترك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'وردت الروايات و قال أكثرالعلماء أن من كانت عنده ضرورة و عجلة يمكنه أن يصلي صلاة جعفر من دون التسبيحات ثم يقرأ التسبيحات بعد ذلك في الطريق.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'ورد الحديث الصحيح أن من صلى ركعتين من صلاة جعفر و حصل له أمر ضروري , يمكنه الذهاب إلى ذلك الأمر ثم يأتي بالركعتين الأخريين في وقت آخر , و إذا لم يفعل ذلك من دون عذر , و يصلي الأربع ركعات معاً فهو أفضل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'وردت رواية عن الإمام القائم (عج) أن من نسى تسبيحات صلاة جعفر في أحد المواضع المذكورة أمكنه قراءتها حيثما ذكر ,و لم يتعرض أحد من العلماء لهذا الحكم , فلو عُمل بهذه الرواية فالظاهر أنه لا بأس.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'ثمة خلاف في تعيين السور المستحبة التي تُقرأ في هذه الصلاة , و المشهور هو أن يقرأ في الأولى : الزلزلة , و في الثانية والعاديات , و في الثالثة : إذا جاء نصر الله و الفتح , و في الرابعة : التوحيد.\n\n'
                      'وقال ابن بابوية و أبوه : في الأولى : { و العاديات } , و في الثانية : { إذا زلزلت }وفي رواية : في الأولى : { إذا زلزلت } و في الثانية {إذا جاء } وفي الثالة :{ إنا أنزلناه } , وفي الرابعة : { قل هو الله أحد } . و ورد في رواية صحيحة أنه يقرأ في كل ركعة سورة { قل يا أيها الكافرون } و { قل هو الله أحد } كلتيهما . وورد في رواية أخرى : أنه يقرأ ما شاء . و قال ابن بابوية : إنه يمكن الإتيان بها كلها بسورة التوحيد , و الظاهر أنه أحسن , و إن كان في الأول و الثالث أفضل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'المشهور أنه يقرأ التسبيحات بعد السجدة الثانية من الركعة الأولى و الثالثة جالساً , و قال بعض : يقرأ بعد النهوض للركعة الأخرى قبل القراءة , و العمل بالمشهور أولى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'قال بعض : إنه يؤدي الركعات الأربع بسلام واحد , و المشهور و الأقوى أنه بسلامين أولى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'المشهور بين العلماء أن تسبيحات هذه الصلاة التي تقرأ قبل الركوع ينبغي أن تقرأ بعد القراءة ( أي قراءة الحمد و السورة ) وقال ابن بابويه وفقاً لبعض الروايات أنه مخير بين أن يقرأها قبل القراءة أو بعدها . و العمل بالمشهور أقوى و أولى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAlsayidaZainab.screenRoute,
          pushBack: ZiyaratAlna7iyaAlmokadasa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الصلاة على جعفر الطيار.mp3',
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
