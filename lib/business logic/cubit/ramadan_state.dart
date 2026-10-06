import '../../Util/app_imports.dart';



abstract class RamadanState {}

final class RamadanInitial extends RamadanState {
  RamadanInitial();
}
final class RamadanLoading extends RamadanState {
  RamadanLoading();
}

class RamadanLoaded extends RamadanState {
  final List<RamadanDay> days;
  RamadanLoaded(this.days);
}

final class RamadanError extends RamadanState {
  final String message;

  RamadanError(this.message);

  List<Object> get props => [message];
}
