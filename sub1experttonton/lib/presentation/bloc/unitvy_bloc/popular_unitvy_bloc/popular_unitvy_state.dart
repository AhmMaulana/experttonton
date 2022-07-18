part of 'popular_unitvy_bloc.dart';

abstract class PopularUnitvyState extends Equatable {
  const PopularUnitvyState();

  @override
  List<Object> get props => [];
}

class PopularUnitvyEmpty extends PopularUnitvyState {}

class PopularUnitvyLoading extends PopularUnitvyState {}

class PopularUnitvyError extends PopularUnitvyState {
  final String message;

  const PopularUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class PopularUnitvyLoaded extends PopularUnitvyState {
  final List<Unitvy> result;

  const PopularUnitvyLoaded(this.result);

  @override
  List<Object> get props => [result];
}