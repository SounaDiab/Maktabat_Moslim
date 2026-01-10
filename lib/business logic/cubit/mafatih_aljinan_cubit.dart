import '../../Util/app_imports.dart';

part 'mafatih_aljinan_state.dart';




class MafatihAljinanCubit extends Cubit<MafatihAljinanState> {
  final Repository repository;

  MafatihAljinanCubit(this.repository) : super(MafatihAljinanInitial());

  // جلب بيانات الحقيبة الرمضانية من الـ repository
  Future<void> getMafatihAljinan() async {
    try {
      emit(MafatihAljinanLoading());
      final List<MafatihAljinanModel> a3malList =
          await repository.getMafatihAljinan();
      emit(MafatihAljinanLoaded(a3malList));
    } catch (e) {
      emit(MafatihAljinanError(e.toString()));
    }
  }
}