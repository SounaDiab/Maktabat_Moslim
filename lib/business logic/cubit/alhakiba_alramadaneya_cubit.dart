import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/models/alhakiba_alramadaneya.dart';
import '../../api/repository/repository.dart';

part 'alhakiba_alramadaneya_state.dart';

class AlhakibaAlramadaneyaCubit extends Cubit<AlhakibaAlramadaneyaState> {
  final Repository repository;

  AlhakibaAlramadaneyaCubit(this.repository) : super(AlhakibaAlramadaneyaInitial());

  // جلب بيانات الحقيبة الرمضانية من الـ repository
  Future<void> getAlhakibaAlramadaneya() async {
    try {
      emit(AlhakibaAlramadaneyaLoading());
      final List<AlhakibaAlramadaneyaModel> a3malList =
          await repository.getAlhakibaAlramadaneya();
      emit(AlhakibaAlramadaneyaLoaded(a3malList));
    } catch (e) {
      emit(AlhakibaAlramadaneyaError(e.toString()));
    }
  }
}