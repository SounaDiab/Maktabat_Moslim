import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/list_of_nine_verses.dart';
import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'a3mal_allayla_latasi3a_3ashar.dart';
import 'dou3a2_2alhazin.dart';

class Hadis2alkisa2 extends StatefulWidget {
  static String screenRoute = 'hadis_2alkisa2_screen';
  const Hadis2alkisa2({super.key});

  @override
  State<Hadis2alkisa2> createState() => _Hadis2alkisa2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Hadis2alkisa2State extends State<Hadis2alkisa2> {
  bool isIcon = true;
  String music = '';
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_hadis_2alkisa2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_hadis_2alkisa2_screen', value);
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
                      .addFavorite('حديث الكساء', Hadis2alkisa2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('حديث الكساء', Hadis2alkisa2.screenRoute,
                          Hadis2alkisa2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حديث الكساء',
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
                      'عن جابر بن عبد الله الأنصاري عن فاطمة الزهراء عليها السلام بنت رسول الله صلى الله عليه وآله، قال: سمعت فاطمة أنها قالت: دخل عليّ أبي رسول الله صلى الله عليه وآله في بعض الأيام، فقال السلام عليك يافاطمة فقلت عليك السلام، قال أنّي أجد في بدني ضعفاً، فقلت له أعيذك بالله يآبتاه من الضعف، فقال يا فاطمة آتيني بالكساء اليماني فغطيني به، فآتيتته بالكساء اليماني فغطيته به، وصرت أنظر إليه وإذا وجهه يتلألأ كأنه البدر في ليلة تمامه، وكماله.\n\n'
                      'فما كانت إلا ساعةً وإذا بولدي الحسن قد أقبل، وقال السلام عليكِ يا أماه، فقلت وعليك السلام يا قرة عيني وثمرة فؤادي، فقال يا أماه أني أشم عندك رائحةً طيبةً كأنها رائحة جدي رسول الله فقلت نعم إن جدك تحت الكساء، فأقبل الحسن نحو الكساء، وقال: السلام عليك يا جداه يا رسول الله، آتأذن لي أن أدخل معك تحت الكساء، فقال: وعليك السلام يا ولدي ويا صاحب حوضي، قد أذنت لك، فدخل معه تحت الكساء.\n\n'
                      'فما كانت إلا ساعةً وإذا بولدي الحسين قد أقبل ، وقال السلام عليكِ يا أماه ، فقلت وعليك السلام ياولدي ويا قرة عيني وثمرة فؤادي، فقال لي يا أماه إني أشم عندك رائحة طيبة كأنها رائحة جدي رسول الله صلى الله عليه وآله، فقلت نعم إن جدك وآخاك تحت الكساء، فدنى الحسين نحو الكساء، وقال السلام عليك يا جداه، السلام عليك يامن إختاره الله،، آتأذن لي أن أكون معكما تحت الكساء، فقال وعليك السلام يا ولدي ويا شافع أمتي قد أذنت لك، فدخل معهما تحت الكساء.\n\n'
                      'فأقبل عند ذلك أبو الحسن علي بن أبي طالب عليه السلام وقال السلام عليكِ يابنت رسول الله، فقلت وعليك السلام يا أبا الحسن ويا أمير المؤمنين ، فقال يا فاطمة أني أشم عندك رائحة طيبة كأنها رائحة أخي وابن عمي رسول الله، فقلت نعم ها هو مع ولديك تحت الكساء، فأقبل عليٌ نحو الكساء، وقال السلام عليك يا رسول الله ، أتأذن لي أن أكون معكم تحت الكساء، قال له وعليك السلام يا أخي ويا وصيي وخليفتي وصاحب لوائي قد أذنت لك فدخل عليٌ تحت الكساء.\n\n'
                      'ثم أتيت نحو الكساء وقلت السلام عليك يا أبتاه يا رسول الله، أتأذن لي أن أكون معكم تحت الكساء، قال وعليكِ السلام يابنتي ويابضعتي قد أذنت لكِ فدخلت تحت الكساء، فلما اكتملنا جميعا تحت الكساء أخذ أبي رسل الله بطرفي الكساء وأمئ بيده اليمنى إلى السماء، وقال :\n\n'
                      '” اللهم إن هؤلاء أهل بيتي وخاصتي وحامتي لحمهم لحمي* ودمهم دمي* يؤلمني مايؤلمهم* ويحزنني ما يحزنهم * أنا حرب لمن حاربهم * وسلم لمن سالمهم * وعدوٌ لمن عاداهم * ومحب لمن أحبهم * إنهم مني وأنا منهم* فاجعل صلواتك وبركاتك ورحمتك وغفرانك ورضوانك عليَّ وعليهم واذهب عنهم الرجس وطهرهم تطهيرا “\n\n'
                      'فقال الله عز وجل يا ملائكتي ويا سكان سمواتي إني ماخلقت سماءً مبنية ولا أرضاً مدحيةً ولاقمراً منيراً ولا شمساً مضيئةً ولا فلكاً يدور ولا بحراً يجري ولا فلكاً يسري إلا لمحبة هؤلاء الخمسة الذين هم تحت الكساء،، فقال الأمين جبرائيل ياربِ ومن تحت الكساء ؟؟ ،، فقال عز وجل هم أهل بيت النبوة،، ومعدن الرسالة،، هم فاطمة وأبوها وبعلها وبنوها،، فقال جبرائيل ياربِ أتأذن لي أن أهبط إلى الأرض لأكون معهم سادساً،، فقال الله نهم قد أذنت لك.\n\n'
                      'فهبط الأمين جبرائيل قال السلام عليك يا رسول الله العلي الأعلى يُقرئك السلام،، ويخصك بالتحية والإكرام ويقول لك وعزتي وجلالي أني ما خلقت سماءاً مبنية ولا أرضاً مدحية ولا قمراً منيرا ولا شمسا مضيئة ولا فلكا يدور ولا بحرا يجري ولا فلكا يسري إلا لأجلكم ومحبتكم،، وقد أذن لي أنأدخل معكم،، فهل تأذن لي يا رسول الله، فقال رسول الله وعليك السلام يا أمين وحيالله ،،إنه نعم قد أذنت لك.\n\n'
                      'فدخل جبرائيل معنا تحت الكساء،، فقال لأبي إنالله قد أوحى إليكم يقول ،، إنما يريد الله ليذهب عنكم الرجس أهل البيت ويطهركم تطهيرا ..\n\n'
                      'اللهم صل على محمد وآل محمد * اللهم صل على محمد وآل محمد * اللهم صل على محمد وآل محمد\n\n'
                      'فقال عليٌ لأبي يارسول الله أخبرني مالجلوسنا هذا تحت الكساء من الفضل عند الله ،، فقال النبي والذي بعثني بالحق نبياً،، واصطفاني بالرسالة نجيباً،، ما ذُكر خبرُنا هذا في محفل من محافل أهل الأرض،، وفيه جمعٌ من شيعتنا ومحبينا إلاّ ونزلت عليهم الرحمة وحفت بهم الملائكة،، واستغفرت لهم إلى أن يتفرقوا فقال عليٌ إذاً والله فزنا وفاز شيعتنا ورب الكعبة.\n\n'
                      'فقال أبي رسول الله يا عليُّ والذي بعثني بالحق نبيا واصطفاني بالرسالة نجيا ماذكر خبرنا هذا في محفل من محافل أهل الأرض وفيه جمع من شيعتنا ومحبينا وفيهم مهموم إلا وفرج الله همه،، ولا مغموم إلا وكشف الله غمه ولا طالب حاجةٍ إلا وقضى الله حاجته .. فقال عليٌ إذاً فزنا وسُعدنا وكذلك شيعتنا فازوا وسُعدوا في الدنيا والآخرة ورب الكعبة. والحمد لله رب العالمين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malAllaylaLatasi3a3ashar.screenRoute,
          pushBack: Dou3a22alhazin.screenRoute,
          soud: music,
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
