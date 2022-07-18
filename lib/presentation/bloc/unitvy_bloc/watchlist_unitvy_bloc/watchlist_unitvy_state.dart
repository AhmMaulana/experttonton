part of 'watchlist_unitvy_bloc.dart';

abstract class WatchlistUnitvyState extends Equatable {
  const WatchlistUnitvyState();

  @override
  List<Object> get props => [];
}

class WatchlistUnitvyEmpty extends WatchlistUnitvyState {}

class WatchlistUnitvyLoading extends WatchlistUnitvyState {}

class WatchlistUnitvyError extends WatchlistUnitvyState {
  final String message;

  const WatchlistUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistUnitvySuccess extends WatchlistUnitvyState {
  final String message;

  const WatchlistUnitvySuccess(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistUnitvyLoaded extends WatchlistUnitvyState {
  final List<Unitvy> result;

  const WatchlistUnitvyLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class WatchlistUnitvyStatusLoaded extends WatchlistUnitvyState {
  final bool result;

  const WatchlistUnitvyStatusLoaded(this.result);

  @override
  List<Object> get props => [result];
}