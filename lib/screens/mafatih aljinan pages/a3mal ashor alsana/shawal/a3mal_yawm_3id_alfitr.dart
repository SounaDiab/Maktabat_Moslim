import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../shawal.dart';
import 'allayla_al2oula_shawal.dart';

class A3malYawm3idAlfitr extends StatefulWidget {
  static String screenRoute = 'a3mal_yawm_eid_alfitr_screen';
  const A3malYawm3idAlfitr({super.key});

  @override
  State<A3malYawm3idAlfitr> createState() => _A3malYawm3idAlfitrState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malYawm3idAlfitrState extends State<A3malYawm3idAlfitr> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_yawm_eid_alfitr_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_yawm_eid_alfitr_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Shawal.screenRoute);
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
                      .addFavorite('أعمال يوم عيد الفطر',
                          A3malYawm3idAlfitr.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال يوم عيد الفطر',
                          A3malYawm3idAlfitr.screenRoute,
                          A3malYawm3idAlfitr.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال يوم عيد الفطر',
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
                  'اليَوم الاوّل\n\n'
                  'يوم عيد الفطر وأعماله عديدة :',
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
                  subtitle:
                      'أن تكبّر بعد صلاة الصّبح وبعد صلاة العيد بما مرّ من التكبيرات في ليلة العيد بعد الفريضة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'أن تدعو بعد فريضة الصّبح بما رواه السّيد (رحمه الله) من دعاء اَللّـهُمَّ اِنّي تَوَجَّهْتُ اِلَيْكَ بِمُحَمَّد اَمامي الخ وقد أورد الشّيخ هذا الدّعاء بعد صلاة العيد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'اخراج زكاة الفطرة صاعاً عن كلّ نسمة قبل صلاة العيد على التّفصيل المبين في الكتب الفقهيّة، واعلم انّ زكاة الفطر من الواجبات المؤكّدة، وهي شرط في قبول صوم شهر رمضان، وهي أمان عن الموت الى السّنة القابلة، وقد قدّم الله تعالى ذكرها على الصّلاة في الاية الكريمة « قَدْ اَفْلَحَ ».',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'الغسل والاحسن أن يغتسل من النّهر اذا تمكّن ووقت الغسل من الفجر الى حين أداء صلاة العيد، كما قال الشّيخ، وفي الحديث ليكن غسلك تحت الظّلال أو تحت حائط فاذا هممت بذلك فقل: اَللّـهُمَّ اِيماناً بِكَ وَتَصْديقاً بِكِتابِكَ، وَاتّباعَ سُنَّةِ نَبيِّكَ مُحَمَّد صَلّى اللهُ عَلَيْهِ وَآلِهِ، ثمّ سمّ بِسم اللهِ واغتسل، فاذا فرغت من الغسل فقل : اَللّـهُمَّ اجْعَلْهُ كَفّارَةً لِذُنُوبي وَطَهِّرْ ديني، اَللّـهُمَّ اَذْهِبْ عَنِّي الدَّنَسَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'تحسين الثّياب واستعمال الطّيب والاصحار في غير مكّة للصّلاة تحت السّماء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'الافطار اوّل النّهار قبل صلاة العيد، والافضل أن يفطر على التّمر أو على شيء من الحلوى وقال الشّيخ المفيد: يستحبّ أن يبتلع شيئاً من تُربة الحسين (عليه السلام) فانّها شفاء من كلّ داء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'أن لا تخرج لصلاة العيد الّا بعد طلوع الشّمس، وأن تدعو بما رواه السّيد في الاقبال من الدّعوات، منها ما رواه عن أبي حمزة الثّمالي، عن الباقر (عليه السلام) قال : ادع في العيدين والجمعة اذا تهيّأت للخروج بهذا الدّعاء :\n\n'
                      'اَللّـهُمَّ مَنْ تَهَيَّأَ في هذَا الْيَوْمِ اَوْ تَعَبَّأَ اَوْ اَعَدَّ وَاسْتَعَدَّ لِوِفادَة اِلى مَخْلُوق رَجاءَ رِفْدِهِ وَنَوافِلِهِ وَفَواضِلِهِ وَعَطاياهُ، فَاِنَّ اِلَيْكَ يا سَيِّدي تَهْيِئَتي وَتَعْبِئَتي وَاِعْدادي وَاسْتِعْدادي رَجاءَ رِفْدِكَ وَجَوائِزِكَ وَنَوافِلِكَ وَفَواضِلِكَ وَفَضائِلِكَ وَعَطاياكَ، وَقَدْ غَدَوْتُ اِلى عيد مِنْ اَعْيادِ اُمَّةِ نَبيِّكَ مُحَمَّد صَلَواتُ اللهِ عَلَيْهِ وَعَلى آلِهِ، وَلَمْ اَفِدْ اِلَيْكَ الْيَوْمَ بِعَمَل صالِح اَثِقُ بِهِ قَدَّمْتُهُ، وَلا تَوَجَّهْتُ بِمَخْلُوق اَمَّلْتُهُ، وَلكِنْ اَتَيْتُكَ خاضِعاً مُقِرّاً بِذُنُوبي وَاِساءَتي اِلى نَفْسي، فَيا عَظيمُ يا عَظيمُ يا عَظيمُ اِغْفِرْ لِيَ الْعَظيمَ مِنْ ذُنُوبي، فَاِنَّهُ لا يَغْفِرُ الذُّنُوبَ الْعِظامَ إلاّ اَنْتَ يا لا اِلـهَ إلاّ اَنْتَ، يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'صلاة العيد وهي ركعتان يقرأ في الاُولى الحمد وسورة الاعلى، ويكبّر بعد القراءة خمس تكبيرات وتقنت بعد كلّ تكبيرة فتقول :\n\n'
                      'اَللّـهُمَّ اَهْلَ الْكِبْرِياءِ وَالْعَظَمَةِ، وَاَهْلَ الْجُودِ وَالْجَبَرُوتِ، وَاَهْلَ الْعَفْوِ وَالرَّحْمَةِ، وَاَهْلَ التَّقْوى وَالْمَغْفِرَةِ، اَسْاَلُكَ بِحَقِّ هذَا الْيَومِ الَّذي جَعَلْتَهُ لِلْمُسْلِمينَ عيداً، وَلُِمحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ ذُخْراً وَشَرَفاً وَمَزيْداً، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تُدْخِلَني في كُلِّ خَيْر اَدْخَلْتَ فيهِ مُحَمَّداً وَآلَ مُحَمَّد، وَاَنْ تُخْرِجَني مِنْ كُلِّ سُوء اَخْرَجْتَ مِنْهُ مُحَمَّداً وَآلَ مُحَمَّد صَلَواتُكَ عَلَيْهِ وَعَلَيْهِمْ، اَللّـهُمَّ اِنّي اَسْاَلُكَ خَيْرَ ما سَأَلَكَ مِنْهُ عِبادُكَ الصّالِحُونَ، وَاَعُوذُ بِكَ مِمَّا اسْتعاذَ مِنْهُ عِبادُكَ الْصّالِحُونَ.\n\n'
                      'ثمّ تكبّر السّادسة وتركع وتسجد، ثمّ تنهض للركعة الثّانية، فتقرأ فيها بعد الحمد سورة والشّمس، ثمّ تكبرّ أربع تكبيرات تقنت بعد كلّ تكبيرة وتقرأ في القنوت ما مرّ، فاذا فرغت كبّرت الخامسة فركعت وأتممت الصّلاة وسبّحت بعد الصّلاة تسبيح الزّهراء (عليها السلام)، وقد وردت دعوات كثيرة بعد صلاة العيد ولعلّ أحسنها هو الدّعاء السّادس والاربعون من الصّحيفة الكاملة، ويستحبّ أن يبرز في صلاة العيد تحت السّماء، وأن يصلّي على الارض من دون بساط ولا بارية، وأن يرجع عن المصلّى من غير الطّريق الذي ذهب منه، وأن يدعو لاخوانه المؤمنين بقبول أعمالهم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle: 'أن يزور الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'قراءة دعاء النّدبة، وسيأتي إن شاء الله تعالى، وقال السّيد ابن طاووس (رحمه الله): اسجد اذا فرغت من الدّعاء فقُل : اَعُوذُ بِكَ مِنْ نار حَرُّها لا يَطْفى، وَجَديدُها لا يَبْلى، وَعَطْشانُها لا يُرْوى، (ثمّ ضع خدّك الايمن على الارض وقل ) اِلهي لا تُقَلِّبْ وَجْهي في النّارِ بَعْدَ سُجُودي وَتَعْفيري لَكَ بِغَيْرِ مَنٍّ مِنّي عَلَيْكَ بَلْ لَكَ الْمَنُّ عَلَيَّ (ثمّ ضع خدّك الايسر على الارض وقل) اِرْحَمْ مَنْ اَساءَ وَاقْتَرَفَ وَاسْتَكانَ وَاعْتَرَفَ (ثمّ عد الى السّجود وقل) اِنْ كُنْتُ بِئْسَ الْعَبْدُ فَاَنْتَ نِعْمَ الرَّبُّ، عَظُمَ الذَّنْبُ مِنْ عَبْدِكَ فَلْيَحْسُنِ الْعَفْوُ مِنْ عِنْدِكَ يا كَريمُ (ثمّ قل) الْعَفْوَ الْعَفْوَ مائة مرّة ثمّ قال السّيد : ولا تقطع يومك هذا باللّعب والاهمال وأنت لا تعلم اَمَردودٌ أم مقبول الاعمال، فاِن رجوت القبول فقابل ذلك بالشّكر الجميل واِن خفت الرّدَّ فكُن أسير الحزن الطويل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AllaylaAl2oulaShawal.screenRoute,
          pushBack: AllaylaAl2oulaShawal.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال يوم عيد الفطر.mp3',
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
