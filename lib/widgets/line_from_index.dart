// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LineFromIndex extends StatelessWidget {
  String? text;
  String route;

  LineFromIndex({
    Key? key,
    this.text,
    required this.route,
  }) : super(key: key);

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
                Expanded(
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
                text == 'حرز الرسول ص والائمة (ع)'
                    ? Padding(
                        padding: EdgeInsets.only(right: isTablet ? 200 : 50),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).iconTheme.color,
                          size: isTablet ? 50 : 20,
                        ),
                      )
                    : Container(),
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
