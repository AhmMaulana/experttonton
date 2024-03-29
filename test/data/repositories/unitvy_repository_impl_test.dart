
import '../../dummy_data/unitvy/dummy_objects_unitvy.dart';
import '../../helpers/test_helper_unitvy.mocks.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'package:sub1experttonton/data/models/genre_model.dart';
import 'package:sub1experttonton/common/exception.dart';

import 'dart:io';
import 'package:sub1experttonton/data/models/unitvy/unitvy_detail_model.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/data/models/unitvy/unitvy_model.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/data/repositories/unitvy_repository_impl.dart';


void main() {
  late UnitvyRepositoryImpl
  repository;

  late MockUnitvyRemoteDataSource
  mockRemoteDataSource;

  late MockUnitvyLocalDataSource
  mockLocalDataSource;


  setUp(() {
    mockRemoteDataSource =
        MockUnitvyRemoteDataSource();

    mockLocalDataSource =
        MockUnitvyLocalDataSource();

    repository =
        UnitvyRepositoryImpl(
          remoteDataSource: mockRemoteDataSource,

          localDataSource: mockLocalDataSource,
        );
  }
  );


  const tTvModel = UnitvyModel(
    genreIds: [10765, 10759, 18],
    backdropPath: '/mUkuc2wyV9dHLG0D0Loaw5pO2s8.jpg',
    id: 1399,
    overview:
    "Seven noble families fight for control of the mythical land of Westeros. "
        "Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north."
        " Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    originalName: 'Game of Thrones',
    posterPath: '/jIhL6mlT7AblhbHJgEoiBIOUVl1.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 7.91,
    popularity: 29.780826,
    voteCount: 1172,
  );


  final tTv = Unitvy(
    originalName: 'Game of Thrones',
    backdropPath: '/mUkuc2wyV9dHLG0D0Loaw5pO2s8.jpg',
    id: 1399,
    posterPath: '/jIhL6mlT7AblhbHJgEoiBIOUVl1.jpg',
    popularity: 29.780826,
    genreIds: const [10765, 10759, 18],
    overview:
    "Seven noble families fight for control of the mythical land of Westeros."
        " Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north."
        " Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    firstAirDate: '2011-04-17',
    voteAverage: 7.91,
    name: 'Game of Thrones',
    voteCount: 1172,
  );

  final tTvModelList = <UnitvyModel>[tTvModel];
  final tTvList = <Unitvy>[tTv];


  group('Now Playing Tv', () {
    test(
        'should return remote data when the call to remote data source is successful',
            () async {

          // arrange
          when(mockRemoteDataSource.getNowPlayingTv())
              .thenAnswer((_) async => tTvModelList);

          // act
          final result = await repository
              .getNowPlayingTv();

          // assert
          verify(mockRemoteDataSource.getNowPlayingTv());
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []);

          expect(resultList, tTvList);
        }
        );

    test(
        'should return server failure when the call to remote data source is unsuccessful',
            () async {

          // arrange
          when(mockRemoteDataSource.getNowPlayingTv())
              .thenThrow(ServerException()
          );

          // act
          final result = await repository
              .getNowPlayingTv();

          // assert
          verify(mockRemoteDataSource.getNowPlayingTv());
          expect(result, equals(const
          Left(ServerFailure(''))
          )
          );
        }
        );

    test(
        'should return connection failure when the device is not connected to internet',
            () async {

          // arrange
          when(mockRemoteDataSource.getNowPlayingTv())
              .thenThrow(const SocketException(
              'Failed to connect to the network'
          )
          );

          // act
          final result = await repository.getNowPlayingTv();

          // assert
          verify(mockRemoteDataSource
              .getNowPlayingTv()
          );

          expect(result,
              equals(const Left(
                  ConnectionFailure(
                      'Failed to connect to the network')
              )
              )
          );
        }
        );
  }
  );


  group('Popular Tv', () {
    test('should return Tv list when call to data source is success',
            () async {

          // arrange
          when(mockRemoteDataSource.getPopularTv())
              .thenAnswer((_) async
          => tTvModelList);

          // act
          final result = await repository
              .getPopularTv();

          // assert
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []
          );
          expect(resultList, tTvList);
        }
        );

    test(
        'should return server failure when call to data source is unsuccessful',
            () async {

          // arrange
          when(mockRemoteDataSource.getPopularTv())
              .thenThrow(ServerException()
          );

          // act
          final result = await repository
              .getPopularTv();

          // assert
          expect(result, const Left(
              ServerFailure('')
          )
          );
        }
        );

    test(
        'should return connection failure when device is not connected to the internet',
            () async {

          // arrange
          when(mockRemoteDataSource.getPopularTv())
              .thenThrow(const SocketException(
              'Failed to connect to the network'
          )
          );

          // act
          final result = await repository.getPopularTv();

          // assert
          expect(
              result, const Left(
              ConnectionFailure(
                  'Failed to connect to the network')
          )
          );
        }
        );
  }
  );


  group('Top Rated Tv', () {
    test('should return Tv list when call to data source is successful',
            () async {

          // arrange
          when(mockRemoteDataSource.getTopRatedTv())
              .thenAnswer((_) async => tTvModelList);

          // act
          final result = await repository.getTopRatedTv();

          // assert
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []
          );
          expect(resultList, tTvList);
        }
        );

    test('should return ServerFailure when call to data source is unsuccessful',
            () async {

          // arrange
          when(mockRemoteDataSource.getTopRatedTv())
              .thenThrow(ServerException()
          );

          // act
          final result = await repository
              .getTopRatedTv();

          // assert
          expect(result, const Left(
              ServerFailure('')
          )
          );
        }
        );

    test(
        'should return ConnectionFailure when device is not connected to the internet',
            () async {

          // arrange
          when(mockRemoteDataSource.getTopRatedTv())
              .thenThrow(const SocketException(
              'Failed to connect to the network'
          )
          );

          // act
          final result = await repository.getTopRatedTv();

          // assert
          expect(
              result, const Left(
              ConnectionFailure('Failed to connect to the network')
          )
          );
        }
        );
  }
  );


  group('Get Tv Detail', () {
    const tId = 1;
    const tTvResponse = UnitvyDetailResponse(
      backdropPath: 'backdropPath',
      genres: [GenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      originalLanguage: 'en',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      firstAirDate: 'firstAirDate',
      status: 'Status',
      numberOfEpisodes: 1,
      numberOfSeasons: 1,
      tagline: 'Tagline',
      name: 'name',
      type: 'type',
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return Tv data when the call to remote data source is successful',
            () async {

          // arrange
          when(mockRemoteDataSource.getTvDetail(tId))
              .thenAnswer((_) async => tTvResponse);

          // act
          final result = await repository.getTvDetail(tId);

          // assert
          verify(mockRemoteDataSource
              .getTvDetail(tId)
          );

          expect(result, equals(const
          Right(testUnitvyDetail)
          )
          );
        }
        );

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
            () async {

          // arrange
          when(mockRemoteDataSource.getTvDetail(tId))
              .thenThrow(ServerException()
          );

          // act
          final result = await repository
              .getTvDetail(tId);

          // assert
          verify(mockRemoteDataSource
              .getTvDetail(tId)
          );

          expect(result, equals(const Left(
              ServerFailure(''))
          )
          );
        }
        );

    test(
        'should return connection failure when the device is not connected to internet',
            () async {

          // arrange
          when(mockRemoteDataSource.getTvDetail(tId))
              .thenThrow(const SocketException(
              'Failed to connect to the network')
          );

          // act
          final result = await repository.getTvDetail(tId);

          // assert
          verify(mockRemoteDataSource
              .getTvDetail(tId)
          );

          expect(result,
              equals(const Left(
                  ConnectionFailure(
                      'Failed to connect to the network'))
              )
          );
        }
        );
  }
  );


  group('Get Tv Recommendations', () {
    final tTvList = <UnitvyModel>[];
    const tId = 1;

    test('should return data (tv list) when the call is successful',
            () async {

          // arrange
          when(mockRemoteDataSource.getTvRecommendations(tId))
              .thenAnswer((_) async => tTvList);

          // act
          final result = await repository
              .getUnitvyRecommendations(tId);

          // assert
          verify(mockRemoteDataSource.getTvRecommendations(tId));
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []
          );

          expect(resultList, equals(tTvList));
        }
        );

    test(
        'should return server failure when call to remote data source is unsuccessful',
            () async {

          // arrange
          when(mockRemoteDataSource.getTvRecommendations(tId))
              .thenThrow(ServerException());

          // act
          final result = await repository.getUnitvyRecommendations(tId);

          // assertbuild runner
          verify(mockRemoteDataSource.getTvRecommendations(tId)
          );

          expect(result, equals(const
          Left(ServerFailure('')
          )
          )
          );
        }
        );

    test(
        'should return connection failure when the device is not connected to the internet',
            () async {

          // arrange
          when(mockRemoteDataSource.getTvRecommendations(tId))
              .thenThrow(const SocketException(
              'Failed to connect to the network')
          );

          // act
          final result = await repository.getUnitvyRecommendations(tId);

          // assert
          verify(mockRemoteDataSource
              .getTvRecommendations(tId)
          );

          expect(result,
              equals(const Left(
                  ConnectionFailure('Failed to connect to the network'))
              )
          );
        }
        );
  }
  );


  group('Seach Tv', () {
    const tQuery = 'game of thrones';

    test('should return tv list when call to data source is successful',
            () async {

          // arrange
          when(mockRemoteDataSource.searchTv(tQuery))
              .thenAnswer((_) async => tTvModelList);

          // act
          final result = await repository
              .searchTv(tQuery);

          // assert
          /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
          final resultList = result.getOrElse(() => []
          );

          expect(resultList, tTvList);
        }
        );

    test('should return ServerFailure when call to data source is unsuccessful',
            () async {

          // arrange
          when(mockRemoteDataSource.searchTv(tQuery))
              .thenThrow(ServerException());

          // act
          final result = await repository
              .searchTv(tQuery);

          // assert
          expect(result, const Left(
              ServerFailure('')
          )
          );
        }
        );

    test(
        'should return ConnectionFailure when device is not connected to the internet',
            () async {

          // arrange
          when(mockRemoteDataSource.searchTv(tQuery))
              .thenThrow(const SocketException(
              'Failed to connect to the network')
          );

          // act
          final result = await repository.searchTv(tQuery);

          // assert
          expect(
              result, const Left(
              ConnectionFailure('Failed to connect to the network')
          )
          );
        }
        );
  }
  );


  group('save watchlist tv', () {
    test('should return success message when saving successful',
            () async {

      // arrange
      when(mockLocalDataSource
          .insertWatchlistTv(testUnitvyTable))
          .thenAnswer((_) async => 'Added to Watchlist');

      // act
      final result = await repository
          .saveWatchlistTv(testUnitvyDetail);

      // assert
      expect(result, const Right(
          'Added to Watchlist')
      );
    }
    );

    test('should return Database Failure when saving unsuccessful',
            () async {

      // arrange
      when(mockLocalDataSource
          .insertWatchlistTv(testUnitvyTable))
          .thenThrow(DatabaseException(
          'Failed to add watchlist')
      );

      // act
      final result = await repository
          .saveWatchlistTv(testUnitvyDetail);

      // assert
      expect(result, const Left(
          DatabaseFailure('Failed to add watchlist')
      )
      );
    }
    );
  }
  );


  group('remove watchlist tv', () {
    test('should return success message when remove successful',
            () async {

      // arrange
      when(mockLocalDataSource
          .removeWatchlistTv(testUnitvyTable))
          .thenAnswer((_) async => 'Removed from watchlist');

      // act
      final result = await repository
          .removeWatchlistTv(testUnitvyDetail);

      // assert
      expect(result, const Right('Removed from watchlist'));
    }
    );

    test('should return Database Failure when remove unsuccessful',
            () async {

      // arrange
      when(mockLocalDataSource
          .removeWatchlistTv(testUnitvyTable))
          .thenThrow(DatabaseException(
          'Failed to remove watchlist')
      );

      // act
      final result = await repository
          .removeWatchlistTv(testUnitvyDetail);

      // assert
      expect(result, const Left(
          DatabaseFailure('Failed to remove watchlist')
      )
      );
    }
    );
  }
  );


  group('get watchlist status', () {
    test('should return watch status whether data is found',
            () async {

      // arrange
      const tId = 1;

      when(mockLocalDataSource.getTvById(tId))
          .thenAnswer((_) async => null);

      // act
      final result = await repository
          .isAddedToWatchlistTv(tId);

      // assert
      expect(result, false);
    }
    );
  }
  );


  group('get watchlist tv', () {
    test('should return list of Tv', () async {

      // arrange
      when(mockLocalDataSource.getWatchlistTv())
          .thenAnswer((_) async => [testUnitvyTable]);

      // act
      final result = await repository
          .getWatchlistTv();

      // assert
      final resultList = result.getOrElse(() => []
      );

      expect(resultList,
          [testWatchlistUnitvy]
      );
    }
    );
  }
  );
}