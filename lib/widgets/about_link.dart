import '../../Util/app_imports.dart';

class AboutLink extends StatelessWidget {
  const AboutLink({
    super.key,
    required this.url,
    required this.israting,
    required this.text,
    required this.fontSize,
    required this.icon,
  });

  final Uri url;
  final String text;
  final double fontSize;
  final IconData icon;
  final bool israting;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        {
          await launchUrl(url);
        }
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: fontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'UthmanicHafs',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
