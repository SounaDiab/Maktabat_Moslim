import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'Douaa_alsabah.dart';
import 'douaa_alaahd.dart';

class Douaa3alkama extends StatefulWidget {
  static String screenRoute = 'douaa_3alkama_screen';
  const Douaa3alkama({super.key});

  @override
  State<Douaa3alkama> createState() => _Douaa3alkamaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Douaa3alkamaState extends State<Douaa3alkama> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_3alkama_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_3alkama_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    Ad3iyaMashhoura.screenRoute);
              }
            },
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
                      .addFavorite('دعاء علقمة', Douaa3alkama.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء علقمة', Douaa3alkama.screenRoute,
                          Douaa3alkama.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء علقمة',
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
                      'عن الإمام الصادق عليه السلام أنه قال لصفوان: يا صفوان إذا حدث لك إلى الله حاجة فزر بهذه الزيارة (زيارة عاشوراء تجدها في قسم زيارات الإمام الحسين عليه السلام ) من حيث كنت وادع بهذا الدعاء ( دعاء علقمة ) وسل حاجتك تأتك من الله ، والله غير مخلف وعده رسوله بجوده وبمنه والحمدلله.',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'يا اللهُ يا اللهُ يا اللهُ ، يا مُجيب دعوة المُضطَّرين ، يا كاشف كُرب المكرُوبين ، يا غياث المُستغيثين ، يا صريخ المُستصرخين ، يا من هُو أقربُ إليَّ من حبل الوريد ، يا من يحُولُ بين المرء وقلبه ، ويا من هُو بالمنظر الاعلى ، وبالاُفُق المُبين ، ويا من هُو الرَّحمنُ الرَّحيمُ على العرش استوى ، ويا من يعلمُ خائِنة الاعيُن وما تُخفي الصُّدُورُ ، ويا من لأ يخفى عليه خافية ، يا من لأ تشتبهُ عليه الاصواتُ ، ويا من لاتُغلِّطُهُ الحاجاتُ ، ويا من لأ يُبرمُهُ إلحاحُ المُلحِّين ، ويا مُدرك كُلِّ فوت ، ويا جامع كُلِّ شمل ، ويا بارئَ النُّفُوس بعد الموت ، يا من هُو كُلَّ يوم في شأْن ، يا قاضي الحاجات ، يا مُنفِّس الكُرُبات ، يا مُعطي السُّؤلات ، يا وليَّ الرَّغبات ، يا كافي المُهمَّات ، يا من يكفي من كُلِّ شيء ولا يكفي منهُ شي في السَّموات والارض ، أَسأَلُك بحقِّ مُحمَّد خاتم النبيين وعليٍّ أمير المُؤمنين ، وبحقّ فاطمة بنت نبيِّك ، وبحقِّ الحسن والحُسين.\n'
                      'فإنِّي بهم أتوجَّهُ إليك في مقامي هذا ، وبهم أتوسَّلُ ، وبهم أتشفَّعُ إليك ، وبحقِّهم أَسأَلُك واُقسمُ وأعزمُ عليك ، وبالشَّأْن الَّذي لهُم عندك وبالقدر الّذي لهُم عندك ، وبالَّذي فضَّلتهُم على العالمين ، وباسمك الّذي جعلتهُ عندهُم ، وبه خصصتهُم دُون العالمين ، وبه أبنتهُم وأَبنت فضلهُم من فضل العالمين حتَّى فاق فضلُهُم فضل العالمين جميعا أسألُك أن تُصلِّي على مُحمَّد وآل مُحمَّد وأن تكشف عنِّي غمِّي وهمِّي وكربي ، وتكفيني المُهمَّ من اُمُوري ، وتقضي عنِّي ديني ، وتُجيرني من الفقر ، وتجيرني من الفاقة ، وتُغنيني عن المسأَلة إلى المخلُوقين ، وتكفيني همَّ من أخافُ همَّهُ ، وجور من أَخافُ جوره ، وعُسر من أخافُ عُسرهُ ، وحُزُونة من أخافُ حُزُونتهُ ، وشرَّ من أخافُ شرَّهُ ، ومكر من أخافُ مكرهُ ، وبغي من أخافُ بغيهُ ، وسُلطان من أخافُ سُلطانهُ ، وكيد من أخافُ كيدهُ ، ومقدُرة من أخافُ مقدُرته عليَّ ، وترُدَّ عنِّي كيد الكيدة ، ومكر المكرة.\n'
                      'اللهُمَّ من أرادني فأردهُ ، ومن كادني فكدهُ ، واصرفُ عنِّي كيدهُ ومكرهُ وبأْسهُ وأمانيَّهُ ، وامنعهُ عنِّي كيف شئْت ، وأنّّى شئْت. اللهُمَّ اشغلهُ عنِّي بفقر لا تجبُرُهُ ، وببلاء لا تستُرُهُ ، وبفاقة لا تسُدَّها ، وبسُقم لا تُعافيه ، وذُلٍّ لا تُعزُّهُ ، وبمسكنة لا تجبُرُها. اللهُمَّ اضرب بالذُلِّ نصب عينيه ، وادخل عليه الفقر في منزله ، والعلَّة والسَّقم في بدنه ، حتَّى تشغلهُ عنِّي بشُغل شاغل لا فراغ لهُ ، وأنسه ذكري كما أنسيتهُ ذكرك ، وخُذ عنِّي بسمعه وبصره ولسانه ويده ورجله وقلبه وجميع جوارحه ، وأدخل عليه في جميع ذلك السُّقم ، ولا تشفه حتَّى تجعل ذلك لهُ شُغلا شاغلا به عنِّي وعن ذكري واكفني يا كافي ما لا يكفي سواك فإنَّك الكافي لا كافي سواك ، ومُفرِّج لا مُفرِّج سواك ، ومُغيث لا مُغيث سواك ، وجار لا جار سواك ، خاب من كان جارُهُ سواك ، ومُغيثُهُ سواك ، ومفزعُهُ إلى سواك ، ومهربُهُ إلى سواك ، وملجأُهُ إلى غيرك ، ومنجاهُ من مخلُوق غيرك ، فأنت ثقتي ورجائِي ومفزعي ومهربي وملجاي ومنجاي ، فبك أستفتحُ ، وبك أستنجحُ ، وبمُحمَّد وآل مُحمَّد أَتوجَّهُ إليك وأتوسَّلُ وأتشفَّعُ ، فأَسأَلُك يا اللهُ يا اللهُ يا اللهُ ، فلك الحمدُ ، ولك الشُّكرُ ، وإليك المُشتكى وأنت المُستعانُ ، فأسألُك يا اللهُ يا اللهُ يا اللهُ ، بحقِّ مُحمَّد وآل مُحمَّد أن تُصلِّي على مُحمَّد وآل مُحمَّد وأَن تكشف عنِّي غمِّي وهمِّي وكربي في مقامي هذا كما كشفت عن نبيِّك همَّهُ وغمَّهُ وكربهُ ، وكفيتهُ هول عدُوِّه ، فاكشف عنِّي كما كشفت عنهُ ، وفرِّج عنِّي كما فرَّجت عنهُ ، واكفني كما كفيتهُ واصرف عنّي هول ما أخافُ هولهُ ومؤُونة ما أخافُ مؤُونتهُ ، وهمَّ ما أخافُ همَّهُ بلا مؤُونة على نفسي من ذلك ، واصرفني بقضاء حوائِجي ، وكفاية ما أهمَّني همُّهُ من أمر آخرتي ودُنياي.\n'
                      'أمير المُؤْمنين ويا أبا عبد الله ، عليكُما منِّي سلامُ الله أبدا ما بقي الليلُ والنَّهارُ ، ولا جعلهُ اللهُ آخر العهد من زيارتكُما ولا فرَّق اللهُ بيني وبينكُما.\n'
                      'اللهُمَّ أحيني حياة مُحمَّد صلّى الله عليه وآله وذُرِّيَّته ، وأمتني مماتهُم ، وتوفَّني على ملَّتهم ، واحشُرني في زُمرتهم ، ولا تُفرِّق بيني وبينهُم طرفة عين أبدا في الدُّنيا والاخرة.\n'
                      'يا أمير المُؤْمنين ويا أبا عبدالله ، أَتيتُكُما زائِرا ومُتوسِّلا إلى الله ربِّي وربِّكُما ، ومُتوجِّها إليه بكُما ، ومُستشفعا بكُما إلى الله تعالى في حاجتي هذه فاشفعا لي فإنَّ لكُما عند الله المقام المحمُود ، والجاه الوجيه ، والمنزل الرَّفيع والوسيلة ، إنِّي أنقلبُ عنكُما مُنتظرا لتنجُّز الحاجة وقضائِها ونجاحها من الله بشفاعتكُما لي إلى الله في ذلك فلا أخيبُ ، ولا يكُونُ مُنقلبي مُنقلبا خائِبا خاسرا بل يكُونُ مُنقلبي مُنقلبا راجحا مُفلحا مُنجحا مُستجابا بقضاء جميع الحوائِج وتشفعا لي إلى الله ، انقلبتُ على ما شاء اللهُ ولا حول ولا قُوَّة إلاّ بالله ، ومُفوِّضا أمري إلى الله ، مُلجئا ظهري إلى الله ، مُتوكِّلا على الله ، وأقُولُ حسبي اللهُ وكفى ، سمع اللهُ لمن دعا ، ليس لي وراء الله ووراءكُم يا سادتي مُنتهى ، ما شاء ربِّي كان ، وما لم يشأْ لم يكُن ، ولا حول ولا قُوَّة إلاّ بالله أستودعُكُم الله ، ولا جعلهُ اللهُ آخر العهد منِّي إليكُما ، انصرفتُ يا سيِّدي يا أمير المُؤْمنين ومولاي وأنت يا أبا عبدالله ، يا سيّدي وسلامي عليكُما مُتَّصل ما اتَّصل الليلُ والنَّهارُ واصل ذلك إليكُما غيرُ محجُوب عنكُما ، سلأمي إن شاء ، اللهُ وأسأَلُهُ بحقِّكُما أن يشاء ذلك ويفعل فإنَّهُ حميد مجيد ،نقلبتُ يا سيِّديَّ عنكُما تائِبا حامدا لله ، شاكرا راجيا للاجابة ، غير آيس ولا قانط ، آئِبا عائِدا راجعا إلى زيارتكُما غير راغب عنكُما ولا عن زيارتكُما ، بل راجع عائِد إن شاء اللهُ ، ولا حول ولا قُوَّة إلاَّ بالله العليِّ العظيم ، يا سادتي رغبتُ إليكُما وإلى زيارتكُما بعد أن زهد فيكُما وفي زيارتكُما أهلُ الدُّنيا فلا خيَّبني اللهُ ما رجوتُ ، وما أمّلتُ في زيارتكُما ، إنّه قريب مُجيب.\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAlsabah.screenRoute,
        pushBack: DouaaAlaahd.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء علقمة.mp3',
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
