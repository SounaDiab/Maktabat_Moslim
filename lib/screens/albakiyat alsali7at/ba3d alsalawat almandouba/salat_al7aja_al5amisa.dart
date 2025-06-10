import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al7aja_alrabi3a.dart';
import 'salat_alisti8asa.dart';

class SalatAl7ajaAl5amisa extends StatefulWidget {
  static String screenRoute = 'salat_al7aja_al5amisa_screen';
  const SalatAl7ajaAl5amisa({super.key});

  @override
  State<SalatAl7ajaAl5amisa> createState() => _SalatAl7ajaAl5amisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ajaAl5amisaState extends State<SalatAl7ajaAl5amisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al7aja_al5amisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7aja_al5amisa_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                      .addFavorite('صلاة الحاجة الخامسة',
                          SalatAl7ajaAl5amisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحاجة الخامسة',
                          SalatAl7ajaAl5amisa.screenRoute,
                          SalatAl7ajaAl5amisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحاجة الخامسة',
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
                      'رواها جمع من العلماء كالشيخ المفيد والطوسي والسيد ابن طاووس وغيرهم عن الصادق (عليه السلام) وهي على مارواها السيد أنك إذا حضرت لك حاجة مهمة إلى الله عزَّ وجلَّ فصم ثلاثة أيام متوالية الاربعاء والخميس والجمعة فإذا كان يوم الجمعة فأغتسل والبس ثوبا جديداً نظيفا ثم اصعد إلى أعلى موضع في دارك فصل ركعتين ثم ارفع يديك إلى السماء وقل: اللَّهُمَّ إِنِّي حَلَلْتُ بِساحَتِكَ لِمَعْرِفَتي بِوِحْدانيَّتِكَ وَصَمَدانيَّتِكَ وَأنَّهُ لا قادِراً عَلى قَضاء حاجَتي غَيرُكَ، وَقَدْ عَلِمْتُ يارَبِّ أنَّهُ كُلَّما تَظاهَرَتْ نِعْمَتُكَ عَليّ اشْتَدَّتْ فاقَتي إلَيْكَ وَقَدْ طَرَقَني هَمُّ كَذا وَكَذا.\n\n'
                      'واذكر حوائجك عوض كذا وَكذا: وَأنْتَ بِكَشْفِهِ عالِمٌ غَيْرُ مُعَلَّمٍ وَاسِعٌ غَيْرُ مُتَكَلِّفٍ ؛ فَأسْأَلُكَ بِإسْمِكَ الَّذِي وَضَعْتَهُ عَلى الجِبالِ فَنُسِفَتْ وَوَضَعْتَهُ عَلى السَّماواتِ فَانْشَقَّتْ وعَلى النُّجومِ فَانْتَثَرَتْ وَعَلى الارْضِ فَسُطِحَتْ، وَأَسْأَلُكَ بِالحَقِّ الَّذِي جَعَلْتَهُ عِنْدَ مُحَمَّدٍ صَلّى الله عَلَيهِ وَآلِهِ وَعِنْدَ عَليٍّ وَالحَسَنِ وَالحُسَينِ وَعَليٍّ وَمُحَمَّدٍ وَجَعْفَرٍ وَموسى وَعَليٍّ وَمُحَمَّدٍ وَعَليٍّ والحَسَنِ وَالحُجَّةِ عَلَيْهِمْ الَّسلامُ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَأهْلِ بَيْتِهِ وَأنْ تَقْضي لي حاجَتي وَتُيَسِّرَ لي عَسيرَها وَتَكْفيَني مُهِمَّها، فَإنْ فَعَلْتَ فَلَكَ الحَمْدُ وَإنْ لَمْ تَفْعَلْ فَلَكَ الحَمْدُ غَيرَ جائِرٍ في حُكْمِكَ ولامُتَّهَمٍ في قَضائكَ وَلاحائِفٍ في عَدْلِكَ. ثم ضع وجهك على الارض وقل: اللَّهُمَّ إنَّ يونُسَ بْنَ مَتّى عَبْدُكَ دَعاكَ في بَطْنِ الحوتِ وَهوَ عَبْدُكَ فَإسْتَجَبْتَ لَهُ، وَأنا عَبْدُكَ أدْعُوَك فَإسْتَجِبْ لي.\n\n'
                      'قال الصادق (عليه السلام) رُبّ حاجة تعرض لي فأدعوا بهذا الدعاء فأرجع وقد قضيت حاجتي.\n\n'
                      'أقول: أورد السيد ابن طاووس في كتاب (جمال الاسبوع) كلاما هذا نصه مع شي من التغيير والتلخيص: كن على أقل المراتب في طلبك الحوائج من سلطان العارفين كما تكون لو طلبت حاجة مهمة من بعض ملوك الادميين فإنك تتوصل إلى رضاهم بكل اجتهاد وقت حاجاتك اليهم فكذلك اجتهد في رضا الله عزَّ وجلَّ عند حاجتك إليه ولايكن إقبالك عليه دون إقبالك عليهم فتكون من المستهزئين الهالكين. وكيف يجوز أن يكون اهتمامك برضا الجلالة الالهية دون اهتمامك برضا المخلوقين ؟ ثم إذا كان منزلة الله جلّ جلاله عندك أقل من منزلة ملوك الدنيا الذين هم مماليكه أما تكون مستخفا ومستهزئا ومستصغراً لعظمة الله جلّ جلاله ومعرضا عنها وهيهات أن تظفر مع ذلك بحاجتك بصلاتك أو صومك ثم لاتكن في صومك وصلاتك بالحاجة مجربا فإن الانسان لايجرب إِلاّ على من يسوء ظنّه به وقد عرفت أن الله جلّ جلاله قال: {يظنون بالله ظن السوء عليهم دائرة السوء}، ولكن كن على ثقة كاملة من رحمة الله جلّ جلاله الشاملة ومن كمال جوده وإنجاز وعوده أبلغ ممّا تكون لوقصدت حاتما الجواد في طلب قيراط‍ منه، فإنك تقطع أنّه يعطيك القيراط لو طلبته لك بكل طريق واعلم أنّ حاجتك عند الله تعالى أهون وأقل من قيراط‍ عند حاتم فإياك وأن يكون اعتمادك على الله أقل، وينبغي أن تكون نيتك في صوم حاجتك وصلاتك لنازلتك أنّك تصوم صوم الحاجة وتصلّي صلاة الحاجة للاهم فالاهم من حاجتك الدينيّة وأهمها حوائج من أنت في حفاوة هدايته وحمايته وهو إمام العصر (صلوات الله وسلامه عليه)، فيكون صومك وصلاتك أولاً لاجل قضاء حوائجه (صلوات الله وسلامه عليه)، ثم لحوائجك الدينية، ثم لحاجتك التي قد عرضت لك الان وكنت تقصدها. مثال ذلك أن تخاف على نفسك من البوار والقتل فتصوم صوم الحاجة للسلامة من هذا الخطر وأنت تعلم أن صومك لعفو الله جلّ جلاله ورضاه عنك وإقباله عليك وقبوله منك أهمّ لديك لان قتل مهجتك إنما يذهب به دنياك إذا كنت في القتل سلِيماً في دينك وسريرتك ثم أنت إذا لم تقتل فلابد أن تموت على كل حال وعفو الله جلّ جلاله ورضاه لو لم يحصل هلكت في الدنيا والاخرة وحصلت في أهوال لايقدر على احتمالها قوة الخيال وإنّما قلنا: تقدم حوائج إمام عصرك لانّ بقاء الدنيا وأهلها مسبب عن وجوده فإذا كنت محفوظا بواحد فكيف تقدّم حوائجك على حوائجه؟ بل يجب أن تقدم حوائجه ومراده على حوائجك ومرادك، واعلم أنه صلوات الله عليه مستغن عن صومك وصلاتك لحاجاته وإنّما تكون أنت إذا علمت بما قلناه أدّيت الامانة كما تستفتح أدعيتك بالصلاة عليهم صلوات الله عليهم أجمعين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAlisti8asa.screenRoute,
          pushBack: SalatAl7ajaAlrabi3a.screenRoute,
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
