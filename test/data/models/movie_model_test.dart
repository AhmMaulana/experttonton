
import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:sub1experttonton/data/models/movie/movie_model.dart';


void main() {
  const tMovieModel =
        MovieModel(
    adult: false,
    overview:
        'overview',

    id: 1,
    originalTitle:
        'originalTitle',

    releaseDate:
        'releaseDate',
    genreIds:
        [1, 2, 3],

    popularity: 1,
    posterPath:
        'posterPath',

    voteCount: 1,
    title:
        'title',

    voteAverage: 1,
    video: false,

    backdropPath:
        'backdropPath',
  );


  final tMovie = Movie(
    backdropPath:
        'backdropPath',
    genreIds:
        const [1, 2, 3],

    voteCount: 1,
    posterPath:
        'posterPath',

    overview:
        'overview',
    popularity: 1,

    adult: false,
    releaseDate:
        'releaseDate',

    video: false,
    voteAverage: 1,

    id: 1,
    title:
        'title',

    originalTitle:
    'originalTitle',
  );


  test('should be a subclass of Movie entity', ()
  async {

    final result =
        tMovieModel.toEntity();
    expect(result,
        tMovie);
  }
  );
}
