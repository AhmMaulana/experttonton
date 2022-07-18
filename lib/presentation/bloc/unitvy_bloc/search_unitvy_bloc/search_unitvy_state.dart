part of 'search_unitvy_bloc.dart';

abstract class SearchUnitvyState extends Equatable {
  const SearchUnitvyState();

  @override
  List<Object> get props => [];
}

class SearchUnitvyEmpty extends SearchUnitvyState {}

class SearchUnitvyLoading extends SearchUnitvyState {}

class SearchUnitvyError extends SearchUnitvyState {
  final String message;

  const SearchUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchUnitvyLoaded extends SearchUnitvyState {
  final List<Unitvy> result;

  const SearchUnitvyLoaded(this.result);

  @override
  List<Object> get props => [result];
}