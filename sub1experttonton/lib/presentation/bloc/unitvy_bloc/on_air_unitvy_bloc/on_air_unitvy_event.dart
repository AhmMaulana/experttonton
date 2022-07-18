part of 'on_air_unitvy_bloc.dart';

abstract class OnAirUnitvyEvent extends Equatable {
  const OnAirUnitvyEvent();

  @override
  List<Object> get props => [];
}

class OnAirUnitvyGetEvent extends OnAirUnitvyEvent {}