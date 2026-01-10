part of 'alsa7ifa_alsajadiya_cubit.dart';

sealed class Alsa7ifaAlsajadiyaState extends Equatable {
  const Alsa7ifaAlsajadiyaState();

  @override
  List<Object> get props => [];
}

final class Alsa7ifaAlsajadiyaInitial extends Alsa7ifaAlsajadiyaState {
  const Alsa7ifaAlsajadiyaInitial();
}

final class Alsa7ifaAlsajadiyaLoading extends Alsa7ifaAlsajadiyaState {
  const Alsa7ifaAlsajadiyaLoading();
}

final class Alsa7ifaAlsajadiyaLoaded extends Alsa7ifaAlsajadiyaState {
  final List<Alsa7ifaAlsajadiyaModel> items;

  const Alsa7ifaAlsajadiyaLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class Alsa7ifaAlsajadiyaError extends Alsa7ifaAlsajadiyaState {
  final String message;

  const Alsa7ifaAlsajadiyaError(this.message);

  @override
  List<Object> get props => [message];
}
