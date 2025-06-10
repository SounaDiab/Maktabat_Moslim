import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_li7adis_alnafs.dart';
import 'salat_liddain_wlkifayat_zolm_alsoltan.dart';

class SalatAl2isti5araZatAlrka3 extends StatefulWidget {
  static String screenRoute = 'salat_al2isti5ara_zat_alrka3_screen';
  const SalatAl2isti5araZatAlrka3({super.key});

  @override
  State<SalatAl2isti5araZatAlrka3> createState() => _SalatAl2isti5araZatAlrka3State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl2isti5araZatAlrka3State extends State<SalatAl2isti5araZatAlrka3> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al2isti5ara_zat_alrka3_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al2isti5ara_zat_alrka3_screen', value);
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
                      .addFavorite(
                          'صلاة الاستخارة ذات الرقاع', SalatAl2isti5araZatAlrka3.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الاستخارة ذات الرقاع',
                          SalatAl2isti5araZatAlrka3.screenRoute,
                          SalatAl2isti5araZatAlrka3.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الاستخارة ذات الرقاع',
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
                      'وصفتها: أنك إذا أردت أمراً فخذ ست رقاع فاكتب في ثلاث منها: بِسْمِ الله الرَّحْمنِ الرَّحيمِ خيرَةً مِنَ الله العزيزِ الحَكيمِ لِفُلانٍ بِنْ فُلانَةَ إفْعَلْ. واكتب في الثلاث الاخر: لاتَفْعَلْ عوض إفعل ثم ضعها تحت مصلاّك ، ثم صلّ ركعتين فإذا فرغت فاسجد سجدة وقل فيها مائة مرة: أسْتَخيرُ الله بِرَحْمَتِهِ خيرَةً في عافيةٍ.\n\n'
                      'ثم استو جالساً وقل: اللَّهُمَّ خِرْلي وَاخْتَرْ لي في جَميعِ أموري في يُسْرٍ مِنْكَ وَعافيةٍ. ثم اضرب بيدك إلى الرقاع فشوشها وأخرج واحدة فإن خرج ثلاث متواليات إفعل فافعل الأمر الذي تريده وإن خرج ثلاث متواليات لاتفعل فلا تفعله.\n\n'
                      'وإن خرجت واحدة إفعل والاخرى لاتفعل فأخرج من الرقاع إلى خمس فانظر أكثرها فإن كانت ثلاث منها إفعل واثنتان لاتفعل فافعل الأمر الذي تريده وإن كانت بالعكس فلا تفعله.\n\n'
                      'أقول: الاستخارة تعني طلب الخير فإذا رمت أمراً فاستخر الله تعالى لنفسك وفي الحديث استخر الله عزَّ وجلَّ في اَّخر سجدة من صلاة الليل وقل مائة مرّة ومرّة: أسْتَخيرُ الله بِرَحْمَتِهِ. وتستحب الاستخارة في السجدة الاخيرة من نافلة الصبح، وتستحب أيضاً في كل ركعة من نافلة الزوال.\n\n'
                      'واعلم أن العلامة المجلسي رض قد روى عن والده، عن استاذه الشيخ البهائي رض قال: سمعنا مذاكرة عن مشايخنا عن القائم عجل الله فرجه في الاستخارة بالسبحة أنه يأخذها ويصلي على النبي وآله (عليهم السلام) ثلاث مرات ويقبض على السبحة ويعد اثنتين اثنتين فإن بقيت واحدة فهو إفعل وإن بقيت اثنتان فهو لاتفعل.\n\n'
                      'وقال الشيخ الاجلّ الفقيه صاحب الجواهر في (كتاب الجواهر): وهناك استخارة أخرى مستعملة عند بعض أهل زماننا وربما نسبت إلى مولانا القائم (عج) وهي أن يقبض على السبحة بعد قراءة ودعاء ويسقط ثمانية ثمانية فإن بقي واحداً فحسنة في الجملة، وإن بقي اثنان فنهي واحد، وإن بقي ثلاثة فصاحبها بالخيار لتساوي الامرين، وإن بقي أربعة فنهيان، وإن بقي خمسة فعند بعض أنّه يكون فيها تعب وعند بعض أن فيها ملامة، وإن بقي ستة فهو الحسنة الكاملة التي تجب العجلة، وإن بقي سبعة فالحال فيها كما ذكر في الخمسة من اختلاف الرأيين أو الروايتين وإن بقي ثمانية فقد نهي عن ذلك أربع مرات. واعلم أنّا سنذكر بعض أقسام الاستخارات في الباب الرابع. واعلم أيضاً أنّ المحدث الكاشاني رض قد اختار في كتابه (تقويم المحسنين) للاستخارة بالكتاب المجيد ساعات خاصة من أيام الاسبوع، وقال: إنّ اختيار هذه الساعات إنما هو على المشهور وإن لم نجد بذلك حديثا من أهل البيت (عليهم السلام) فقال: يوم الاحد حسن إلى الظهر ثم من العصر إلى المغرب.\n\n'
                      'يوم الاثنين حسن إلى طلوع الشمس ثم من وقت الغداء إلى الظهر ومن العصر إلى العشاء الاخر.\n\n'
                      'يوم الثلاثاء حسن إلى الظهر ثم من العصر إلى العشاء الاخر.\n\n'
                      'يوم الثلاثاء حسن من وقت الغداء إلى الظهر ثم من العصر إلى العشاء الاخر.\n\n'
                      'يوم الاربعاء حسن إلى الظهر ثم من العصر إلى العشاء الاخر. يوم الخميس حسن إلى طلوع الشمس ثم من الظهر إلى العشاء الاخر.\n\n'
                      'يوم الجمعة حسن إلى طلوع الشمس ثم من الزوال إلى العصر. يوم السبت حسن إلى وقت الغداء ثم من الزوال إلى العصر. وهذا الجدول مأخوذ من المدخل المنظوم للمحقّق الطوسي طاب ثراه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatLiddainWlkifayatZolmAlsoltan.screenRoute,
          pushBack: SalatLi7adisAlnafs.screenRoute,
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
