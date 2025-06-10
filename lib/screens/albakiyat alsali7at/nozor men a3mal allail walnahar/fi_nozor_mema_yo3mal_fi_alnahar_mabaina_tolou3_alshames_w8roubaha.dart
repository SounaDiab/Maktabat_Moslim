import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../nozor_men_a3mal_allail_walnahar.dart';
import 'alta3kibat_al5asa_bfaridat_alsob7.dart';
import 'fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm.dart';

class FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
    extends StatefulWidget {
  static String screenRoute =
      'fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha_screen';
  const FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha({super.key});

  @override
  State<FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha>
      createState() =>
          _FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubahaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubahaState
    extends State<FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha_screen',
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
                      .addFavorite(
                          'في نزر مما يعمل في النهار مابين طلوع الشمس وغروبها',
                          FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في نزر مما يعمل في النهار مابين طلوع الشمس وغروبها',
                          FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                              .screenRoute,
                          FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في نزر مما يعمل في النهار مابين طلوع الشمس وغروبها',
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
                      'تدعو قبيل طلوع الشمس بما سيأتي في الفصل الخامس إن شاء الله تعالى وينبغي أن تتصدق في أوّل النهار ولو بشي يسير، وأن تستعد لصلاة الظهر وأن تقدم القيلولة فهي عون على التهجد في الليل وعلى الصوم في النهار وتبذل جهدك لان تنتبه عند الظّهر ثم تتوضأ وتذهب إلى المسجد وتصلي التحية وتنتظر الزّوال إن لم يكن قد حان وقته، ويستحب أداء الصلاة في أوّل وقتها وأوّل ماتعمل إذا تحقق الزوال هو أن تقول: سُبْحانَ الله وَلا إلهَ إِلاّ الله وَالحَمْدُ لله الَّذِي لَمْ يَتَّخِذْ صاحِبَةً وَلا وَلَداً ولَمْ يَكُنْ لَهُ شَريكٌ في المُلْكِ وَلَمْ يَكُنْ لَهُ وَلي مِنَ الذُّلِّ وَكَبِرْهُ تَكْبيراً.\n\n'
                      'فقد روي أن الباقر (عليه السلام) وصّى به إلى محمد بن مسلم وقال له: حافظ على هذا الدعاء كما تحافظ على عينيك. وإذا لم تكن متوضئا فبادر إلى الوضؤ وتأدّب بما مضى من اَّدابه.\n\n'
                      'ثم خذ في النوافل الظهرية وهي ثمان ركعات: فانو للركعتين الأوليين منها وكبّر بالتكبيرات السبع التي ذكرناها وادع بدعواتها واستعذ بالله من الشيطان الرجيم واقرأ في الركعة الأولى: الحمد والتوحيد وفي الثانية: الحمد وسورة قل يا أيها الكافرون.\n\n'
                      'وبعد الفراغ تكبر التكبيرات الثلاث التي مرّت في التعقيبات العامة وتسبح تسبيح فاطمة (عليها السلام) ثم تقول: اللَّهُمَّ إِنِّي ضَعيفٌ فَقَوِّ في رِضاكَ ضَعْفي وَخُذْ إِلى الخَيْرِ بِناصِيَتي وَاجْعَلْ الايْمانَ مُنْتَهى رِضاي وَبارِكْ لي فيما قَسَمْتَ لي وَبَلِّغْني بِرَحْمَتِكَ كُلَّ الَّذِي أرْجو مِنْكَ وَاجْعَلْ لي وُداً وَسُروراً لِلمؤمِنينَ وَعَهْداً عِنْدَكَ.\n\n'
                      'ثم تنهض فتصلّي ركعتين أخريين بهذه الصفة غير أنك تحذف ستاً من التكبيرات الافتتاحية وتصلي بعدها ركعتين أخريين مثلهما وتسبح وتدعو بعد الفراغ من هذه الاربع ركعات بما مرّ وتجعل الركعتين الباقيتين من الثماني ركعات بين الاذان والاقامة وتقول بعد الاقامة: اللَّهُمَّ رَبَّ هذِهِ الدَّعْوَةِ التَامّةِ وَالصَلاةِ القائِمَةِ بَلّغْ مُحَمَّداً صَلّى الله عَلَيهِ وَآلِهِ الدَرَجَةَ وَالْوَسيلَةَ وَالفَضْلَ والَفضيلَةَ بِالله أسْتَفْتِحُ وَبِالله أسْتَنْجِحُ وَبِمُحَمَّدٍ صَلّى الله عَلَيهِ وَآلِهِ أتَوَجّهُ، اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ وآل مُحَمَّدٍ وَاجْعَلْني بِهِمْ عِنْدَكَ وَجيهاً في الدُّنيا وَالاخِرَةِ وَمِنَ المُقَرَّبينَ.\n\n'
                      'ثم تأخذ في فريضة الظهر وتراعي فيها مامر في فريضة الصبح، وأخفت بالقراءة فيما سوى التسمية منها، والافضل أن تقرأ في الأولى بعد الحمد سورة إنا أنزلناه، وفي الثانية سورة التوحيد. وتقول عقيب الصلاة على محمد وآله بعد التشهد تلو الركعة الثانية: اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ وآلِ مُحَمَّدٍ وَتَقَبَّلْ شَفاعَتَهُ وارْفَعْ دَرَجَتَهُ. ثم انهض فسبح بالتسبيحات الاربع ثلاث مرات ويحسن أن تضيف إليها الاستغفار قربةً إلى الله تعالى ثم تركع وتسجد بما مرّ من اَّدابهما ثم انهض للركعة الرابعة وأدّها كما مر ثم تشهد وسلم، ثم ابدأ في التعقيبات وكبّر التكبيرات الثلاث التي مرّت في بد بيان التعقيبات ثم تقول: لا إلهَ إِلاّ الله إلها واحداً… إلى اخر ما مرّ من الدعاء.\n\n'
                      'ثم تسبّح تسبيح الزهراء (عليها السلام) وتعقب بما شئت من التعقيبات العامة التي عقبت بها فريضة الصبح، ثم تعقب بالتعقيبات الخاصة بفريضة الظهر وهي كثيرة، ونحن قد أوردنا بعضها في (المفاتيح) وفي (الهديّة) وهذه الوجيزة لاتسعها. ثم تسجد سجدة الشكر فإذا فرغت من تعقيب فريضة الظهر فاستعد لفريضة العصر.\n\n'
                      'وابدأ في نوافل العصر وهي أيضاً ثماني ركعات، وبعد الفراغ من نوافل العصر تصلي الفريضة بما مرّ من الاداب وينبغي أن تقرأ بعد الحمد في الركعة الأولى سورة إذا جاء نصر الله والفتح أو سورة ألهاكُمُ التكاثر. أو أمثالهما وفي الثانية سورة التوحيد، وتعقب بعد الفراغ بما شئت من التعقيبات العامة ثم تعقّب بالتعقيبات الخاصّة بفريضة العصر، ومنها الاستغفار سبعين مرة وسورة إنا أنزلناه عشر مرّات، ثم تسجد سجدة الشكر وتقول إذا أردت أن تخرج من المسجد: اللَّهُمَّ دَعَوْتَني فأجَبْتُ دَعْوَتَكَ وَصَلَّيْتُ مَكْتوبَتَكَ وَانْتَشَرْتُ في أرْضِكَ كَما أمَرْتَني، فأَسْأَلُكَ مَنْ فَضْلِكَ العَمَلَ بِطاعَتِكَ وَاجْتِنابَ مَعْصيتِكَ وَالكَفافَ مِنَ الرِزْقِ بِرَحْمَتِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute,
          pushBack: Alta3kibatAl5asaBfaridatAlsob7.screenRoute,
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
