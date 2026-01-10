import '../../../../Util/app_imports.dart';

class InfoText extends StatelessWidget {
  const InfoText(
      {Key? key,
      required this.text,
      this.svgIcon,
      this.color = Colors.white,
      this.padding = 5})
      : super(key: key);

  final String? svgIcon;
  final String text;
  final Color color;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Container(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          if (svgIcon != null) ...[
            SvgPicture.asset(
              svgIcon!,
              color: Theme.of(context).iconTheme.color,
            ),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: isTablet ? 20 : 12,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.labelMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
