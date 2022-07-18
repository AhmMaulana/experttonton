part of 'top_rated_unitvy_bloc.dart';

abstract class TopRatedUnitvyState extends Equatable {
  const TopRatedUnitvyState();

  @override
  List<Object> get props => [];
}

class TopRatedUnitvyEmpty extends TopRatedUnitvyState {}

class TopRatedUnitvyLoading extends TopRatedUnitvyState {}

class TopRatedUnitvyError extends TopRatedUnitvyState {
  final String message;

  const TopRatedUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class TopRatedUnitvyLoaded extends TopRatedUnitvyState {
  final List<Unitvy> result;

  const TopRatedUnitvyLoaded(this.result);

  @override
  List<Object> get props => [result];
}