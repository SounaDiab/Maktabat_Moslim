import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../sha3ban.dart';
import 'allayla_al2oula_sha3ban.dart';
import 'alyawm_alsalis_sha3ben.dart';

class AlyawmAl2awalSha3ban extends StatefulWidget {
  static String screenRoute = 'alyawm_al2awal_sha3ban_screen';
  const AlyawmAl2awalSha3ban({super.key});

  @override
  State<AlyawmAl2awalSha3ban> createState() => _AlyawmAl2awalSha3banState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl2awalSha3banState extends State<AlyawmAl2awalSha3ban> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_al2awal_sha3ban_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_al2awal_sha3ban_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Sha3ban.screenRoute);
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
                          'اليوم الأول', AlyawmAl2awalSha3ban.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الأول',
                          AlyawmAl2awalSha3ban.screenRoute,
                          AlyawmAl2awalSha3ban.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الأول',
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
                      'ويفضل صيامه فضلاً كثيراً وقد روى عن الصّادق (عليه السلام) انّ من صام اوّل يوم من شعبان وجبت له الجنّة البتّة، وقد روى السّيد ابن طاووس عن النّبي (صلى الله عليه وآله وسلم) اجراً جزيلاً لمن صام ثلاثة أيّام من هذا الشّهر يصلّي في لياليها ركعتين يقرأ في كلّ ركعة الحمد مرّة وسورة التّوحيد احدى عشرة مرّة، واعلم انّه قد ورد في تفسير الامام (عليه السلام) رواية في فضل شعبان وفضل اليوم الاوّل منه تشتمل على فوائد جمّة، وشيخنا ثقة الاسلام النّوري نوّر الله مرقده قد أورد ترجمتها في نهاية كتابه الفارسي (كلمه طيّبه) والرّواية مبسوطة لا يسعها المقام، وملخّصها انّ امير المؤمنين (عليه السلام) قد مرّ على قوم من أخلاط المسلمين وهُم قعود في بعض المساجد في أوّل يوم من شعبان، وهُم يخوضون في أمر القدر وغيره، قد ارتفعت أصواتهم واشتدّ فيه محكمهم وجدالهم، فوقف عليهم وسلّم فردّوا عليه وأوسعوا له وقاموا اليه يسألونه القعود عليهم، فلم يحفل بهم ثمّ قال لهم وناداهم : يا معاشر المتكلّمين فيما لا يعنيهم ولا يردّ عليهم، ألم تعلموا انّ لله عباداً قد أسكتهم خشية من غير عيّ ولا بكم، ولكنّهم اذا ذكروا عظمة الله انكسرت ألسنتهم وانقطعت أفئدتهم وطاشت عقولهم، وحامت حلومهم اعزازاً لله واعظاماً واجلالاً، فاذا أفاقوا من ذلك استبقوا الى الله بالاعمال الزّاكية، يعدّون أنفسهم مع الظّالمين والخاطئين وانّهم براء من المقصّرين ومن المفرطين، ألا انّهم لا يرضُون لله بالقليل، ولا يستكثرون لله الكثير، فهم يدأبون له في الاعمال، فهم اذا رأيتهم قائمون للعبادة مروعون خائفون مشفقون وجلون، فأين أنتم منهم يا معشر المبتدعين، أما علمتهم انّ أعلم النّاس بالقدر أسكتهم عنه، وانّ أجهلهم به اكثرهم كلاماً فيه، يا معشر المبتدعين هذا يوم غرّة شعبان الكريم سمّاه ربّنا شعبان لتشعّب الخيرات فيه، قد فتح ربّكم فيه أبواب جنانه، وعرض عليكم قصورها وخيراتها بأرخص الاثمان، وأسهل الامور ، فاشتروها، وعرض لكم ابليس اللّعين شعب شروره وبلاياه، فأنتم دائباً تتيهون في الغيّ والطّغيان، تمسكون بشعب ابليس وتحيدون عن شعب الخير المفتوح لكم أبوابه، هذه غرّة شعبان وشعب خيراته الصّلاة والزّكاة والامر بالمعروف والنّهي عن المنكر وبرّ الوالدين والقرابات والجيران واصلاح ذات البين والصّدقة على الفقراء والمساكين، تتكلّفون ما قد وُضِعَ عنكم (أي أمر القدر) وما قد نهيتم عن الخوض فيه من كشف سراير الله التي من فتش عنها كان من الهالكين، أما انّكم لو وقفتم على ما قد أعدّ ربّنا عزّوجل للمطيعين من عباده في هذا اليوم لقصّرتم عمّا أنتم فيه، وشرعتم فيما أمرتم به.\n\n'
                      'قالوا : يا أمير المؤمنين وما الذي أعدّه الله في هذا اليوم للمطيعين له ؟ فروى (عليه السلام) ما كان من أمر الجيش الذي بعثه رسول الله (صلى الله عليه وآله وسلم) الى الكفّار فوثب الكفّار عليه ليلاً وكانت ليلة ظلماء دامسة والمسلمون نيام ولم يك فيهم يقظان سوى زيد بن حارثة وعبد الله بن رواحة وقتادة بن نعمان وقيس بن عاصم المنقري وكلّ منهم يقظان في جانب من جوانب العسكر يصلّي الصّلاة أو يتلو القرآن، وكاد المسلمون أن يهلكوا لانّهم في الظّلام لا يبصرون أعداءهم ليتّقوهم، واذا بأضواء تسطع من أفواه هؤلاء النّفر الاربعة تضيء معسكر المسلمين فتورثهم القوّة والشّجاعة فوضعوا السّيوف على الكفّار فصاروا بين قتيل أو جريح أو أسير، فلمّا رجعوا قصّوا على النّبي (صلى الله عليه وآله وسلم) ما كان ، فقال (صلى الله عليه وآله وسلم) : انّ هذه الانوار قد كانت لما عمله اخوانكم هؤلاء من الاعمال في غرّة شعبان، ثمّ حدّثهم بتلك الاعمال واحداً فواحداً الى أن قال : انّ ابليس اذا كان اوّل يوم من شعبان يبث جنودُه في أقطار الارض وآفاقها يقول لهم اجتهدوا في اجتذاب بعض عباد الله اليكم في هذا اليوم، وانّ الله عزوجل يبث ملائكته في أقطار الارض وآفاقها ، يقول لهم : سدّدوا عبادي وارشدوهم وكلّهم يسعد الّا من أبى وطغى فانّه يصير في حزب ابليس وجنوده، وانّ الله عزوجل اذا كان اوّل يوم من شعبان يأمر باب الجنّة فتفتح، ويأمر شجرة طوبى فتدني أغصانها من هذه الدّنيا، فتعلّقوا بها لترفعكم الى الجنّة، وهذه أغصان شجرة الزّقوم فأيّاكم وايّاها لا تؤديكم الى الجحيم.\n\n'
                      'قال : فو الذي بعثني بالحقّ نبيّاً انّ من تعاطى باباً من الخير في هذا اليوم فقد تعلّق بغصن من أغصان شجرة طوبى فهو مؤدّيه الى الجنّة، وانّ من تعاطى باباً من الشرّ في هذا اليوم فقد تعلّق بغصن من أغصان شجرة الزّقّوم ، فهو مؤديّه الى النّار ، ثمّ قال رسول الله (صلى الله عليه وآله وسلم): فمن تطوّع لله بصلاة في هذا اليوم فقد تعلّق منه بغصن، ومن صام في هذا اليوم تعلّق منه بغصن، ومن أصلح بين المرء وزوجه، والوالد وولده، والقريب وقريبه، والجار وجاره، والاجنبيّ والاجنبيّ، فقد تعلّق بغصن منه، ومن خفّف عن معسر من دَينه، أو حطّ عنه فقد تعلّق منه بغص ن، ومن نظر في حسابه فرأى دَيناً عتيقاً قد أيس منه صاحبه فأدّاه فقد تعلّق منه بغصن، ومن كفل يتيماً فقد تعلّق منه بغصن، ومن كفّ سقيماً عن عِرض مؤمن فقد تعلّق منه بغصن، ومن تلا القُرآن أو شيئاً منه فقد تعلّق منه بغصن، ومن قعد يذكر الله ونعماءه ليشكره فقد تعلّق منه بغصن، ومن عاد مريضاً فقد تعلّق منه بغصن، ومن برّ فيه والديه أو أحدهما في هذا اليوم فقد تعلّق منه بغصن، ومن كان أسخطهما قبل هذا اليوم فأرضاهما في هذا اليوم فقد تعلّق منه بغُصن، وكذلك من فعل شيئاً من سائر أبواب الخير في هذا اليوم فقد تعلّق منه بغصن ، ثمّ قال رسول الله (صلى الله عليه وآله وسلم)والذي بعثني بالحقّ نبيّاً وانّ من تعاطى باباً من الشرّ والعصيان في هذا اليوم فقد تعلّق بغصن من أغصان الزّقوم فهو مؤدّيه الى النّار.\n\n'
                      'ثمّ قال رسول الله (صلى الله عليه وآله وسلم) والّذي بعثني بالحقّ نبيّاً فمن قصّر في الصّلاة المفروضة وضيّعها فقد تعلّق بغصن منه ومن جاءه في هذا اليوم فقير ضعيف يعرف سوء حاله فهو يقدر على تغيير حاله من غير ضرر يلحقه وليس هناك من ينوب عنه ويقوم مقامه، فتركه يضيع ويعطب، ولم يأخذ بيده فقد تعلّق بغصن منه، ومن اعتذر اليه مسيء فلم يعذره ثمّ لم يقتصر به على قدر عقوبة اساءته بل زاد عليه فقد تعلّق بغصن منه، ومن ضرب بين المرء وزوجه، أو الوالد وولده، أو الاخ وأخيه، أو القريب وقريبه، أو بين جارين، أو خليطين، أو اُختين فقد تعلّق بغصن منه، ومن شدّد على معسر وهو يعلم اعسـاره فزاد غيظاً وبلاءاً فقد تعلّق بغصن منه، ومن كان عليه دَين فأنكره على صاحبه وتعدّى عليه حتّى أبطل دينه فقد تعلّق بغصن منه، ومن جفا يتيماً وآذاه وهزم ماله فقد تعلّق بغصن منه، ومن وقع في عِرض أخيه المؤمن وحمل النّاس على ذلك فقد تعلّق بغصن منه، ومن تغنى بغناء يبعث فيه على المعاصي فقد تعلّق بغصن منه، ومن قعد يعدّد قبائح أفعاله في الحروب وأنواع ظُلمه لعباد الله فيفتخر بها فقد تعلّق بغصن منه، ومن كان جاره مريضاً فترك عيادته استخفافاً بحقّه فقد تعلّق بغصن منه، ومَن مات جاره فترك تشييع جنازته تهاوناً فقد تعلّق بغصن منه، ومن عقّ والديه أو احدهما فقد تعلّق بغصن منه، ومن كان قبل ذلك عاقاً لهما فلم يرضهما في هذا اليوم يقدر على ذلك فقد تعلّق بغصن منه، وكذا من فعل شيئاً من سائر أبواب الشرّ فقد تعلّق بغصن منه، والذي بعثني بالحقّ نبيّاً انّ المتعلّقين بأغصان شجرة طوبى ترفعهم تلك الاغصان الى الجنّة، ثمّ رفع رسول الله (صلى الله عليه وآله وسلم) طرفه الى السّماء مليّاً وجعل يضحك ويستبشر، ثمّ خفض طرفه الى الارض فجعل يقطب ويعبس، ثمّ أقبل على أصحابه فقال : والذي بعث محمّداً بالحقّ نبيّاً لقد رأيت شجرة طوبى ترفع أغصانها وترفع المتعلّقين بها الى الجنّة، ورأيت منهم من تعلّق منها بغصن ومنهم من تعلّق بغصنين أو بأغصان على حسب اشتمالهم على الطّاعات، وانّي لارى زيد بن حارثة فقد تعلّق بعامة أغصانها فهي ترفعه الى أعلى اعلاها فبذلك ضحكت واستبشرت ثمّ نظرت الى الارض فو الذي بعثني بالحقّ نبيّاً لقد رأيت شجرة الزقّوم تنخفض أغصانها وتخفض المتعلّقين بها الى الجحيم، ورأيت منهم من تعلّق بغصن ومنهم من تعلّق بغصنين أو بأغصان على حسب اشتمالهم على القبائح، وانّي لارى بعض المنافقين قد تعلّق بعامة أغصانها وهي تخفضه الى أسفل دركاتها، فلذلك عبست وقطبت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlsalisSha3ben.screenRoute,
        pushBack: AllaylaAl2oulaSha3ban.screenRoute,
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
