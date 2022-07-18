
import '../../../helpers/test_helper_unitvy.mocks.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_recomendations.dart';


void main() {
  late GetUnitvyRecommendations
  usecase;

  late MockUnitvyRepository
  mockTvRepository;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase =
        GetUnitvyRecommendations(
            mockTvRepository);
  }
  );

  const tId = 1;
  final tTv = <Unitvy>[];

  test('should get list of tv recommendations from the repository',
          () async {

        // arrange
        when(mockTvRepository
            .getUnitvyRecommendations(tId)
        )
            .thenAnswer((_) async => Right(tTv));

        // act
        final result = await usecase.execute(tId);

        // assert
        expect(result, Right(tTv)
        );
        }
      );
}