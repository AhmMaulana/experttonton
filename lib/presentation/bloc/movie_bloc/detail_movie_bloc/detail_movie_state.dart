part of 'detail_movie_bloc.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieLoading extends
      DetailMovieState {}

class DetailMovieEmpty extends
      DetailMovieState {}

class DetailMovieError extends
      DetailMovieState {
  final String message;

  const DetailMovieError(
      this.message);

  @override
  List<Object> get props => [message];
}

class DetailMovieLoaded extends DetailMovieState {
  final MovieDetail movieDetail;

  const DetailMovieLoaded(
      this.movieDetail);

  @override
  List<Object> get props =>
      [movieDetail];
}