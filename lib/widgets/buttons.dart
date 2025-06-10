import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.isMode,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final bool? isMode;
  String text;
  IconData icon;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed,
      icon: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(
            icon,
            color: isMode == true ? Colors.black : Colors.white,
          ),
          SizedBox(width: 2),
          Text(
            '$text',
            style: TextStyle(
              color: isMode == true ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
