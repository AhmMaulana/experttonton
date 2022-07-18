
import 'popular_movie_bloc_test.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_popular_movies.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/popular_movie_bloc/popular_movie_bloc.dart';

import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/domain/entities/movie/movie.dart';


@GenerateMocks(
    [
      PopularMovieBloc,
      GetPopularMovies
    ]
)


void main() {
  late MockGetPopularMovies
       mockGetPopularMovies;

  late PopularMovieBloc
       popularMovieBloc;

  setUp(() {
    mockGetPopularMovies =
        MockGetPopularMovies();

    popularMovieBloc =
        PopularMovieBloc(
            mockGetPopularMovies
        );
    }
  );

  final movieList = <Movie>[];


  test("initial state should be empty", () {
    expect(popularMovieBloc.state,
        PopularMovieEmpty()
      );
    }
  );


  group('Popular Movies BLoC Test', () {
    blocTest<PopularMovieBloc,
        PopularMovieState>(
        'Should emit [loading, loaded] when data is loaded successfully',
        build: () {
          when(mockGetPopularMovies.execute())
              .thenAnswer((_) async =>
              Right(movieList)
          );

          return popularMovieBloc;
        },

        act: (bloc) => bloc.add(PopularMovieGetEvent()
        ),

        expect: () => [PopularMovieLoading(),
          PopularMovieLoaded(
              movieList)
        ],

        verify: (bloc) {
          verify(mockGetPopularMovies
              .execute()
          );
          }
        );

    blocTest<PopularMovieBloc,
        PopularMovieState>(
        'Should emit [loading, error] when data is failed to loaded',
        build: () {
          when(mockGetPopularMovies.execute())
              .thenAnswer((_) async =>
              const Left(ServerFailure(
                  'Server Failure'
                )
              )
          );

          return popularMovieBloc;
        },

        act: (bloc) => bloc.add(
            PopularMovieGetEvent()
        ),

        expect: () => [
          PopularMovieLoading(),
          const PopularMovieError(
              'Server Failure'
          )
        ],

        verify: (bloc) {
          verify(mockGetPopularMovies
              .execute()
            );
          }
        );
    }
  );
}
