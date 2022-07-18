import '../../../helpers/test_helper_unitvy.mocks.dart';
import '../../../dummy_data/unitvy/dummy_objects_unitvy.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/remove_watchlist_unitvy.dart';


void main() {
  late RemoveWatchlistUnitvy
  usecase;

  late MockUnitvyRepository
  mockTvRepository;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase =
        RemoveWatchlistUnitvy
          (mockTvRepository);
    }
  );


  test('should remove watchlist tv from repository',
          () async {

    // arrange
    when(mockTvRepository.removeWatchlistTv(testUnitvyDetail))
        .thenAnswer((_) async =>
        const Right('Removed from watchlist')
    );

    // act
    final result = await usecase
        .execute(testUnitvyDetail);

    // assert
    verify(mockTvRepository
        .removeWatchlistTv(testUnitvyDetail)
    );

    expect(result,
        const Right('Removed from watchlist')
    );
    }
  );
}