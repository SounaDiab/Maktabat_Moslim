import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/models/herz_almoujahidin.dart';
import '../../api/repository/repository.dart';

part 'herz_almoujahidin_state.dart';

class HerzAlmoujahidinCubit extends Cubit<HerzAlmoujahidinState> {
  final Repository repository;

  HerzAlmoujahidinCubit(this.repository) : super(HerzAlmoujahidinInitial());

  // جلب بيانات أعمال ليلة القدر من الـ repository
  Future<void> getHerzAlmoujahidin() async {
    try {
      emit(HerzAlmoujahidinLoading());
      final List<HerzAlmoujahidinModel> a3malList =
          await repository.getHerzAlmoujahidin();
      emit(HerzAlmoujahidinLoaded(a3malList));
    } catch (e) {
      emit(HerzAlmoujahidinError(e.toString()));
    }
  }
}
