
import '../../../helpers/test_helper_unitvy.mocks.dart';
import '../../../dummy_data/unitvy/dummy_objects_unitvy.dart';

import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_detail.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';


void main() {
  late GetUnitvyDetail
  usecase;

  late MockUnitvyRepository
  mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockUnitvyRepository();

    usecase =
        GetUnitvyDetail(mockMovieRepository);
    }
  );

  const tId = 1;

  test('should get tv detail from the repository',
          () async {

    // arrange
    when(mockMovieRepository
        .getTvDetail(tId)
    )
        .thenAnswer((_) async =>
        const Right(testUnitvyDetail)
    );

    // act
    final result = await usecase.execute(tId);

    // assert
    expect(result,
        const Right(testUnitvyDetail)
    );
    }
  );
}