import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../fima_ya3om_allayali_wal2ayam.dart';
import 'ma_ya3om_allayali_walayam.dart';

class FiFadlShaherRamadan extends StatefulWidget {
  static String screenRoute = 'fi_fadl_shaher_ramadan_screen';
  const FiFadlShaherRamadan({super.key});

  @override
  State<FiFadlShaherRamadan> createState() => _FiFadlShaherRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiFadlShaherRamadanState extends State<FiFadlShaherRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_fadl_shaher_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_fadl_shaher_ramadan_screen', value);
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
                      .addFavorite('في فضل شهر رمضان واعماله',
                          FiFadlShaherRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في فضل شهر رمضان واعماله',
                          FiFadlShaherRamadan.screenRoute,
                          FiFadlShaherRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في فضل شهر رمضان واعماله',
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
                      'روى الصّدوق بسند مُعتبر عن الرّضا (عليه السلام)، عن آبائه، عن أمير المؤمنين عليه وعلى أولاده السّلام قال : إنّ رسول الله (صلى الله عليه وآله وسلم) خطبنا ذات يوم فقال : أيّها النّاس أنّه قد أقبل إليكم شهر الله بالبركة والرّحمة والمغفرة، شهر هو عند الله أفضل الشّهور، وأيّامه أفضل الأيّام، ولياليه أفضل اللّيالي، وساعاته أفضل السّاعات، هو شهر دعيتم فيه الى ضيافة الله، وجعلتم فيه من أهل كرامة الله، أنفاسكم فيه تسبيح، ونومكم فيه عبادة، وعملكم فيه مقبول، ودعاؤكم فيه مستجاب، فسلوا الله ربّكم بنيّات صادقة، وقلُوب طاهرة أن يوفّقكم لصيامه، وتلاوة كتابه، فإنّ الشّقي من حرم غفران الله في هذا الشّهر العظيم، واذكروا بجوعكم وعطشكم فيه جوع يوم القيامة وعطشه، وتصدّقوا على فقرائكم ومساكينكم، ووقرّوا كباركم، وارحموا صغاركم، وصلوا أرحامكم، واحفظوا ألسنتكم، وغضّوا عمّا لا يحلّ النّظر إليه أبصاركم، وعمّا لا يحلّ الاستماع إليه اسماعكم و تحننوا على أيتام الناس يتحنّن على أيتامكم وتوبوا إليه من ذنوبكم، وارفعوا إليه أيديكم بالدّعاء في أوقات صلواتكم فانّها أفضل السّاعات ينظر الله عزوجل فيها بالرّحمة الى عباده يجيبهم إذا ناجوه، ويلبّيهم إذا نادوه، ويستجيب لهم اذا دعوه .\n\n'
                      'أيّها الناس إنّ أنفسكم مرهونة بأعمالكم ففكّوها باستغفاركم، وظهوركم ثقيلة من أوزاركم فخفّفوا عنها بطول سجودكم، واعلموا أنّ الله تعالى ذكره أقسمَ بعزّته أن لا يعذّب المصلّين والسّاجدين، وأن لا يروعهم بالنّار يوم يقوم النّاس لربّ العالمين ، أيّها النّاس من فطّر منكم صائماً مؤمناً في هذا الشّهر كان له بذلك عند الله عتق رقبة، ومغفرة لما مضى من ذنوبه ، قيل : يا رسول الله (صلى الله عليه وآله وسلم) وليس كّلنا يقدر على ذلك ، فقال (صلى الله عليه وآله وسلم) : اتّقوا النّار ولو بشقّ تمرة اتقّوا النّار ولو بشربة من ماء، فإنّ الله تعالى يهب ذلك الأجر لمن عمل هذا اليسير إذا لم يقدر على أكثر منه ، يا أيّها النّاس من حسّن منكم في هذا الشّهر خُلقه كان له جواز على الصّراط يوم تزلّ فيه الاقدام، ومن خفّف في هذا الشّهر عمّا ملكت يمنيه خفّف الله عليه حسابه، ومن كفّ فيه شرّه كفّ الله عنه غضبه يوم يلقاه، ومن أكرم فيه يتيماً أكرمه الله يوم يلقاه، ومن وصل فيه رحمه وصله الله برحمته يوم يلقاه، ومن قطع فيه رحمه قطع الله عنه رحمته يوم يلقاه، ومن تطوّع فيه بصلاة كتب الله له براءة من النّار، ومن أدّى فيه فرضاً كان له ثواب مَن أدّى سبعين فريضة فيما سواه من الشّهور، من أكثر فيه من الصّلاة عليّ ثقل الله ميزانه يوم تخفّ الموازين، ومن تلا فيه آية من القرآن كان له مثل أجر من ختم القرآن في غيره من الشّهور ، أيّها النّاس إنّ أبواب الجنان في هذا الشّهر مفتحة فسلوا ربّكم أن لا يغلقها عليكم، وأبواب النّيران مغلقة فسلوا ربّكم أن لا يفتحها عليكم، والشّياطين مغلولة فسلوا ربّكم أن لا يسلّطها عليكم ، إلخ.\n\n'
                      'وروى الصّدوق (رحمه الله) إنّ النّبي (صلى الله عليه وآله وسلم) كان إذا دخل شهر رمضان فكّ كلّ أسير وأعطى كلّ سائل .\n\n'
                      'أقول : شهر رمضان هو شهر الله ربّ العالمين وهو أشرف الشّهور شهر يفتح فيه أبواب السّماء وأبواب الجنان وأبواب الرّحمة ويغلق فيه أبواب جهنّم، وفي هذا الشّهر ليلة تكون عبادة الله فيها خيراً من عبادته في ألف شهر فانتبه فيه لنفسك وتبصّر كيف تقضى فيه ليلك ونهارك وكيف تصون جوارحك وأعضائك عن معاصي ربّك، وايّاك وأن تكون في ليلتك من النّائمين وفي نهارك من الغافلين عن ذكر ربّك، ففي الحديث انّ الله عزوجلّ يعتق في آخر كلّ يوم من أيّام شهر رمضان عند الافطار ألف ألف رقبة من النّار فاذا كانت ليلة الجمعة ونهارها اعتق الله من النّار في كلّ ساعة ألف ألف رقبة ممّن قد استوجب العذاب ويعتق في اللّيلة ا لاخيرة من الشّهر ونهارها بعدد جميع من أعتق في الشّهر كلّه، فايّاك يا أيّها العزيز وأن ينقضي عنك شهر رمضان وقد بقى عليك ذنب من الذّنوب وايّاك أن تعد من المُذنبين المحرومين من الاستغفار والدّعاء ، فَعَنِ الصّادق (عليه السلام) انّه : « مَنْ لَم يُغفَر لَه في شَهر رَمَضان لَم يُغفَر لَهُ الى قابِل اِلاّ أن يَشهَدَ عَرَفَةَ » وصن نفسك ممّا قد حرّمه الله ومن أن تفطر بمحرّم عليك، واعمل بما أوصى به مولانا الصّادق صلوات الله وسلامه عليه ، فقال : اذا أصبحت صائماً فليصم سمعك وبصرك وشعرك وجلدك وجميع جوارحك ، أي عن المحرّمات بل المكروهات أيضاً، وقال (عليه السلام) : لا يكن يوم صومك كيوم افطارك ، وقال (عليه السلام) : انّ الصّيام ليس من الطّعام والشّراب وحدهما فاذا صمتم فاحفظوا ألسنتكم عن الكذب، وغضّوا أبصاركم عمّا حرّم الله، ولا تنازعوا ولا تحاسدوا ولا تغتابوا ولا تمارُوا ولا تخالفوا (كذباً بل ولا صدقاً) ولا تسابوا ولا تشاتموا ولا تظلموا ولا تسافهوا ولا تضاجروا ولا تغفلوا عن ذكر الله وعن الصّلاة وألزموا الصّمت والسّكوت والصّبر والصدّق ومجانبة أهل الشّر، واجتنبوا قول الزّور والكذب والفرى والخصومة وظنّ السّوء والغيبة والنّميمة وكونوا مشرفين على الاخرة منتظرين لايّامكم (ظهور القائم (عليه السلام) من آل محمّد (صلى الله عليه وآله وسلم)) منتظرين لما وعدكم الله متزوّدين للقاء الله، وعليكم السّكينة والوقار والخشوع والخضوع وذلّ العبيد الخيّف من مولاها خائفين راجين، ولتكن أنت أيّها الصّائم قد طهر قلبك من العيوب وتقدّست سريرتك من الخبث ونظف جسمك من القاذورات وتبرّأت الى الله ممّن عداه وأخلصت الولاية له وصمتّ ممّا قد نهاك الله عنه في السّر والعلانية وخشيت الله حقّ خشيته في سرّك وعلانيك، ووهبت نفسك الله في أيّام صومك وفرغت قلبك له ونصبت نفسك له فيما أمرك ودعاك اليه ، فاذا فعلت ذلك كلّه فأنت صائم لله بحقيقة صومه صانع له ما أمرك، وكلّمأ انقصت منها شيئاً فيما بيّنت لك فقد نقص من صومك بمقدار ذلك، وانّ أبي (عليه السلام) قال : سمع رسول الله (صلى الله عليه وآله وسلم)امرأة تساب جارية لها وهي صائمة فدعا رسول الله (صلى الله عليه وآله وسلم) بطعام فقال لها : كُلي ، فقالت : أنا صائمة يا رسول الله (صلى الله عليه وآله وسلم) ، فقال : كيف تكونين صائمة وقد سببت جاريتك انّ الصّوم ليس من الطّعام والشّراب وانّما جعل الله ذلك حجاباً عن سواهما من الفواحش من الفعل والقول، ما أقلّ الصّوم وأكثر الجّوع، وقال أمير المؤمنين صلوات الله وسلامه عليه : كم من صائم ليس له من صيامه الّا الظّماء، وكم من قائم ليس له من قيامه الّا العناء، حبّذا نوم الاكياس وافطارهم، وعن جابر بن يزيد عن الباقر (عليه السلام) قال : قال النّبي (صلى الله عليه وآله وسلم) لجابر بن عبد الله : يا جابر هذا شهر رمضان مَن صام نهاره وقام ورداً من ليلته وصان بطنه وفرجه وحفظ لسانه لخرج من الذّنوب كما يخرج من الشّهر ، قال جابر : يا رسول الله (صلى الله عليه وآله وسلم) ما أحسنه من حديث ، فقال رسول الله (صلى الله عليه وآله وسلم) : وما أصعبها من شروط .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: MaYa3omAllayaliWalayam.screenRoute,
          pushBack: MaYa3omAllayaliWalayam.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في فضل شهر رمضان.mp3',
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
