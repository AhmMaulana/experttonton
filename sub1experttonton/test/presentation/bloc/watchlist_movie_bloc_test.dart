
import 'watchlist_movie_bloc_test.mocks.dart';
import '../../dummy_data/movie/dummy_objects.dart';

import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_status.dart';

import 'package:sub1experttonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/watchlist_movie_bloc/watchlist_movie_bloc.dart';

import 'package:sub1experttonton/domain/usecases/movie/save_watchlist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_movies.dart';


@GenerateMocks(
    [
      WatchlistMovieBloc,
      GetWatchlistMovies,
      GetWatchListStatus,
      RemoveWatchlist,
      SaveWatchlist]
)


void main() {
  late MockGetWatchlistMovies
      mockGetWatchlistMovies;

  late MockGetWatchListStatus
      mockGetWatchListStatus;

  late MockSaveWatchlist
      mockSaveWatchlist;

  late MockRemoveWatchlist
      mockRemoveWatchlist;

  late WatchlistMovieBloc
      watchlistMovieBloc;

  setUp(() {
    mockGetWatchlistMovies =
        MockGetWatchlistMovies();

    mockGetWatchListStatus =
        MockGetWatchListStatus();

    mockSaveWatchlist =
        MockSaveWatchlist();

    mockRemoveWatchlist =
        MockRemoveWatchlist();

    watchlistMovieBloc =
        WatchlistMovieBloc(

      getWatchlistMovies:
          mockGetWatchlistMovies,

      getWatchListStatus:
          mockGetWatchListStatus,

      saveWatchlist:
          mockSaveWatchlist,

      removeWatchlist:
          mockRemoveWatchlist,
      );
    }
  );

  const movieId = 1;

  test("initial state should be empty", () {
    expect(watchlistMovieBloc.state,
        WatchlistMovieEmpty()
      );
    }
  );


  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async =>
          Right(testWatchlistMovieList)
      );

      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(GetListEvent()),
    expect: () => [
      WatchlistMovieLoading(),
      WatchlistMovieLoaded(
          testWatchlistMovieList)],
    verify: (bloc) {
      verify(mockGetWatchlistMovies.execute());
    },
  );


  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async =>const Left(
          ServerFailure(
              "Can't get data"
          )
        )
      );

      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(GetListEvent()),
    expect: () => [
      WatchlistMovieLoading(),
      const WatchlistMovieError(
          "Can't get data"
      )
    ],

    verify: (bloc) {
      verify(mockGetWatchlistMovies
          .execute()
      );
    },
  );

  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [Loaded] when get status movie watchlist is successful',
    build: () {
      when(mockGetWatchListStatus
          .execute(movieId)
      )
          .thenAnswer((_) async => true);
      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(const GetStatusMovieEvent(
        movieId)
    ),

    expect: () => [const WatchlistMovieStatusLoaded(
        true)
    ],

    verify: (bloc) {
      verify(mockGetWatchListStatus
          .execute(movieId)
      );
    },
  );


  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [success] when add movie item to watchlist is successful',
    build: () {
      when(mockSaveWatchlist
          .execute(testMovieDetail)
      )
          .thenAnswer((_) async =>
          const Right(
              "Success")
      );

      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(
        const AddItemMovieEvent(
            testMovieDetail
        )
    ),

    expect: () => [const WatchlistMovieSuccess(
        "Success"
      )
    ],

    verify: (bloc) {
      verify(mockSaveWatchlist
          .execute(testMovieDetail)
      );
    },
  );

  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [success] when remove movie item to watchlist is successful',
    build: () {
      when(mockRemoveWatchlist
          .execute(testMovieDetail)
      )
          .thenAnswer((_) async =>
          const Right("Removed")
      );

      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(
        const RemoveItemMovieEvent(
            testMovieDetail)
    ),

    expect: () => [
      const WatchlistMovieSuccess(
          "Removed"
      )
    ],

    verify: (bloc) {
      verify(mockRemoveWatchlist
          .execute(testMovieDetail)
      );
    },
  );


  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [error] when add movie item to watchlist is unsuccessful',
    build: () {
      when(mockSaveWatchlist
          .execute(testMovieDetail)
      )
          .thenAnswer((_) async =>
          const Left(DatabaseFailure(
              'Failed')
          )
      );

      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(
        const AddItemMovieEvent(testMovieDetail)
    ),

    expect: () => [const WatchlistMovieError(
        "Failed"
      )
    ],

    verify: (bloc) {
      verify(mockSaveWatchlist
          .execute(testMovieDetail)
      );
    },
  );

  blocTest<WatchlistMovieBloc,
      WatchlistMovieState>(
    'Should emit [error] when remove movie item to watchlist is unsuccessful',
    build: () {
      when(mockRemoveWatchlist
          .execute(testMovieDetail)
      )
          .thenAnswer((_) async =>
          const Left(DatabaseFailure(
              'Failed'
            )
          )
      );
      return watchlistMovieBloc;
    },

    act: (bloc) => bloc.add(
        const RemoveItemMovieEvent(testMovieDetail)
    ),

    expect: () => [const WatchlistMovieError(
        "Failed")
    ],

    verify: (bloc) {
      verify(mockRemoveWatchlist
          .execute(testMovieDetail)
      );
    },
  );
}