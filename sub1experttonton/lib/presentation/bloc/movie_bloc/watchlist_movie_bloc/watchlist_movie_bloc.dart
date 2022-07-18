import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/domain/entities/movie/movie_detail.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:sub1experttonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:sub1experttonton/domain/usecases/movie/save_watchlist.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchlistMovies getWatchlistMovies;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  WatchlistMovieBloc({
    required this.getWatchlistMovies,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(WatchlistMovieEmpty()) {
    on<GetListEvent>((event, emit) async {
      emit(WatchlistMovieLoading());
      final result = await getWatchlistMovies.execute();

      result.fold(
            (failure) {
          emit(WatchlistMovieError(failure.message));
        },
            (data) {
          emit(WatchlistMovieLoaded(data));
        },
      );
    });

    on<GetStatusMovieEvent>((event, emit) async {
      final result = await getWatchListStatus.execute(event.id);

      emit(WatchlistMovieStatusLoaded(result));
    });

    on<AddItemMovieEvent>((event, emit) async {
      final movieDetail = event.movieDetail;
      final result = await saveWatchlist.execute(movieDetail);
      result.fold(
            (failure) {
          emit(WatchlistMovieError(failure.message));
        },
            (successMessage) {
          emit(WatchlistMovieSuccess(successMessage));
        },
      );
    });

    on<RemoveItemMovieEvent>((event, emit) async {
      final movieDetail = event.movieDetail;
      final result = await removeWatchlist.execute(movieDetail);

      result.fold(
            (failure) {
          emit(WatchlistMovieError(failure.message));
        },
            (successMessage) {
          emit(WatchlistMovieSuccess(successMessage));
        },
      );
    });
  }
}