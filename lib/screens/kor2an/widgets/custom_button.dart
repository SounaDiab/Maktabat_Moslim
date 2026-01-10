import '../../../Util/app_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isFilled = false,
    this.svgIcon,
    this.borderRadius = 5,
  }) : super(key: key);

  final bool isFilled;
  final String? svgIcon;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: isTablet ? 80 : 40,
        width: isTablet ? 120 : 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: text == 'إنتقال' ? Theme.of(context).primaryColor : Colors.red,
          border: isFilled
              ? null
              : Border.all(width: 2, color: Theme.of(context).cardColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIcon != null) ...[
              SvgPicture.asset(svgIcon!),
              const SizedBox(width: 5),
            ],
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
