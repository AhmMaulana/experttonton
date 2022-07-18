
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/on_air_unitvy_bloc/on_air_unitvy_bloc.dart';
import 'unitvy_on_air_bloc_test.mocks.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:mockito/mockito.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_now_playing_unitvy.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';


@GenerateMocks(
    [OnAirUnitvyBloc,
      GetNowPlayingUnitvy]
)


void main() {
  late MockGetNowPlayingUnitvy
  mockGetNowPlayingUnitvy;

  late OnAirUnitvyBloc
  onAirUnitvyBloc;

  setUp(() {
    mockGetNowPlayingUnitvy =
        MockGetNowPlayingUnitvy();

    onAirUnitvyBloc =
        OnAirUnitvyBloc(
            mockGetNowPlayingUnitvy);
  }
  );

  final unitvyList = <Unitvy>[];

  test("initial state should be empty", () {
    expect(onAirUnitvyBloc.state,
        OnAirUnitvyEmpty()
    );
  }
  );


  group('On Air Tv BLoC Test', () {
    blocTest<OnAirUnitvyBloc,
        OnAirUnitvyState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingUnitvy
            .execute()
        )
            .thenAnswer((_) async =>
            Right(unitvyList)
        );
        return onAirUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          OnAirUnitvyGetEvent()
      ),

      expect: () => [
        OnAirUnitvyLoading(),
        OnAirUnitvyLoaded(
            unitvyList)
      ],

      verify: (bloc) {
        verify(mockGetNowPlayingUnitvy
            .execute()
        );
      },
    );


    blocTest<OnAirUnitvyBloc,
        OnAirUnitvyState>(
      'Should emit [Loading, Error] when get now playing is unsuccessful',
      build: () {
        when(mockGetNowPlayingUnitvy
            .execute()
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure')
            )
        );

        return onAirUnitvyBloc;
      },

      act: (bloc) => bloc.add(
          OnAirUnitvyGetEvent()
      ),

      expect: () => [
        OnAirUnitvyLoading(),
        const OnAirUnitvyError(
            'Server Failure')
      ],

      verify: (bloc) {
        verify(mockGetNowPlayingUnitvy
            .execute()
        );
      },
    );
  },
  );
}