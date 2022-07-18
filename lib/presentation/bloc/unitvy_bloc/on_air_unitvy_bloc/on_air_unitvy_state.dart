part of 'on_air_unitvy_bloc.dart';

abstract class OnAirUnitvyState extends Equatable {
  const OnAirUnitvyState();

  @override
  List<Object> get props => [];
}

class OnAirUnitvyEmpty extends OnAirUnitvyState {}

class OnAirUnitvyLoading extends OnAirUnitvyState {}

class OnAirUnitvyError extends OnAirUnitvyState {
  final String message;

  const OnAirUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class OnAirUnitvyLoaded extends OnAirUnitvyState {
  final List<Unitvy> result;

  const OnAirUnitvyLoaded(this.result);

  @override
  List<Object> get props => [result];
}