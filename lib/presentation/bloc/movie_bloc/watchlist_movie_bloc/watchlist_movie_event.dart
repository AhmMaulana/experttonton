part of 'watchlist_movie_bloc.dart';

abstract class WatchlistMovieEvent extends Equatable {
  const WatchlistMovieEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends WatchlistMovieEvent {}

class GetStatusMovieEvent extends WatchlistMovieEvent {
  final int id;

  const GetStatusMovieEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetStatusUnitvyEvent extends WatchlistMovieEvent {
  final int id;

  const GetStatusUnitvyEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddItemMovieEvent extends WatchlistMovieEvent {
  final MovieDetail movieDetail;

  const AddItemMovieEvent(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}


class RemoveItemMovieEvent extends WatchlistMovieEvent {
  final MovieDetail movieDetail;

  const RemoveItemMovieEvent(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
