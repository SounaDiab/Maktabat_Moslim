import '../../Util/app_imports.dart';

class QiblaCubit extends Cubit<QiblaState> {
  StreamSubscription<QiblahDirection>? _subscription;

  QiblaCubit() : super(QiblaInitial());

  Future<void> initQibla() async {
    emit(QiblaLoading());

    // فحص GPS
    if (!await Geolocator.isLocationServiceEnabled()) {
      emit(QiblaLocationDisabled());
      return;
    }

    // فحص الإذن
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      emit(QiblaPermissionDenied());
      return;
    }

    // الاشتراك بالقبلة
    _subscription = FlutterQiblah.qiblahStream.listen(
      (direction) {
        emit(QiblaReady(direction));
      },
      onError: (e) {
        emit(QiblaError('حدث خطأ في تحديد القبلة'));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}