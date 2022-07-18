
import '../../dummy_data/unitvy/dummy_objects_unitvy.dart';
import '../../helpers/test_helper_unitvy.mocks.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/data/datasources/unitvy/unitvy_local_data_source.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/common/exception.dart';


void main() {
  late  UnitvyLocalDataSourceImpl
  dataSourcetv;

  late MockDatabaseHelperUnitvy
  mockDatabaseHelperTv;

  setUp(() {
    mockDatabaseHelperTv =
        MockDatabaseHelperUnitvy();

    dataSourcetv =
        UnitvyLocalDataSourceImpl(databaseHelperunitvy:
        mockDatabaseHelperTv);
  }
  );


  group('save watchlist tv', () {
    test('should return success message when insert to database is success',
            () async {

          // arrange
          when(mockDatabaseHelperTv
              .insertWatchlistTv(testUnitvyTable)
          )
              .thenAnswer((_) async => 1);

          // act
          final result = await dataSourcetv
              .insertWatchlistTv(testUnitvyTable);

          // assert
          expect(result,
              'Added to Watchlist');
        }
        );

    test('should throw DatabaseException when insert tv to database is failed',
            () async {

      // arrange
          when(mockDatabaseHelperTv
              .insertWatchlistTv(testUnitvyTable)
          )
              .thenThrow(Exception()
          );

          // act
          final call = dataSourcetv
              .insertWatchlistTv(testUnitvyTable);

          // assert
          expect(() => call, throwsA(isA<DatabaseException>()));
        }
        );
  }
  );


  group('remove watchlist tv', () {

    test('should throw DatabaseException when remove tv from database is failed',
            () async {

          // arrange
          when(mockDatabaseHelperTv
              .removeWatchlistTv(testUnitvyTable)
          )
              .thenThrow(Exception());

          // act
          final call = dataSourcetv
              .removeWatchlistTv(testUnitvyTable);

          // assert
          expect(() => call, throwsA(isA<DatabaseException>())
          );
        }
        );
  }
  );


  group('Get Tv Detail By Id', () {
    const tId = 1;

    test('should return Tv Detail Table when data is found',
            () async {

      // arrange
      when(mockDatabaseHelperTv.getTvById(tId))
          .thenAnswer((_) async => testUnitvyMap);

      // act
      final result = await dataSourcetv
          .getTvById(tId);

      // assert
      expect(result, testUnitvyTable);
    }
    );

    test('should return null when data is not found',
            () async {

      // arrange
      when(mockDatabaseHelperTv.getTvById(tId))
          .thenAnswer((_) async => null);

      // act
      final result = await dataSourcetv
          .getTvById(tId);

      // assert
      expect(result, null);
    }
    );
  }
  );


  group('get watchlist tv', () {
    test('should return list of TvTable from database',
            () async {

      // arrange
      when(mockDatabaseHelperTv.getWatchlistTv())
          .thenAnswer((_) async => [testUnitvyMap]
      );

      // act
      final result = await dataSourcetv
          .getWatchlistTv();

      // assert
      expect(result, [testUnitvyTable]
      );
    }
    );
  }
  );
}