import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPrimary,
    required this.text,
    required this.onPressed,
    this.isFilled = false,
    this.primary,
    this.svgIcon,
    this.borderRadius = 5,
  }) : super(key: key);

  final bool isFilled;
  final Color? primary;
  final Color onPrimary;
  final String? svgIcon;
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final textStyle = TextStyle(
      color: onPrimary,
      fontSize: isTablet ? 30 : 15,
    );
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: isTablet ? 80 : 40,
        width: isTablet ? 120 : 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: primary,
          border: isFilled ? null : Border.all(width: 2, color: onPrimary),
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
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
