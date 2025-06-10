import 'package:flutter/material.dart';

import 'container_scrollview.dart';

class ListOfKur2anVerses extends StatelessWidget {
  ListOfKur2anVerses({
    required this.title,
    required this.weight,
    required this.size,
    required this.subtitle,
  });

  String title;
  String subtitle;
  FontWeight weight;
  double size;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return ContainerScrollview(
      widget: ListTile(
        title: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: isTablet ? 40 : 20,
              fontWeight: FontWeight.w900,
              height: 3,
            ),
          ),
        ),
        subtitle: Text(
          textAlign: TextAlign.justify,
          subtitle,
          style: TextStyle(
            fontSize: size,
            fontWeight: weight,
            height: 2,
            letterSpacing: 1,
            wordSpacing: 3,
          ),
        ),
      ),
    );
  }
}
