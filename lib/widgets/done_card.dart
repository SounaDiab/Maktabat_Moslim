import '../../Util/app_imports.dart';

Widget doneCard(
  final String title,
  final Color color,
  final Color txtColor,
) {
  return Center(
    child: Transform.rotate(
      angle: -0.12,
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 240,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: txtColor,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "بارك الله فيك.",
                style: TextStyle(
                  color: txtColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
