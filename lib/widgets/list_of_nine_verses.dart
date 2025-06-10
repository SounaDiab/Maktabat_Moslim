import 'package:flutter/material.dart';

class ListOfNineVerses extends StatelessWidget {
  ListOfNineVerses({
    required this.title,
    required this.subtitle,
    required this.weight,
    required this.size,
  });

  String title;
  String subtitle;
  FontWeight weight;
  double size;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: isTablet ? 40 : 18,
          fontWeight: FontWeight.w900,
          color: Colors.green,
          fontFamily: 'Tajawal',
        ),
      ),
      subtitle: Text(
        textAlign: TextAlign.justify,
        subtitle,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          fontFamily:
              subtitle.contains(RegExp(r'[0-9]')) ? 'UthmanicHafs' : 'Tajawal',
        ),
      ),
    );
  }
}
