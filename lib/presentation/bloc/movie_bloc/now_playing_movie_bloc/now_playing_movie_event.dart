part of 'now_playing_movie_bloc.dart';

class NowPlayingMovieGetEvent extends NowPlayingMovieEvent {}

abstract class NowPlayingMovieEvent extends Equatable {
  const NowPlayingMovieEvent();

  @override
  List<Object> get props => [];
}
