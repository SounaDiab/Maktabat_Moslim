import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../widgets/about_link.dart';

class AboutUs extends StatefulWidget {
  static String screenRoute = 'aboutus_screen';
  AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();
    _getInfoVersion();
  }

  String? _packageInfoVersion;
  void _getInfoVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    setState(() {
      _packageInfoVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    // _getInfoVersion();

    final Uri rateUrl = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.hassandiab.maktabat_almoslim&reviewId=0');
    // final Uri rateUrl = Uri.parse(
    //     'https://apkpure.com/reviews/com.example.herz_lmoujahidin#publish');
    final Uri updateUrl = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.hassandiab.maktabat_almoslim');
    // final Uri updateUrl = Uri.parse(
    //     'https://apkpure.com/%D8%AD%D8%B1%D8%B2-%D8%A7%D9%84%D9%85%D8%AC%D8%A7%D9%87%D8%AF%D9%8A%D9%86/com.example.herz_lmoujahidin/downloading');
    final Uri messageUrl = Uri.parse('https://wa.me/+96171294053');
    final Uri shareUrl = Uri.parse(
        'https://api.whatsapp.com/send?text=https://play.google.com/store/apps/details?id=com.hassandiab.maktabat_almoslim&pcampaignid=web_share');
    // final Uri loginUrl = Uri.parse('https://apkpure.com/login');
    String policyUrlString =
        'https://www.termsfeed.com/live/24dccaa4-7e22-43bb-a4d1-394a7cdd026e';
    final Uri policyUrl = Uri.parse(policyUrlString);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTablet ? 120 : 60,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: isTablet ? 50 : 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: isTablet ? 60 : 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: isTablet ? 280 : 140,
                      height: isTablet ? 280 : 140,
                    ),
                    Text(
                      'مكتبة المسلم',
                      style: TextStyle(
                        fontSize: isTablet ? 60 : 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    Text(
                      'الإصدار: ${_packageInfoVersion}',
                      style: TextStyle(
                        fontSize: isTablet ? 40 : 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'UthmanicHafs',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        textAlign: TextAlign.justify,
                        'هذا التطبيق يحتوي على كتب اسلامية تحتوي على الأدعية والأحراز والصلاة وغيره.\n'
                        'المطور: حسن دياب',
                        style: TextStyle(
                          fontSize: isTablet ? 38 : 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: AboutLink(
                              israting: false,
                              url: rateUrl,
                              text: 'يسعدنا تقييمك للتطبيق',
                              icon: Icons.star_outline,
                              fontSize: isTablet ? 30 : 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: isTablet ? 20 : 15),
                            child: AboutLink(
                              israting: true,
                              url: updateUrl,
                              text: 'تحديث التطبيق',
                              icon: Icons.update,
                              fontSize: isTablet ? 30 : 16,
                            ),
                          ),
                          AboutLink(
                            israting: true,
                            url: messageUrl,
                            text: 'للتواصل معنا',
                            icon: Icons.message,
                            fontSize: isTablet ? 30 : 16,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: isTablet ? 20 : 15),
                            child: AboutLink(
                              israting: true,
                              url: shareUrl,
                              text: 'مشاركة التطبيق',
                              icon: Icons.share,
                              fontSize: isTablet ? 30 : 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: isTablet ? 20 : 15),
                            child: AboutLink(
                              israting: true,
                              url: policyUrl,
                              text: 'سياسة الخصوصية',
                              icon: Icons.privacy_tip,
                              fontSize: isTablet ? 30 : 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
