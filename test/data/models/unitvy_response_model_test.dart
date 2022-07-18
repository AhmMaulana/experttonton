import '../../dummy_data/json_reader.dart';

import 'dart:convert';
import 'package:sub1experttonton/data/models/unitvy/unitvy_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/data/models/unitvy/unitvy_response.dart';


void main() {
  const tTvModel =
  UnitvyModel(
    genreIds: [1, 2, 3, 4],
    backdropPath:
    "/path.jpg",
    id: 1,
    originalName:
    "Original Name",
    popularity: 1.0,
    overview:
    "Overview",
    firstAirDate:
    "2010-06-08",
    posterPath:
    "/path.jpg",
    name:
    "Name",
    voteCount: 1,
    voteAverage: 1.0,
  );

  const tTvResponseModel =
  UnitvyResponse(tvList: <UnitvyModel>[tTvModel]);
  group('fromJson', () {
    test('should return a valid model from JSON',
            () async {

      // arrange
      final Map<String, dynamic> jsonMap =
      json.decode(readJson('dummy_data/on_the_air.json'));

      // act
      final result = UnitvyResponse.fromJson(jsonMap);

      // assert
      expect(result, tTvResponseModel);
    }
    );
  }
  );


  group('toJson', () {
    test('should return a JSON map containing proper data',
            () async {
      // arrange

      // act
      final result = tTvResponseModel.toJson();

      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],
            "id": 1,
            "original_name": "Original Name",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "first_air_date": "2010-06-08",
            "name": "Name",
            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };
      expect(result, expectedJsonMap);
    }
    );
  }
  );
}