import '../../../Util/app_imports.dart';


class TesbihatAlzahra2Page extends StatefulWidget {
  static String screenRoute = 'tesbihatalzahraa_screen';
  const TesbihatAlzahra2Page({super.key});

  @override
  State<TesbihatAlzahra2Page> createState() => _TesbihatAlzahra2PageState();
}

class _TesbihatAlzahra2PageState extends State<TesbihatAlzahra2Page> {
  int count = 0;
  String title = 'الله أكبر';
  late int total;
  bool showDoneCard = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: 550,
              color: Theme.of(context).dividerColor,
            ),
          ),
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: 540,
              color: Theme.of(context).cardColor,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                ListTile(
                  title: Text(
                    textAlign: TextAlign.center,
                    "تسبيحة الزهراء",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: isTablet ? 40 : 24,
                        ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: isTablet ? 70 : 35,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).indicatorColor,
                      ),
                ),
                const SizedBox(height: 60),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    /// الحلقة نفسها
                    CustomPaint(
                      size: Size(260, 260),
                      painter: TasbeehRingPainter(
                        progress: title == 'الله أكبر'
                            ? count / 34
                            : title == 'الحمدلله'
                                ? count / 33
                                : count / 33,
                        color: Theme.of(context).cardColor,
                        secColor: Theme.of(context).canvasColor,
                        thirdColor: Theme.of(context).dividerColor,
                      ),
                    ),

                    /// الأرقام فوق الحلقة
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${title == 'الله أكبر' ? total = 34 : title == 'الحمدلله' ? total = 33 : total = 33} ",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: isTablet ? 40 : 24,
                                  ),
                        ),
                        Text(
                          "/ $count",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: isTablet ? 40 : 24,
                                  ),
                        ),
                      ],
                    ),

                    SizedBox(width: 8),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                              if (count > 34) {
                                title = 'الحمدلله';
                                count = 1;
                              }
                              if (count > 33 && title == 'الحمدلله') {
                                title = 'سبحان الله';
                                count = 1;
                              }
                              if (count == 33 && title == 'سبحان الله') {
                                showDoneCard = true;
                                Future.delayed(
                                  const Duration(seconds: 3),
                                  () {
                                    title = 'الله أكبر';
                                    count = 0;
                                    showDoneCard = false;
                                  },
                                );
                              }
                            });
                          },
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "تسبيح",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: isTablet ? 40 : 24,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FloatingActionButton(
                        backgroundColor: Theme.of(context).dividerColor,
                        onPressed: () => {
                          setState(() {
                            count = 0;
                            title = 'الله أكبر';
                          })
                        },
                        child: Icon(
                          Icons.refresh,
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          if (showDoneCard)
            doneCard("انتهت تسبيحة الزهراء!", Theme.of(context).primaryColor,
                Theme.of(context).indicatorColor),
        ],
      ),
    );
  }
}
