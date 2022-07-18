
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_recomendations.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/recommendation_unitvy_bloc/recommendation_unitvy_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'recomendation_unitvy_bloc_test.mocks.dart';


@GenerateMocks(
    [
      RecommendationUnitvyBloc,
      GetUnitvyRecommendations
    ]
)


void main() {
  late MockGetUnitvyRecommendations
  mockGetUnitvyRecommendation;

  late RecommendationUnitvyBloc
  recommendationUnitvyBloc;

  setUp(() {
    mockGetUnitvyRecommendation =
        MockGetUnitvyRecommendations();

    recommendationUnitvyBloc =
        RecommendationUnitvyBloc(
      getUnitvyRecommendations: mockGetUnitvyRecommendation,
    );
  }
  );

  test("initial state should be empty", () {
    expect(recommendationUnitvyBloc.state,
        RecommendationUnitvyEmpty()
      );
    }
  );

  const unitvyId = 1;
  final unitvyList = <Unitvy>[];

  blocTest<RecommendationUnitvyBloc,
      RecommendationUnitvyState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetUnitvyRecommendation
          .execute(unitvyId)
      )
          .thenAnswer((_) async =>
          Right(unitvyList)
      );
      return recommendationUnitvyBloc;
    },

    act: (bloc) => bloc.add(
        const GetRecommendationUnitvyEvent(
            unitvyId)
    ),
    expect: () => [
      RecommendationUnitvyLoading(),
      RecommendationUnitvyLoaded(
          unitvyList)
    ],

    verify: (bloc) {
      verify(mockGetUnitvyRecommendation
          .execute(unitvyId)
      );
    },
  );


  group('Recommendation Tv BLoC Test', () {
    blocTest<RecommendationUnitvyBloc,
        RecommendationUnitvyState>(
      'Should emit [Loading, Error] when get recommendation is unsuccessful',
      build: () {
        when(mockGetUnitvyRecommendation
            .execute(unitvyId)
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure'
              )
            )
        );

        return recommendationUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          const GetRecommendationUnitvyEvent(
              unitvyId)
      ),

      expect: () => [
        RecommendationUnitvyLoading(),
        const RecommendationUnitvyError(
            'Server Failure'
        )
      ],

      verify: (bloc) {
        verify(mockGetUnitvyRecommendation
            .execute(unitvyId)
        );
      },
    );
  },
  );
}