part of 'top_rated_unitvy_bloc.dart';

abstract class TopRatedUnitvyEvent extends Equatable {
  const TopRatedUnitvyEvent();

  @override
  List<Object> get props => [];
}

class TopRatedUnitvyGetEvent extends TopRatedUnitvyEvent {}