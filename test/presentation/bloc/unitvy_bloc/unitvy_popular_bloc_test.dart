
import 'package:sub1experttonton/domain/usecases/unitvy/get_popular_unitvy.dart';
import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:mockito/annotations.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/popular_unitvy_bloc/popular_unitvy_bloc.dart';

import 'package:mockito/mockito.dart';
import 'unitvy_popular_bloc_test.mocks.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateMocks(
    [
      GetPopularUnitvy,
      PopularUnitvyBloc
    ]
)


void main() {
  late MockGetPopularUnitvy mockGetPopularUnitvy;
  late PopularUnitvyBloc popularUnitvyBloc;

  setUp(() {
    mockGetPopularUnitvy = MockGetPopularUnitvy();
    popularUnitvyBloc = PopularUnitvyBloc(mockGetPopularUnitvy);
    }
  );

  final unitvyList = <Unitvy>[];

  test("initial state should be empty", () {
    expect(popularUnitvyBloc.state, PopularUnitvyEmpty());
  });

  group('Popular Tv BLoC Test', () {
    blocTest<PopularUnitvyBloc,
        PopularUnitvyState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetPopularUnitvy.execute())
            .thenAnswer((_) async => Right(unitvyList));
        return popularUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          PopularUnitvyGetEvent()
      ),

      expect: () => [PopularUnitvyLoading(),
        PopularUnitvyLoaded(unitvyList)],
      verify: (bloc) {
        verify(mockGetPopularUnitvy.execute()
        );
      },
    );

    blocTest<PopularUnitvyBloc, PopularUnitvyState>(
      'Should emit [Loading, Error] when get popular is unsuccessful',
      build: () {
        when(mockGetPopularUnitvy.execute())
            .thenAnswer((_) async =>
            const Left(ServerFailure('Server Failure')
            )
        );
        return popularUnitvyBloc;
      },
      act: (bloc) => bloc.add(PopularUnitvyGetEvent()),
      expect: () => [PopularUnitvyLoading(),
        const PopularUnitvyError(
            'Server Failure')
      ],

      verify: (bloc) {
        verify(mockGetPopularUnitvy
            .execute()
        );
      },
    );
    },
  );
}