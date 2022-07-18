
import '../../../helpers/test_helper_unitvy.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dartz/dartz.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/save_watchlist_unitvy.dart';

import 'package:mockito/mockito.dart';
import '../../../dummy_data/unitvy/dummy_objects_unitvy.dart';


void main() {
  late SaveWatchlistUnitvy
       usecase;

  late MockUnitvyRepository
       mockTvRepository;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase =
        SaveWatchlistUnitvy(
            mockTvRepository);
    }
  );

  test('should save tv to the repository',
          () async {

    // arrange
    when(mockTvRepository
        .saveWatchlistTv(testUnitvyDetail)
    )
        .thenAnswer((_) async =>
        const Right('Added to Watchlist')
    );

    // act
    final result = await usecase
        .execute(testUnitvyDetail);

    // assert
    verify(mockTvRepository
        .saveWatchlistTv(testUnitvyDetail)
    );

    expect(result,
        const Right('Added to Watchlist')
      );
    }
  );
}