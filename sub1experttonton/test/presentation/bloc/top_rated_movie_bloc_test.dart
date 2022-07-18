
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'top_rated_movie_bloc_test.mocks.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_top_rated_movies.dart';

import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';

@GenerateMocks(
    [
      GetTopRatedMovies,
      TopRatedMovieBloc
    ]
)


void main() {
  late MockGetTopRatedMovies
  mockGetTopRatedMovies;

  late TopRatedMovieBloc
  topRatedMovieBloc;


  setUp(() {
    mockGetTopRatedMovies =
        MockGetTopRatedMovies();

    topRatedMovieBloc =
        TopRatedMovieBloc(
            mockGetTopRatedMovies);
    }
  );

  final movieList = <Movie>[];


  test("initial state should be empty", () {
    expect(topRatedMovieBloc.state,
        TopRatedMovieEmpty()
      );
    }
  );


  group('Top Rated Movies BLoC Test', () {
    blocTest<TopRatedMovieBloc,
        TopRatedMovieState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async =>
            Right(movieList)
        );

        return topRatedMovieBloc;
      },

      act: (bloc) => bloc.add(
          TopRatedMovieGetEvent()
      ),

      expect: () => [
        TopRatedMovieLoading(),
        TopRatedMovieLoaded(
            movieList)
      ],

      verify: (bloc) {
        verify(mockGetTopRatedMovies
            .execute()
        );
      },
    );

    blocTest<TopRatedMovieBloc,
        TopRatedMovieState>(
      'Should emit [Loading, Error] when get top rated is unsuccessful',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure'
              )
            )
        );

        return topRatedMovieBloc;
      },

      act: (bloc) => bloc.add(
          TopRatedMovieGetEvent()
      ),

      expect: () => [
        TopRatedMovieLoading(),
        const TopRatedMovieError(
            'Server Failure'
        )
      ],

      verify: (bloc) {
        verify(mockGetTopRatedMovies
            .execute()
          );
        },
      );
    },
  );
}