part of 'alhakiba_alramadaneya_cubit.dart';

sealed class AlhakibaAlramadaneyaState extends Equatable {
  const AlhakibaAlramadaneyaState();

  @override
  List<Object> get props => [];
}

final class AlhakibaAlramadaneyaInitial extends AlhakibaAlramadaneyaState {
  const AlhakibaAlramadaneyaInitial();
}

final class AlhakibaAlramadaneyaLoading extends AlhakibaAlramadaneyaState {
  const AlhakibaAlramadaneyaLoading();
}

final class AlhakibaAlramadaneyaLoaded extends AlhakibaAlramadaneyaState {
  final List<AlhakibaAlramadaneyaModel> items;

  const AlhakibaAlramadaneyaLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class AlhakibaAlramadaneyaError extends AlhakibaAlramadaneyaState {
  final String message;

  const AlhakibaAlramadaneyaError(this.message);

  @override
  List<Object> get props => [message];
}