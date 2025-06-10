import 'package:flutter/material.dart';

class LineFromIndexForRasoulWal2a2ima extends StatelessWidget {
  String? text;
  String route;
  IconData icon;

  LineFromIndexForRasoulWal2a2ima(
      {required this.text, required this.route, required this.icon});

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
            child: Row(
              children: [
                Text(
                  '$text',
                  // style: Theme.of(context).textTheme.bodyLarge,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontSize: isTablet ? 40 : 16,
                    fontFamily: 'UthmanicHafs',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: isTablet ? 200 : 50),
                  child: Icon(
                    icon,
                    color: Theme.of(context).iconTheme.color,
                    size: isTablet ? 50 : 30,
                  ),
                )
              ],
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
