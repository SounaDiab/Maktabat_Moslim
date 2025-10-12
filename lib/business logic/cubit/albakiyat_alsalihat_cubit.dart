import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/models/albakiyat_alsalihat.dart';
import '../../api/repository/repository.dart';

part 'albakiyat_alsalihat_state.dart';

class AlbakiyatAlsalihatCubit extends Cubit<AlbakiyatAlsalihatState> {
  final Repository repository;

  AlbakiyatAlsalihatCubit(this.repository) : super(AlbakiyatAlsalihatInitial());

  // جلب بيانات أعمال ليلة القدر من الـ repository
  Future<void> getAlbakiyatAlsalihat() async {
    try {
      emit(AlbakiyatAlsalihatLoading());
      final List<AlbakiyatAlsalihatModel> a3malList =
          await repository.getAlbakiyatAlsalihat();
      emit(AlbakiyatAlsalihatLoaded(a3malList));
    } catch (e) {
      emit(AlbakiyatAlsalihatError(e.toString()));
    }
  }
}
