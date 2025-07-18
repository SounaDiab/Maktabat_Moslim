import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../fima_ya3om_allayali_wal2ayam.dart';
import 'fi_fadl_shaher_ramadan.dart';

class MaYa3omAllayaliWalayam extends StatefulWidget {
  static String screenRoute = 'ma_ya3om_allayali_walayam_screen';
  const MaYa3omAllayaliWalayam({super.key});

  @override
  State<MaYa3omAllayaliWalayam> createState() => _MaYa3omAllayaliWalayamState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MaYa3omAllayaliWalayamState extends State<MaYa3omAllayaliWalayam> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ma_ya3om_allayali_walayam_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ma_ya3om_allayali_walayam_screen', value);
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
          .pushReplacementNamed(FimaYa3omAllayaliWal2ayam.screenRoute);
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
                      .addFavorite('ما يعم الليالي والايام في شهر رمضان المبارك',
                          MaYa3omAllayaliWalayam.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'ما يعم الليالي والايام في شهر رمضان المبارك',
                          MaYa3omAllayaliWalayam.screenRoute,
                          MaYa3omAllayaliWalayam.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ما يعم الليالي والايام في شهر رمضان المبارك',
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
                      'روى السّيد ابن طاووس (رحمه الله) عن الصّادق والكاظم (عليهما السلام) قالا : تقول في شهر رمضان من أوّله الى آخره بعد كلّ فريضة\n\n:'
                      'اَللّـهُمَّ ارْزُقْني حَجَّ بَيْتِكَ الْحَرامِ فِي عامي هذا وَفي كُلِّ عام ما اَبْقَيْتَني في يُسْر مِنْكَ وَعافِيَة، وَسَعَةِ رِزْق، وَلا تُخْلِني مِنْ تِلْكَ الْمواقِفِ الْكَريمَةِ، وَالْمَشاهِدِ الشَّريفَةِ، وَزِيارَةِ قَبْرِ نَبِيِّكَ صَلَواتُكَ عَلَيْهِ وَآلِهِ، وَفي جَميعِ حَوائِجِ الدُّنْيا وَالاْخِرَةِ فَكُنْ لي، اَللّـهُمَّ اِنّي اَساَلُكَ فيـما تَقْضي وَتُقَدِّرُ مِنَ الاَمْرِ الَْمحْتُومِ في لَيْلَةِ الْقَدْرِ، مِنَ الْقَضاءِ الَّذي لا يُرَدُّ وَلا يُبَدَّلُ، اَنْ تَكْتُبَني مِنْ حُجّاجِ بَيْتِكَ الْحَرامِ، الْمَبْرُورِ حَجُّهُمْ، الْمَشْكُورِ سَعْيُهُمْ، الْمَغْفُورِ ذُنُوبُهُمْ، الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ، واجْعَلْ فيـما تَقْضي وَتُقَدِّرُ، اَنْ تُطيلَ عُمْري، وَتُوَسِّعَ عَلَيَّ رِزْقي، وَتُؤدِّى عَنّي اَمانَتي وَدَيْني آمينَ رَبَّ الْعالَمين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'وتَدْعُو عقيب كلّ فريضة فتقول :',
                  subtitle:
                      'يا عَلِيُّ يا عَظيمُ، يا غَفُورُ يا رَحيمُ، اَنْتَ الرَّبُّ الْعَظيمُ الَّذي لَيْسَ كَمِثْلِهِ شَيءٌ وَهُوَ السَّميعُ الْبَصيرُ، وَهذا شَهْرٌ عَظَّمْتَهُ وَكَرَّمْتَهْ، وَشَرَّفْتَهُ وَفَضَّلْتَهُ عَلَى الشُّهُورِ، وَهُوَ الشَّهْرُ الَّذي فَرَضْتَ صِيامَهُ عَلَيَّ، وَهُوَ شَهْرُ رَمَضانَ، الَّذي اَنْزَلْتَ فيهِ الْقُرْآنَ، هُدىً لِلنّاسِ وَبَيِّنات مِنَ الْهُدى وَالْفُرْقانَ، وَجَعَلْتَ فيهِ لَيْلَةَ الْقَدْرِ، وَجَعَلْتَها خَيْراً مِنْ اَلْفِ شَهْر، فَيا ذَا الْمَنِّ وَلا يُمَنُّ عَلَيْكَ، مُنَّ عَلَيَّ بِفَكاكِ رَقَبَتي مِنَ النّارِ فيمَنْ تَمُنَّ عَلَيْهِ، وَاَدْخِلْنِى الْجَنَّةَ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ .\n\n'
                      'وروى الكفعمي في المصباح وفي البلد الامين كما روى الشّيخ الشّهيد في مجموعته عن النّبي (صلى الله عليه وآله وسلم) انّه قال : من دعا بهذا الدّعاء في رمضان بعد كلّ فريضة غفر الله له ذنوبه الى يوم القيامة :\n\n'
                      'اَللّـهُمَّ اَدْخِلْ عَلى اَهْلِ الْقُبُورِ السُّرُورَ اَللّـهُمَّ اَغْنِ كُلَّ فَقير، اَللّـهُمَّ اَشْبِعْ كُلَّ جائِع، اَللّـهُمَّ اكْسُ كُلَّ عُرْيان، اَللّـهُمَّ اقْضِ دَيْنَ كُلِّ مَدين، اَللّـهُمَّ فَرِّجْ عَنْ كُلِّ مَكْرُوب، اَللّـهُمَّ رُدَّ كُلَّ غَريب، اَللّـهُمَّ فُكَّ كُلَّ اَسير، اَللّـهُمَّ اَصْلِحْ كُلَّ فاسِد مِنْ اُمُورِ الْمُسْلِمينَ، اَللّـهُمَّ اشْفِ كُلَّ مَريض، اللّهُمَّ سُدَّ فَقْرَنا بِغِناكَ، اَللّـهُمَّ غَيِّر سُوءَ حالِنا بِحُسْنِ حالِكَ، اَللّـهُمَّ اقْضِ عَنَّا الدَّيْنَ وَاَغْنِنا مِنَ الْفَقْرِ، اِنَّكَ عَلى كُلِّ شَيء قَديرٌ .\n\n'
                      'وروى الكليني في الكافي عن أبي بصير قال : كان الصّادق (عليه السلام) يدعو بهذا الدّعاء في شهر رمضان :\n\n'
                      'اَللّـهُمَّ اِنّي بِكَ وَمِنْكَ اَطْلُبُ حاجَتي، وَمَنْ طَلَبَ حاجَةً اِليَ النّاسِ فَاِنّي لا اَطْلُبُ حاجَتي إلاّ مِنْكَ وَحْدَكَ لا شَريكَ لَكَ، وَاَساَلُكَ بِفَضْلِكَ وَرِضْوانِكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وأهْلِ بَيْتِهِ، وَاَنْ تَجْعَلَ لي في عامي هذ اِلى بَيْتِكَ الْحَرامِ سَبيلاً حِجَّةً مَبْرُورَةً مُتَقبَّلَةً زاكِيَةً خالِصَةً، لَكَ تَقَرُّ بِها عَيْني، وَتَرْفَعُ بِها دَرَجَتي، وَتَرْزُقَني اَنْ اَغُضَّ بَصَري، وَاَنْ اَحْفَظَ فرْجي، وَاَنْ اَكُفَّ بِها عَنْ جَميعِ مَحارِمَكَ، حَتّى لايَكُونَ شَيءٌ آثَرَ عِنْدي مِنْ طاعَتِكَ وَخَشْيَتِكَ، وَالْعَمَلِ بِما اَحْبَبْتَ، وَالتَّرْكِ لِما كَرِهْتَ وَنَهَيْتَ عَنْهُ، وَاجْعَلْ ذلِكَ في يُسْر ويسار عافِيَة وَما اَنْعَمْتَ بِهِ عَلَيَّ، وَاَساَلُكَ اَنْ تَجْعَلَ وَفاتي قَتْلاً في سَبيلِكَ، تَحْتَ رايَةِ نَبِيِّكَ مَعَ اَوْلِيائِكَ، وَاَسْاَلُكَ اَنْ تَقْتُلَ بي اَعْداءَكَ وَاَعْداءَ رَسُولِكَ، وَاَسْاَلُكَ اَنْ تُكْرِمَني بِهَوانِ مَنْ شِئْتَ مِنْ خَلْقِكَ، وَلا تُهِنّي بِكَرامَةِ اَحَد مِنْ اَوْلِياءِكَ اَللّـهُمَّ اجْعَلْ لي مَعَ الرَّسُولِ سَبيلاً، حَسْبِيَ اللهُ ما شاءَ اللهُ .\n\n'
                      'أقول : هذا الدّعاء يسمّى دعاء الحجّ وقد رواه السّيد في الاقبال عن الصّادق (عليه السلام) لليالي شهر رمضان بعد المغرب، وقال الكفعمي في البلد الامين: يستحبّ الدّعاء به في كلّ يوم من رمضان وفي أوّل ليلة منه، وأورده المفيد في المقنعة في خصوص اللّيلة الاُولى بعد صلاة المغرب.\n\n'
                      'واعلم انّ أفضل الاعمال في ليالي شهر رمضان وأيّامه هو تلاوة القرآن الكريم وينبغي الاكثار من تلاوته في هذا الشّهر ففيه كان نزول القرآن وفي الحديث انّ لكلّ شيء ربيعاً وربيع القرآن هو شهر رمضان، ويستحبّ في سائر الايّام ختم القرآن ختمة واحدة في كلّ شهر وأقلّ ما روى في ذلك هو ختمة في كلّ ستّة أيّام، وامّا شهر رمضان فالمسنون فيه ختمه في كلّ ثلاثة أيّام، ويحسن إن تيسّر له أن يختمه ختمة في كلّ يوم، وروى العلامة المجلسي (رحمه الله) انّ بعض الائمة الاطهار (عليهم السلام) كانوا يختمون القرآن في هذا الشّهر أربعين ختمة واكثر من ذلك، ويضاعف ثواب الختمات ان أهديت الى أرواح المعصومين الاربعة عشر يخصّ كلّ منهم بختمة، ويظهر من بعض الرّوايات انّ أجر مهديها أن يكون معهم في يوم القيامة، وليكثر المرء في هذا الشّهر من الدّعاء والصّلاة والاستغفار ومن قول لا اِلـه إلاّ اللهُ وقد روي انّ زين العابدين (عليه السلام) كان اذا دخل شهر رمضان لا يتكلّم إلاّ بالدّعاء والتّسبيح والاستغفار والتّكبير، وليهتم اهتماماً بالغاً بالمأثور من العبادات ونوافل اللّيالي والايّام .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiFadlShaherRamadan.screenRoute,
          pushBack: FiFadlShaherRamadan.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/ما يعم الليالي والايام.mp3',
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
