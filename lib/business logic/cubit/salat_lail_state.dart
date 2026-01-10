part of 'salat_lail_cubit.dart';

sealed class SalatLailState extends Equatable {
  const SalatLailState();

  @override
  List<Object> get props => [];
}

final class SalatLailInitial extends SalatLailState {
  const SalatLailInitial();
}

final class SalatLailLoading extends SalatLailState {
  const SalatLailLoading();
}

final class SalatLailLoaded extends SalatLailState {
  final List<SalatLailModel> items;

  const SalatLailLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class SalatLailError extends SalatLailState {
  final String message;

  const SalatLailError(this.message);

  @override
  List<Object> get props => [message];
}
