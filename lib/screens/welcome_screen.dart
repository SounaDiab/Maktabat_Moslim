import '../Util/app_imports.dart';

class WelcomeScreen extends StatefulWidget {
  static String screenRoute = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final InterstitialAdManager _adManager = InterstitialAdManager();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _adManager.loadAd('ca-app-pub-9302649846832207/8901261139');
    });
  }

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Top Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                            activeTrackColor: Theme.of(context).canvasColor,
                            inactiveTrackColor: Theme.of(context).canvasColor,
                            activeColor: Theme.of(context).iconTheme.color,
                            inactiveThumbColor:
                                Theme.of(context).iconTheme.color,
                            value:
                                Theme.of(context).brightness == Brightness.dark,
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
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ImsakiyaScreen.screenRoute);
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
                          onTap: () {
                            Navigator.pushNamed(
                                context, FavoritesScreen.screenRoute);
                          },
                          child: _topButton(Icons.favorite, ''),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),

                // Main Buttons
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _mainCard(
                            title: 'القرآن والأدعية',
                            image: 'assets/islamic_icons/koran.png',
                            color: Theme.of(context).cardColor,
                            onTap: () {
                              Navigator.pushNamed(context, Books.screenRoute);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _mainCard(
                            title: 'مواقيت الصلاة',
                            image: 'assets/islamic_icons/clock.png',
                            color: Theme.of(context).cardColor,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MawakitAlsalat.screenRoute);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _mainCard(
                            title: 'التقويم',
                            image: 'assets/islamic_icons/schedule.png',
                            color: Theme.of(context).cardColor,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, TakwimScreen.screenRoute);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _mainCard(
                            title: 'مسبحة',
                            image: 'assets/islamic_icons/beads.png',
                            color: Theme.of(context).cardColor,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, TesbihPage.screenRoute);
                              _adManager.showAd();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _mainCard(
                            title: 'القبلة',
                            image: 'assets/islamic_icons/qibla-compass.png',
                            color: Theme.of(context).cardColor,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, QiblaSalat.screenRoute);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _mainCard(
                            title: 'صلاة الليل',
                            image: 'assets/islamic_icons/praying.png',
                            color: Theme.of(context).cardColor,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SalatAllayl.screenRoute);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AboutUs.screenRoute);
                  },
                  child: _topButton(Icons.info_outline, 'حول التطبيق'),
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
          SizedBox(
            child: text == '' ? SizedBox.shrink() : SizedBox(width: 6),
          ),
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

  Widget _mainCard({
    required String title,
    required String image,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: 60,
              height: 60,
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
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
