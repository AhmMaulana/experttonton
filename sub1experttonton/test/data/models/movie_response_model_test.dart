
import '../../dummy_data/json_reader.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/data/models/movie/movie_response.dart';
import 'package:sub1experttonton/data/models/movie/movie_model.dart';

import 'dart:convert';


void main() {
  const tMovieModel = MovieModel(
    originalTitle:
        "Original Title",
    backdropPath:
        "/path.jpg",

    video: false,
    voteAverage: 1.0,

    overview:
        "Overview",
    popularity: 1.0,

    posterPath:
        "/path.jpg",
    adult: false,

    genreIds:
        [1, 2, 3, 4],
    releaseDate: "2020-05-05",

    title:
    "Title",
    id: 1,

    voteCount: 1,
  );


  const tMovieResponseModel =
  MovieResponse(movieList:
      <MovieModel>[tMovieModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', ()
    async {

      // arrange
      final Map<String,
          dynamic> jsonMap =
      json.decode(readJson(
          'dummy_data/now_playing.json'
      )
      );

      // act
      final result = MovieResponse
          .fromJson(jsonMap);

      // assert
      expect(result,
          tMovieResponseModel);
    }
    );
  }
  );


  group('toJson', () {
    test('should return a JSON map containing proper data', ()
    async {

      // act
      final result = tMovieResponseModel
          .toJson();

      // assert
      final expectedJsonMap = {
        "results": [
          {
            "adult": false,
            "backdrop_path":
                "/path.jpg",
            "genre_ids":
                [1, 2, 3, 4],
            "id": 1,
            "original_title":
                "Original Title",
            "overview":
                "Overview",
            "popularity": 1.0,
            "poster_path":
                "/path.jpg",
            "release_date":
                "2020-05-05",
            "title":
                "Title",
            "video": false,
            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };
      expect(result,
          expectedJsonMap);
    }
    );
  }
  );
}
