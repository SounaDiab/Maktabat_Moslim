part of 'mafatih_aljinan_cubit.dart';

sealed class MafatihAljinanState extends Equatable {
  const MafatihAljinanState();

  @override
  List<Object> get props => [];
}

final class MafatihAljinanInitial extends MafatihAljinanState {
  const MafatihAljinanInitial();
}

final class MafatihAljinanLoading extends MafatihAljinanState {
  const MafatihAljinanLoading();
}

final class MafatihAljinanLoaded extends MafatihAljinanState {
  final List<MafatihAljinanModel> items;

  const MafatihAljinanLoaded(this.items);

  @override
  List<Object> get props => [items];
}

final class MafatihAljinanError extends MafatihAljinanState {
  final String message;

  const MafatihAljinanError(this.message);

  @override
  List<Object> get props => [message];
}


