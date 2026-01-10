import '../../Util/app_imports.dart';

class TasbeehRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color secColor;
  final Color thirdColor;

  TasbeehRingPainter(
      {required this.color,
      required this.secColor,
      required this.thirdColor,
      required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 14;
    final secRadius = size.width / 2;
    final thirdRadius = size.width / 2 + 8;

    final bgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 16;
    final secPaint = Paint()
      ..color = secColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    final thirdPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    final borderPaint = Paint()
      ..color = thirdColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawCircle(center, radius, secPaint);
    canvas.drawCircle(center, secRadius, thirdPaint);
    canvas.drawCircle(center, thirdRadius, borderPaint);

    final gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: 2 * pi,
      colors: [
        thirdColor,
        thirdColor,
      ],
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      (2 * pi * progress),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}