part of 'a3mal_laylat_alkader_cubit.dart';


@immutable
sealed class A3malLaylatAlkaderState extends Equatable {
  const A3malLaylatAlkaderState();

  @override
  List<Object?> get props => [];
}

final class A3malLaylatAlkaderInitial extends A3malLaylatAlkaderState {
  const A3malLaylatAlkaderInitial();
}

final class A3malLaylatAlkaderLoading extends A3malLaylatAlkaderState {
  const A3malLaylatAlkaderLoading();
}

final class A3malLaylatAlkaderLoaded extends A3malLaylatAlkaderState {
  final List<A3malLaylatKader> items;

  const A3malLaylatAlkaderLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class A3malLaylatAlkaderError extends A3malLaylatAlkaderState {
  final String message;

  const A3malLaylatAlkaderError(this.message);

  @override
  List<Object> get props => [message];
}
