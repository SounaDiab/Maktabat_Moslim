import '../../Util/app_imports.dart';

part 'alsa7ifa_alsajadiya_state.dart';

class Alsa7ifaAlsajadiyaCubit extends Cubit<Alsa7ifaAlsajadiyaState> {
  final Repository repository;

  Alsa7ifaAlsajadiyaCubit(this.repository) : super(Alsa7ifaAlsajadiyaInitial());

  // جلب بيانات الحقيبة الرمضانية من الـ repository
  Future<void> getAlsa7ifaAlsajadiya() async {
    try {
      emit(Alsa7ifaAlsajadiyaLoading());
      final List<Alsa7ifaAlsajadiyaModel> a3malList =
          await repository.getAlsa7ifaAlsajadiya();
      emit(Alsa7ifaAlsajadiyaLoaded(a3malList));
    } catch (e) {
      emit(Alsa7ifaAlsajadiyaError(e.toString()));
    }
  }
}
