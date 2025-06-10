import 'package:flutter/material.dart';

class LineFromIndex extends StatelessWidget {
  String? text;
  String route;

  LineFromIndex({required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Column(
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, route),
          child: Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text(
              '$text',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: isTablet ? 40 : 16,
                fontFamily: 'UthmanicHafs',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          child: Divider(),
        ),
      ],
    );
  }
}
