import '../../Util/app_imports.dart';

class QiblaCompass extends StatefulWidget {
  final QiblahDirection direction;

  const QiblaCompass({super.key, required this.direction});

  @override
  State<QiblaCompass> createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  double? calculatedQiblah;
  Position? currentPosition;
  bool isLoadingLocation = false;
  String? locationError;

  @override
  Widget build(BuildContext context) {
    // استخدام الاتجاه المحسوب إذا كان متاحاً، وإلا استخدام الاتجاه الافتراضي
    double qiblahAngle = calculatedQiblah ?? widget.direction.qiblah;

    // حساب زاوية الدوران الصحيحة
    double rotationAngle =
        (qiblahAngle - widget.direction.direction) * (pi / 180);

    // زاوية القبلة مضبوطة بين 0 و 360
    double normalizedQiblah = qiblahAngle % 360;
    if (normalizedQiblah < 0) normalizedQiblah += 360;

    // اتجاه الهاتف الحالي
    double normalizedDirection = widget.direction.direction % 360;
    if (normalizedDirection < 0) normalizedDirection += 360;

    // الفرق بين اتجاه القبلة واتجاه الهاتف
    double difference = (normalizedQiblah - normalizedDirection + 360) % 360;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'وجّه هاتفك نحو القبلة',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),

          // زر تحديد الموقع
          ElevatedButton.icon(
            onPressed: isLoadingLocation ? null : _getCurrentLocation,
            icon: isLoadingLocation
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Theme.of(context).dividerColor,
                    ),
                  )
                : Icon(
                    Icons.my_location,
                    color: Theme.of(context).dividerColor,
                  ),
            label: Text(
              isLoadingLocation ? 'جاري تحديد الموقع...' : 'تحديد موقعي',
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).indicatorColor,
            ),
          ),

          // عرض معلومات الموقع
          if (currentPosition != null) ...[
            const SizedBox(height: 8),
            Text(
              'الموقع: ${currentPosition!.latitude.toStringAsFixed(4)}°, ${currentPosition!.longitude.toStringAsFixed(4)}°',
              style: TextStyle(
                color: Theme.of(context).canvasColor,
                fontSize: 12,
              ),
            ),
          ],

          // عرض خطأ الموقع
          if (locationError != null) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                locationError!,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],

          const SizedBox(height: 32),

          // البوصلة الدوارة
          Transform.rotate(
            angle: rotationAngle,
            child: Image.asset(
              'assets/islamic_icons/qibla-compass.png',
              width: 260,
              height: 260,
              color: Theme.of(context).primaryColorLight,
            ),
          ),

          const SizedBox(height: 24),

          // عرض المعلومات
          Column(
            children: [
              Text(
                'اتجاه القبلة: ${normalizedQiblah.toStringAsFixed(1)}°',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 12),
              Text(
                _getDirectionText(difference),
                style: difference < 10
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // دالة لحساب اتجاه القبلة من الموقع الحالي
  double calculateQiblaDirection(double latitude, double longitude) {
    // إحداثيات الكعبة المشرفة
    const double makkahLat = 21.4225;
    const double makkahLng = 39.8262;

    // تحويل الدرجات إلى راديان
    double lat1 = latitude * pi / 180;
    double lat2 = makkahLat * pi / 180;
    double dLng = (makkahLng - longitude) * pi / 180;

    // حساب الاتجاه باستخدام صيغة Haversine
    double y = sin(dLng) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLng);
    double bearing = atan2(y, x);

    // تحويل من راديان إلى درجات
    double qiblahDirection = (bearing * 180 / pi + 360) % 360;

    return qiblahDirection;
  }

  // دالة للحصول على الموقع الحالي
  Future<void> _getCurrentLocation() async {
    setState(() {
      isLoadingLocation = true;
      locationError = null;
    });

    try {
      // التحقق من تفعيل خدمات الموقع
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          locationError = 'خدمات الموقع غير مفعلة. يرجى تفعيلها من الإعدادات.';
          isLoadingLocation = false;
        });
        return;
      }

      // التحقق من الأذونات
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            locationError = 'تم رفض أذونات الموقع.';
            isLoadingLocation = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          locationError =
              'أذونات الموقع مرفوضة نهائياً. يرجى تفعيلها من إعدادات التطبيق.';
          isLoadingLocation = false;
        });
        return;
      }

      // الحصول على الموقع الحالي بدقة عالية
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // حساب اتجاه القبلة
      double qiblah = calculateQiblaDirection(
        position.latitude,
        position.longitude,
      );

      setState(() {
        currentPosition = position;
        calculatedQiblah = qiblah;
        isLoadingLocation = false;
      });

      // عرض رسالة نجاح
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'تم تحديد اتجاه القبلة: ${qiblah.toStringAsFixed(1)}°',
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      setState(() {
        locationError = 'حدث خطأ في تحديد الموقع: ${e.toString()}';
        isLoadingLocation = false;
      });
    }
  }

  String _getDirectionText(double difference) {
    if (difference < 5 || difference > 355) {
      return '✓ أنت في الاتجاه الصحيح';
    } else if (difference > 0 && difference < 180) {
      return 'استدر يميناً ${difference.toStringAsFixed(0)}°';
    } else {
      return 'استدر يساراً ${(360 - difference).toStringAsFixed(0)}°';
    }
  }
}
