import 'package:flutter/material.dart';

class Ta3kibatStyle extends StatelessWidget {
  Ta3kibatStyle({
    required this.text,
    required this.weight,
    required this.size,
  });

  String text;
  FontWeight weight;
  double size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        textAlign: TextAlign.justify,
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: weight,
          fontFamily: 'Tajawal',
        ),
      ),
    );
  }
}


// Container(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//       child: Text(
//         text,
//         textAlign: TextAlign.justify,
//         style: TextStyle(
//           fontSize: size,
//           fontWeight: weight,
//         ),
//       ),
//     )