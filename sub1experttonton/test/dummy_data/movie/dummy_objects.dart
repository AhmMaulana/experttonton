
import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/data/models/movie/movie_table.dart';

import 'package:sub1experttonton/domain/entities/genre.dart';
import 'package:sub1experttonton/domain/entities/movie/movie_detail.dart';


final testMovie = Movie(
  overview:
      'After being bitten by a genetically altered spider,'
          ' nerdy high school student Peter Parker is endowed with'
          ' amazing powers to become the Amazing superhero known as Spider-Man.',

  backdropPath:
      '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  video: false,

  genreIds: const [14, 28],
  id: 557,

  releaseDate:
      '2002-05-01',
  voteCount: 13507,

  popularity: 60.441,
  adult: false,

  title:
      'Spider-Man',
  originalTitle:
      'Spider-Man',

  voteAverage: 7.2,
  posterPath:
      '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
);

final testMovieList =
      [testMovie];

const testMovieDetail =
      MovieDetail(
  originalTitle:
      'originalTitle',
  runtime: 120,

  backdropPath:
      'backdropPath',
  posterPath:
      'posterPath',

  id: 1,
  adult: false,
  overview:
      'overview',
  voteCount: 1,

  releaseDate:
      'releaseDate',
  title:
      'title',

  genres: [Genre(id: 1,
      name: 'Action')],
  voteAverage: 1,
);

final testWatchlistMovie =
      Movie.watchlist(
  posterPath:
    'posterPath',
  title:
    'title',

  overview:
    'overview',
  id: 1,
);
final testWatchlistMovieList =
      [testWatchlistMovie];

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',

  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',

  'posterPath': 'posterPath',
  'title': 'title',
};
