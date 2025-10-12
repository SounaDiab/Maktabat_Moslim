import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/models/a3mal_laylat_kader.dart';
import '../../api/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'a3mal_laylat_alkader_state.dart';

class A3malLaylatAlkaderCubit extends Cubit<A3malLaylatAlkaderState> {
  final Repository repository;

  A3malLaylatAlkaderCubit(this.repository) : super(A3malLaylatAlkaderInitial());

  // جلب بيانات أعمال ليلة القدر من الـ repository
  Future<void> getA3malLaylatAlkader() async {
    try {
      emit(A3malLaylatAlkaderLoading());
      final List<A3malLaylatKader> a3malList =
          await repository.getA3malLaylatAlkader();
      emit(A3malLaylatAlkaderLoaded(a3malList));
    } catch (e) {
      emit(A3malLaylatAlkaderError(e.toString()));
    }
  }
}
