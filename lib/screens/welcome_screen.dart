import '../Util/app_imports.dart';

class WelcomeScreen extends StatefulWidget {
  static String screenRoute = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Drawer(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: DrawerScreen(),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Top Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            height: 55,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              Icons.menu,
                              size: 24,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      );
                    }),
                    Row(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(context,
                                CustomPageRoute(page: RamadanSchedulePage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            height: 55,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/islamic_icons/calendar.png'),
                              width: 24,
                              height: 24,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    page: FavoritesScreen(
                                  favoritePages: [],
                                )));
                          },
                          child: _topButton(Icons.favorite, ''),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: WisdomOfDay(),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        flex: 4,
                        child: ImageOfDay(),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        flex: 2,
                        child: QuranTouch(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topButton(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: Theme.of(context).iconTheme.color,
          ),
          if (text.isNotEmpty) SizedBox(width: 6),
          text != ''
              ? Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget DrawerScreen() {
    return SafeArea(
      child: DrawerHeader(
        curve: Curves.decelerate,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  activeTrackColor: Theme.of(context).canvasColor,
                  inactiveTrackColor: Theme.of(context).canvasColor,
                  activeColor: Theme.of(context).iconTheme.color,
                  inactiveThumbColor: Theme.of(context).iconTheme.color,
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    setState(() {
                      // Toggle theme mode
                      Theme.of(context).brightness == Brightness.dark
                          ? AdaptiveTheme.of(context).setLight()
                          : AdaptiveTheme.of(context).setDark();
                    });
                  },
                ),
                Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  size: 30,
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _mainCard(
                  title: 'القرآن والأدعية',
                  image: 'assets/islamic_icons/koran.png',
                  color: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(context, CustomPageRoute(page: Books()));
                  },
                ),
                const SizedBox(height: 16),
                _mainCard(
                  title: 'مواقيت الصلاة',
                  image: 'assets/islamic_icons/clock.png',
                  color: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(page: MawakitAlsalat()));
                    // _adMawakitSalat.showAd();
                  },
                ),
                const SizedBox(height: 16),
                _mainCard(
                  title: 'التقويم',
                  image: 'assets/islamic_icons/schedule.png',
                  color: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(page: TakwimScreen()));
                    // _adTakwim.showAd();
                  },
                ),
                const SizedBox(height: 16),
                _mainCard(
                  title: 'مسبحة',
                  image: 'assets/islamic_icons/beads.png',
                  color: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(page: TesbihPage()));
                    // _adMasbaha.showAd();
                  },
                ),
                const SizedBox(height: 16),
                _mainCard(
                  title: 'القبلة',
                  image: 'assets/islamic_icons/qibla-compass.png',
                  color: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(page: QiblaSalat()));
                  },
                ),
                const SizedBox(height: 16),
                _mainCard(
                  title: 'صلاة الليل',
                  image: 'assets/islamic_icons/praying.png',
                  color: Theme.of(context).cardColor,
                  onTap: () {
                    Navigator.push(
                        context, CustomPageRoute(page: SalatAllayl()));
                  },
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, CustomPageRoute(page: AboutUs()));
              },
              child: _topButton(Icons.info_outline, 'حول التطبيق'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainCard({
    required String title,
    required String image,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Image(
              image: AssetImage(image),
              width: 30,
              height: 30,
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(width: 16),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
