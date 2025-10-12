import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ScrollTitle extends StatelessWidget {
  ScrollTitle({
    required this.title,
  });

  String title;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Marquee(
      text: title,
      style: TextStyle(
        fontSize: isTablet
            ? 40
            : size > 1.0
                ? 20
                : 23,
        fontWeight: FontWeight.bold,
      ),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 50,
      velocity: 50,
      pauseAfterRound: Duration(seconds: 1),
      startPadding: 10,
    );
  }
}
