
import '../../../helpers/test_helper_unitvy.mocks.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/search_unitvy.dart';
import 'package:mockito/mockito.dart';


void main() {
  late SearchUnitvy
  usecase;

  late MockUnitvyRepository
  mockTvRepository;

  setUp(() {
    mockTvRepository =
        MockUnitvyRepository();

    usecase =
        SearchUnitvy(
            mockTvRepository);
  });

  final tTv = <Unitvy>[];
  const tQuery = 'Game of throne';

  test('should get list of tv from the repository',
          () async {

    // arrange
    when(mockTvRepository.searchTv(tQuery))
        .thenAnswer((_) async =>
        Right(tTv)
    );

    // act
    final result = await usecase.execute(tQuery);

    // assert
    expect(result, Right(tTv)
    );
    }
  );
}