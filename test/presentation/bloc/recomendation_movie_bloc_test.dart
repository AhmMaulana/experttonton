import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'recomendation_movie_bloc_test.mocks.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:dartz/dartz.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_movie_recommendations.dart';

import 'package:sub1experttonton/presentation/bloc/movie_bloc/recommendation_movie_bloc/recommendation_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';


@GenerateMocks(
    [
      RecommendationMovieBloc,
      GetMovieRecommendations
    ]
)


void main() {
  late MockGetMovieRecommendations
       mockGetMovieRecommendation;

  late RecommendationMovieBloc
       recommendationMovieBloc;

  setUp(() {
    mockGetMovieRecommendation =
        MockGetMovieRecommendations();

    recommendationMovieBloc =
        RecommendationMovieBloc(
      getMovieRecommendations:
      mockGetMovieRecommendation,
      );
    }
  );

  test("initial state should be empty", () {
    expect(recommendationMovieBloc.state,
        RecommendationMovieEmpty()
      );
    }
  );

  const movieId = 1;
  final movieList = <Movie>[];


  blocTest<RecommendationMovieBloc,
      RecommendationMovieState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetMovieRecommendation
          .execute(movieId)
      )
          .thenAnswer((_) async =>
          Right(movieList)
      );

      return recommendationMovieBloc;
    },
    act: (bloc) => bloc.add(
        const GetRecommendationMovieEvent(movieId)
    ),

    expect: () => [
      RecommendationMovieLoading(),
      RecommendationMovieLoaded(
          movieList)
    ],

    verify: (bloc) {
      verify(mockGetMovieRecommendation
          .execute(movieId)
      );
    },
  );


  group('Recommendation Movies BLoC Test', () {
    blocTest<RecommendationMovieBloc,
        RecommendationMovieState>(
      'Should emit [Loading, Error] when get recommendation is unsuccessful',
      build: () {
        when(mockGetMovieRecommendation
            .execute(movieId)
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure'
              )
            )
        );
        return recommendationMovieBloc;
      },

      act: (bloc) => bloc.add(
          const GetRecommendationMovieEvent(
              movieId)
      ),

      expect: () => [
        RecommendationMovieLoading(),
        const RecommendationMovieError(
            'Server Failure'
        )
      ],

      verify: (bloc) {
        verify(mockGetMovieRecommendation
            .execute(movieId)
        );
      },
    );
  },
  );
}