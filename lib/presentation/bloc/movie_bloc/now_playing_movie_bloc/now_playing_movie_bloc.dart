
import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_now_playing_movies.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'now_playing_movie_state.dart';
part 'now_playing_movie_event.dart';

class NowPlayingMovieBloc
    extends Bloc<NowPlayingMovieEvent,
        NowPlayingMovieState> {

    final GetNowPlayingMovies
    getNowPlayingMovies;

  NowPlayingMovieBloc(
      this.getNowPlayingMovies,
      )
      : super(NowPlayingMovieEmpty()
  )
  {
    on<NowPlayingMovieGetEvent>(
            (event, emit) async {
            emit(NowPlayingMovieLoading()
      );

      final result = await
          getNowPlayingMovies.execute();
      result.fold(
            (failure) {

          emit(NowPlayingMovieError(
              failure.message)
          );
        },
             (data) {
            emit(NowPlayingMovieLoaded(data)
            );
          },
        );
      }
    );
  }
}