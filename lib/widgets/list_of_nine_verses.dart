import 'package:flutter/material.dart';

class ListOfNineVerses extends StatefulWidget {
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
  State<ListOfNineVerses> createState() => _ListOfNineVersesState();
}

class _ListOfNineVersesState extends State<ListOfNineVerses> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return ListTile(
      title: widget.title == ''
          ? Container()
          : SelectableText(
              widget.title,
              style: TextStyle(
                fontSize: isTablet ? 40 : 18,
                fontWeight: FontWeight.w900,
                color: Colors.green,
                fontFamily: 'Tajawal',
              ),
            ),
      subtitle: SelectableText(
        textAlign: TextAlign.justify,
        widget.subtitle,
        style: TextStyle(
          fontSize: widget.subtitle ==
                  'وأمتنع بحول الله وقوته من حولهم وقوتهم وأستشفع برب الفلق من شر ما خلق وأعوذ بما شاء الله لا حول ولا قوة إلا بالله'
              ? widget.size + 2
              : widget.size,
          fontWeight: widget.subtitle ==
                  'وأمتنع بحول الله وقوته من حولهم وقوتهم وأستشفع برب الفلق من شر ما خلق وأعوذ بما شاء الله لا حول ولا قوة إلا بالله'
              ? FontWeight.w900
              : widget.weight,
          fontFamily: widget.subtitle.contains(RegExp(r'[0-9]'))
              ? 'UthmanicHafs'
              : 'Tajawal',
        ),
      ),
    );
  }
}
