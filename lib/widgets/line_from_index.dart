// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../Util/app_imports.dart';

class LineFromIndex extends StatelessWidget {
  String? text;
  String route;
  final bool showIcon;

  LineFromIndex({
    Key? key,
    this.text,
    required this.route,
    this.showIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 3,
        shadowColor: Theme.of(context).shadowColor,
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 40 : 20,
            vertical: isTablet ? 40 : 20,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: isTablet ? 20 : 10),
                  child: SvgPicture.asset(
                    'assets/icons/douaa.svg',
                    // width: 25,
                    height: isTablet ? 40 : 25,
                    color: Theme.of(context).iconTheme.color,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Text(
                    text ?? '', // استخدام قيمة افتراضية إذا كان text null
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                if (showIcon) // استخدام if بدلاً من شرط معقد
                  Padding(
                    padding: EdgeInsets.only(right: isTablet ? 200 : 50),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).iconTheme.color,
                      size: isTablet ? 50 : 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
