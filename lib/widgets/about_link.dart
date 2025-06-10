import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                color: Colors.grey[700],
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
