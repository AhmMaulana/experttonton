
import '../../../helpers/test_helper_unitvy.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/get_top_rated_unitvy.dart';
import 'package:mockito/mockito.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late GetTopRatedUnitvy
  usecase;

  late MockUnitvyRepository
  mockTvRepository;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase =
        GetTopRatedUnitvy(
            mockTvRepository);
  }
  );

  final tTv = <Unitvy>[];


  test('should get list of tv from repository',
          () async {

    // arrange
    when(mockTvRepository.getTopRatedTv())
        .thenAnswer((_)
    async => Right(tTv)
    );

    // act
    final result = await usecase.execute();

    // assert
    expect(result,
        Right(tTv)
    );
  }
  );
}