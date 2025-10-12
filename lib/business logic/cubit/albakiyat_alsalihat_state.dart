part of 'albakiyat_alsalihat_cubit.dart';

sealed class AlbakiyatAlsalihatState extends Equatable {
  const AlbakiyatAlsalihatState();

  @override
  List<Object> get props => [];
}

final class AlbakiyatAlsalihatInitial extends AlbakiyatAlsalihatState {
  const AlbakiyatAlsalihatInitial();
}

final class AlbakiyatAlsalihatLoading extends AlbakiyatAlsalihatState {
  const AlbakiyatAlsalihatLoading();
}

final class AlbakiyatAlsalihatLoaded extends AlbakiyatAlsalihatState {
  final List<AlbakiyatAlsalihatModel> items;

  const AlbakiyatAlsalihatLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class AlbakiyatAlsalihatError extends AlbakiyatAlsalihatState {
  final String message;

  const AlbakiyatAlsalihatError(this.message);

  @override
  List<Object> get props => [message];
}

