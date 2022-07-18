
import 'unitvy_top_rated_bloc_test.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_top_rated_unitvy.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:mockito/annotations.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/top_rated_unitvy_bloc/top_rated_unitvy_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


@GenerateMocks(
    [
      GetTopRatedUnitvy,
      TopRatedUnitvyBloc
    ]
)


void main() {
  late MockGetTopRatedUnitvy
  mockGetTopRatedUnitvy;

  late TopRatedUnitvyBloc
  topRatedUnitvyBloc;

  setUp(() {
    mockGetTopRatedUnitvy =
        MockGetTopRatedUnitvy();

    topRatedUnitvyBloc =
        TopRatedUnitvyBloc(
            mockGetTopRatedUnitvy
        );
    }
  );

  final unitvyList = <Unitvy>[];

  test("initial state should be empty", () {
    expect(topRatedUnitvyBloc.state,
        TopRatedUnitvyEmpty()
    );
  }
  );


  group('Top Rated Movies BLoC Test', () {
    blocTest<TopRatedUnitvyBloc,
        TopRatedUnitvyState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedUnitvy
            .execute())
            .thenAnswer((_) async =>
            Right(unitvyList)
        );
        return topRatedUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          TopRatedUnitvyGetEvent()
      ),

      expect: () => [TopRatedUnitvyLoading(),
        TopRatedUnitvyLoaded(unitvyList)
      ],

      verify: (bloc) {
        verify(mockGetTopRatedUnitvy
            .execute()
        );
      },
    );

    blocTest<TopRatedUnitvyBloc,
        TopRatedUnitvyState>(
      'Should emit [Loading, Error] when get top rated is unsuccessful',
      build: () {
        when(mockGetTopRatedUnitvy
            .execute()
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure')
            )
        );

        return topRatedUnitvyBloc;
      },
      act: (bloc) => bloc.add(
          TopRatedUnitvyGetEvent()
      ),

      expect: () =>
      [TopRatedUnitvyLoading(),
        const TopRatedUnitvyError(
            'Server Failure')
      ],

      verify: (bloc) {
        verify(mockGetTopRatedUnitvy
            .execute()
        );
      },
    );
  },);
}