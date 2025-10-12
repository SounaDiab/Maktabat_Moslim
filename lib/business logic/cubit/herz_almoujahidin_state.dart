part of 'herz_almoujahidin_cubit.dart';

sealed class HerzAlmoujahidinState extends Equatable {
  const HerzAlmoujahidinState();

  @override
  List<Object> get props => [];
}

final class HerzAlmoujahidinInitial extends HerzAlmoujahidinState {
  const HerzAlmoujahidinInitial();
}

final class HerzAlmoujahidinLoading extends HerzAlmoujahidinState {
  const HerzAlmoujahidinLoading();
}

final class HerzAlmoujahidinLoaded extends HerzAlmoujahidinState {
  final List<HerzAlmoujahidinModel> items;

  const HerzAlmoujahidinLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class HerzAlmoujahidinError extends HerzAlmoujahidinState {
  final String message;

  const HerzAlmoujahidinError(this.message);

  @override
  List<Object> get props => [message];
}
