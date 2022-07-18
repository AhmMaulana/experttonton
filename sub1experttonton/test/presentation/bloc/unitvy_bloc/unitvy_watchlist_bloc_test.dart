
import '../../../dummy_data/unitvy/dummy_objects_unitvy.dart';
import 'unitvy_watchlist_bloc_test.mocks.dart';

import 'package:mockito/annotations.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/remove_watchlist_unitvy.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_status_unitvy.dart';

import 'package:dartz/dartz.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/save_watchlist_unitvy.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_unitvy.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/watchlist_unitvy_bloc/watchlist_unitvy_bloc.dart';


@GenerateMocks(
    [
      WatchlistUnitvyBloc,
      GetWatchlistUnitvy,
      GetWatchListStatusUnitvy,
      RemoveWatchlistUnitvy,
      SaveWatchlistUnitvy
    ]
)


void main() {
  late MockGetWatchlistUnitvy
       mockGetWatchlistUnitvy;

  late MockGetWatchListStatusUnitvy
       mockGetWatchListStatus;

  late MockSaveWatchlistUnitvy
       mockSaveWatchlist;

  late MockRemoveWatchlistUnitvy
       mockRemoveWatchlist;

  late WatchlistUnitvyBloc
       watchlistUnitvyBloc;


  setUp(() {
    mockGetWatchlistUnitvy =
        MockGetWatchlistUnitvy();

    mockGetWatchListStatus =
        MockGetWatchListStatusUnitvy();

    mockSaveWatchlist =
        MockSaveWatchlistUnitvy();

    mockRemoveWatchlist =
        MockRemoveWatchlistUnitvy();

    watchlistUnitvyBloc =
        WatchlistUnitvyBloc(
      getWatchlistUnitvy:
          mockGetWatchlistUnitvy,

      getWatchListStatus:
          mockGetWatchListStatus,

      saveWatchlist:
          mockSaveWatchlist,

      removeWatchlist:
          mockRemoveWatchlist,
      );
    }
  );

  const unitvyId = 1;


  test("initial state should be empty", () {
    expect(watchlistUnitvyBloc.state,
        WatchlistUnitvyEmpty()
    );
  }
  );


  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistUnitvy
          .execute()
      )
          .thenAnswer((_) async => Right(testWatchlistUnitvyList)
      );

      return watchlistUnitvyBloc;
    },
    act: (bloc) => bloc.add(GetListEvent()),
    expect: () =>
    [WatchlistUnitvyLoading(),
      WatchlistUnitvyLoaded(
          testWatchlistUnitvyList)
    ],
    verify: (bloc) {
      verify(mockGetWatchlistUnitvy
          .execute()
      );
    },
  );


  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [Loading, Error] when get watchlist is unsuccessful',
    build: () {
      when(mockGetWatchlistUnitvy
          .execute()
      )
          .thenAnswer((_) async =>
      const Left(ServerFailure(
          "Can't get data")
        )
      );
      return watchlistUnitvyBloc;
    },

    act: (bloc) => bloc.add(GetListEvent()),
    expect: () =>
    [WatchlistUnitvyLoading(),
      const WatchlistUnitvyError(
          "Can't get data")
    ],

    verify: (bloc) {
      verify(mockGetWatchlistUnitvy
          .execute()
      );
    },
  );


  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [Loaded] when get status tv watchlist is successful',
    build: () {
      when(mockGetWatchListStatus
          .execute(unitvyId)
      )
          .thenAnswer((_) async => true);
      return watchlistUnitvyBloc;
    },

    act: (bloc) => bloc.add(
        const GetStatusUnitvyEvent(unitvyId)
    ),

    expect: () => [const WatchlistUnitvyStatusLoaded(
        true)
    ],
    verify: (bloc) {
      verify(mockGetWatchListStatus
          .execute(unitvyId));
    },
  );

  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [success] when add tv item to watchlist is successful',
    build: () {
      when(mockSaveWatchlist.execute(testUnitvyDetail))
          .thenAnswer((_) async => const Right("Success"));
      return watchlistUnitvyBloc;
    },

    act: (bloc) => bloc.add(const AddItemUnitvyEvent(
        testUnitvyDetail)
    ),

    expect: () => [const WatchlistUnitvySuccess(
        "Success")
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist
          .execute(testUnitvyDetail)
      );
    },
  );


  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [success] when remove tv item to watchlist is successful',
    build: () {
      when(mockRemoveWatchlist
          .execute(testUnitvyDetail)
      )
          .thenAnswer((_) async =>
          const Right("Removed")
      );

      return watchlistUnitvyBloc;
    },

    act: (bloc) => bloc.add(const RemoveItemUnitvyEvent(
        testUnitvyDetail)
    ),

    expect: () => [const WatchlistUnitvySuccess(
        "Removed")
    ],

    verify: (bloc) {
      verify(mockRemoveWatchlist
          .execute(testUnitvyDetail)
      );
    },
  );


  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [error] when add tv item to watchlist is unsuccessful',
    build: () {
      when(mockSaveWatchlist
          .execute(testUnitvyDetail)
      )
          .thenAnswer((_) async =>const Left(
          DatabaseFailure(
              'Failed')
        )
      );

      return watchlistUnitvyBloc;
    },

    act: (bloc) => bloc.add(const AddItemUnitvyEvent(
        testUnitvyDetail)
    ),

    expect: () => [const WatchlistUnitvyError(
        "Failed")
    ],

    verify: (bloc) {
      verify(mockSaveWatchlist
          .execute(testUnitvyDetail)
      );
    },
  );


  blocTest<WatchlistUnitvyBloc,
      WatchlistUnitvyState>(
    'Should emit [error] when remove tv item to watchlist is unsuccessful',
    build: () {
      when(mockRemoveWatchlist
          .execute(testUnitvyDetail)
      )
          .thenAnswer((_) async =>
          const Left(DatabaseFailure(
              'Failed')
          )
      );

      return watchlistUnitvyBloc;
    },

    act: (bloc) => bloc.add(const RemoveItemUnitvyEvent(
        testUnitvyDetail)
    ),

    expect: () => [const WatchlistUnitvyError(
        "Failed")
    ],

    verify: (bloc) {
      verify(mockRemoveWatchlist
          .execute(testUnitvyDetail)
      );
    },
  );
}