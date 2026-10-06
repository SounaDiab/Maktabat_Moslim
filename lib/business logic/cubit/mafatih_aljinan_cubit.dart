import '../../Util/app_imports.dart';

part 'mafatih_aljinan_state.dart';

class MafatihAljinanCubit extends Cubit<MafatihAljinanState> {
  final Repository repository;

  List<MafatihAljinanModel>? _cachedData;

  MafatihAljinanCubit(this.repository) : super(MafatihAljinanInitial());

  Future<void> getMafatihAljinan() async {
    try {
      // 🔥 إذا البيانات موجودة لا تعيد تحميلها
      if (_cachedData != null) {
        emit(MafatihAljinanLoaded(_cachedData!));
        return;
      }

      emit(MafatihAljinanLoading());

      final data = await repository.getMafatihAljinan();

      _cachedData = data; // 🔥 تخزين في الذاكرة

      emit(MafatihAljinanLoaded(data));
    } catch (e) {
      emit(MafatihAljinanError(e.toString()));
    }
  }
}
