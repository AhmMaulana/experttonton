import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_unitvy.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_status_unitvy.dart';


void main() {
  late GetWatchListStatusUnitvy
      usecase;

  late MockUnitvyRepository
      mockTvRepository;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase =
        GetWatchListStatusUnitvy(
            mockTvRepository);
    }
  );


  test('should get watchlist tv status from repository',
          () async {

    // arrange
    when(mockTvRepository
        .isAddedToWatchlistTv(1)
    )
        .thenAnswer((_) async => true);

    // act
    final result = await usecase.execute(1);

    // assert
    expect(result, true);
    }
  );
}