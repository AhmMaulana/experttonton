
import '../../../helpers/test_helper_unitvy.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_now_playing_unitvy.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';


void main() {
  late MockUnitvyRepository mockTvRepository;

  late GetNowPlayingUnitvy usecase;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase = GetNowPlayingUnitvy
      (mockTvRepository);
  }
  );

  final tUnitvy = <Unitvy>[];

  test('should get list of tv from the repository', ()
  async {

    // arrange
    when(mockTvRepository.getNowPlayingTv())
        .thenAnswer((_) async =>
        Right(tUnitvy));

    // act
    final result = await usecase
        .execute();

    // assert
    expect(result,
        Right(tUnitvy)
    );
  }
  );
}
