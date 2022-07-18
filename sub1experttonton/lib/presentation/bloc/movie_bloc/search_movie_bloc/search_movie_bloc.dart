import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/domain/usecases/movie/search_movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({
    required this.searchMovies,
  }) : super(SearchMovieEmpty()) {
    on<SearchMovieSetEmpty>((event, emit) => emit(SearchMovieEmpty()));
    on<SearchMovieQueryEvent>((event, emit) async {
      emit(SearchMovieLoading());
      final result = await searchMovies.execute(event.query);
      result.fold(
            (failure) {
          emit(SearchMovieError(failure.message));
        },
            (data) {
          emit(SearchMovieLoaded(data));
        },
      );
    });
  }
}