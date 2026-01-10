import '../../Util/app_imports.dart';

part 'salat_lail_state.dart';

class SalatLailCubit extends Cubit<SalatLailState> {
  final Repository repository;

  SalatLailCubit(this.repository) : super(SalatLailInitial());

  // جلب بيانات الحقيبة الرمضانية من الـ repository
  Future<void> getSalatLail() async {
    try {
      emit(SalatLailLoading());
      final List<SalatLailModel> a3malList =
          await repository.getSalatLail();
      emit(SalatLailLoaded(a3malList));
    } catch (e) {
      emit(SalatLailError(e.toString()));
    }
  }
}
