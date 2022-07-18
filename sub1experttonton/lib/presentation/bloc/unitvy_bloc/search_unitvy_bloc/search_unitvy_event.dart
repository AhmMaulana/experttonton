part of 'search_unitvy_bloc.dart';

abstract class SearchUnitvyEvent extends Equatable {
  const SearchUnitvyEvent();

  @override
  List<Object> get props => [];
}

class SearchUnitvySetEmpty extends SearchUnitvyEvent {}

class SearchUnitvyQueryEvent extends SearchUnitvyEvent {
  final String query;

  const SearchUnitvyQueryEvent(this.query);

  @override
  List<Object> get props => [];
}