part of 'popular_unitvy_bloc.dart';

abstract class PopularUnitvyEvent extends Equatable {
  const PopularUnitvyEvent();

  @override
  List<Object> get props => [];
}

class PopularUnitvyGetEvent extends PopularUnitvyEvent {}