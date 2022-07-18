
import 'package:http/http.dart' as http;
import '../../dummy_data/json_reader.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/data/models/unitvy/unitvy_response.dart';

import 'package:sub1experttonton/data/models/unitvy/unitvy_detail_model.dart';
import 'package:sub1experttonton/common/exception.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/data/datasources/unitvy/unitvy_remote_data_source.dart';

import '../../helpers/test_helper_unitvy.mocks.dart';
import 'dart:convert';


void main() {
  const apiKey =
      'api_key=2174d146bb9c0eab47529b2e77d6b526';

  const baseUrl =
      'https://api.themoviedb.org/3';

  late UnitvyRemoteDataSourceImpl
  dataSourcetv;

  late MockHttpClient
  mockHttpClient;

  setUp(() {
    mockHttpClient =
        MockHttpClient();

    dataSourcetv =
        UnitvyRemoteDataSourceImpl(
            client: mockHttpClient);
  }
  );


  group('get Now Playing Tv', () {
    final tTvList = UnitvyResponse.fromJson(
        json.decode(readJson('dummy_data/on_the_air.json')))
        .tvList;

    test('should return list of Tv Model when the response code is 200',
            () async {

          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')
          ))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/on_the_air.json'),
                  200));

          // act
          final result = await dataSourcetv.getNowPlayingTv();

          // assert
          expect(result, equals(tTvList));
        }
        );

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {

          // arrange
          when(mockHttpClient
              .get(Uri.parse(
              '$baseUrl/tv/on_the_air?$apiKey')
          ))
              .thenAnswer((_) async => http.Response(
              'Not Found', 404)
          );

          // act
          final call = dataSourcetv.getNowPlayingTv();

          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        }
        );
  }
  );


  group('get Popular Tv', () {
    final tTvList =
        UnitvyResponse.fromJson(json.decode(readJson(
            'dummy_data/unitvy/popular_unitvy.json')
        ))
            .tvList;

    test('should return list of tv when response is success (200)',
            () async {

          // arrange
          when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')
          ))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/unitvy/popular_unitvy.json'),
                  200)
          );

          // act
          final result = await dataSourcetv.getPopularTv();

          // assert
          expect(result, tTvList);
        }
        );

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {

          // arrange
          when(mockHttpClient.get(Uri.parse(
              '$baseUrl/tv/popular?$apiKey')
          ))
              .thenAnswer((_) async => http.Response(
              'Not Found', 404)
          );

          // act
          final call = dataSourcetv.getPopularTv();

          // assert
          expect(() => call, throwsA(isA<ServerException>())
          );
        }
        );
  }
  );


  group('get Top Rated Tv', () {
    final tTvList = UnitvyResponse.fromJson(
        json.decode(readJson(
            'dummy_data/unitvy/top_rated_unitvy.json')
        ))
        .tvList;

    test('should return list of tv when response code is 200 ',
            () async {

      // arrange
      when(mockHttpClient.get(Uri.parse(
          '$baseUrl/tv/top_rated?$apiKey')
      ))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/unitvy/top_rated_unitvy.json'),
              200)
      );

      // act
      final result = await dataSourcetv.getTopRatedTv();

      // assert
      expect(result, tTvList);
    }
    );

    test('should throw ServerException when response code is other than 200',
            () async {

          // arrange
          when(mockHttpClient.get(Uri.parse(
              '$baseUrl/tv/top_rated?$apiKey')
          ))
              .thenAnswer((_) async => http.Response(
              'Not Found', 404)
          );

          // act
          final call = dataSourcetv.getTopRatedTv();

          // assert
          expect(() => call, throwsA(isA<ServerException>())
          );
        }
        );
  }
  );


  group('get tv detail', () {
    const tId = 1;
    final tTvDetail = UnitvyDetailResponse.fromJson(
        json.decode(readJson('dummy_data/unitvy/unitvy_detail.json')
        )
    );

    test('should return movie detail when the response code is 200',
            () async {

      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')
      ))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/unitvy/unitvy_detail.json'),
              200)
      );

      // act
      final result = await dataSourcetv.getTvDetail(tId);

      // assert
      expect(result, equals(tTvDetail));
    }
    );

    test('should throw Server Exception when the response code is 404 or other',
            () async {

          // arrange
          when(mockHttpClient.get(Uri.parse(
              '$baseUrl/tv/$tId?$apiKey')
          ))
              .thenAnswer((_) async => http.Response(
              'Not Found', 404)
          );

          // act
          final call = dataSourcetv.getTvDetail(tId);

          // assert
          expect(() => call, throwsA(isA<ServerException>())
          );
        }
        );
  }
  );


  group('get tv recommendations', () {
    final tTvList = UnitvyResponse.fromJson(
        json.decode(readJson(
            'dummy_data/unitvy/unitvy_recommendations.json')
        ))
        .tvList;
    const tId = 1;

    test('should return list of Tv Model when the response code is 200',
            () async {

          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')
          ))
              .thenAnswer((_) async => http.Response(
              readJson('dummy_data/unitvy/unitvy_recommendations.json'),
              200)
          );

          // act
          final result = await dataSourcetv.getTvRecommendations(tId);

          // assert
          expect(result, equals(tTvList));
        }
        );

    test('should throw Server Exception when the response code is 404 or other',
            () async {

          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')
          ))
              .thenAnswer((_) async => http.Response(
              'Not Found', 404)
          );

          // act
          final call = dataSourcetv.getTvRecommendations(tId);

          // assert
          expect(() => call, throwsA(isA<ServerException>())
          );
        }
        );
  }
  );


  group('search tv', () {
    final tSearchResult = UnitvyResponse.fromJson(
        json.decode(readJson(
            'dummy_data/unitvy/search_got_unitvy.json')
        ))
        .tvList;
    const tQuery = 'Spiderman';

    test('should return list of tv when response code is 200',
            () async {
      // arrange
      when(mockHttpClient
          .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')
      ))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/unitvy/search_got_unitvy.json'),
          200)
      );

      // act
      final result = await dataSourcetv.searchTv(tQuery);

      // assert
      expect(result, tSearchResult);
    }
    );

    test('should throw ServerException when response code is other than 200',
            () async {

          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')
          ))
              .thenAnswer((_) async => http.Response(
              'Not Found', 404)
          );

          // act
          final call = dataSourcetv.searchTv(tQuery);

          // assert
          expect(() => call, throwsA(isA<ServerException>())
          );
        }
        );
  }
  );
}