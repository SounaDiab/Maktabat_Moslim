import 'package:flutter_qiblah/flutter_qiblah.dart';

abstract class QiblaState {}

class QiblaInitial extends QiblaState {}

class QiblaLoading extends QiblaState {}

class QiblaReady extends QiblaState {
  final QiblahDirection direction;
  QiblaReady(this.direction);
}

class QiblaPermissionDenied extends QiblaState {}

class QiblaLocationDisabled extends QiblaState {}

class QiblaError extends QiblaState {
  final String message;
  QiblaError(this.message);
}