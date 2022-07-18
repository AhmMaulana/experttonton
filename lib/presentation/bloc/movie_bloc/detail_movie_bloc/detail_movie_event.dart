
part of 'detail_movie_bloc.dart';

class GetDetailMovieEvent extends DetailMovieEvent {
  final int id;

  const GetDetailMovieEvent(
      this.id);

  @override
  List<Object> get props => [];
}

abstract class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}
