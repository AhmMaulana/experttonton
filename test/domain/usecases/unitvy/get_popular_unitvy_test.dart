
import '../../../helpers/test_helper_unitvy.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_popular_unitvy.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';


void main() {
  late MockUnitvyRepository
        mockTvRpository;

  late GetPopularUnitvy usecase;

  setUp(() {
    mockTvRpository =
        MockUnitvyRepository();

    usecase = GetPopularUnitvy
        (mockTvRpository);
    }
  );

  final tTv = <Unitvy>[];

  group('Get Popular Tv Tests', () {
    group('execute', () {

      test('should get list of tv from the'
          ' repository when execute function is called', ()
      async {

            // arrange
            when(mockTvRpository.getPopularTv())
                .thenAnswer((_) async =>
                Right(tTv)
            );

            // act
            final result = await usecase
                .execute();

            // assert
            expect(result,
                Right(tTv)
              );
            }
          );
        }
      );
    }
  );
}
