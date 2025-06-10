import 'package:flutter/material.dart';

class She3er extends StatelessWidget {
  She3er({
    required this.subtitle,
    required this.weight,
    required this.size,
  });

  String subtitle;
  FontWeight weight;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          subtitle,
          style: TextStyle(
            fontSize: size,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}
