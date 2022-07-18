import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/entities/genre.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';
import 'package:sub1experttonton/data/models/unitvy/unitvy_table.dart';

final testUnitvy = Unitvy(
    overview:
    "Seven noble families fight for control of the mythical land of Westeros."
        " Friction between the houses leads to full-scale war. "
        "All while a very ancient evil awakens in the farthest north. "
        "Amidst the war, a neglected military order of misfits, the Night's Watch,"
        " is all that stands between the realms of men and icy horrors beyond.",

    id: 1399,
    originalName:
      'Game of Thrones',

    backdropPath:
      '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
    firstAirDate:
        '2011-04-17',

    popularity: 369.594,
    name:
        'Game of Thrones',

    posterPath:
    '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
    voteAverage: 8.3,

    genreIds: const
      [
        10765,
        18,
        10759,
        9648
      ],
    voteCount: 11504
);

final testUnitvyList =
    [testUnitvy];

const testUnitvyDetail =
      UnitvyDetail(
  backdropPath:
      'backdropPath',
  posterPath:
      'posterPath',

  id: 1,
  genres: [Genre(id: 1,
      name: 'Action')
  ],

  overview:
      'overview',
  originalName:
      'originalName',

  voteCount: 1,
  firstAirDate:
    'firstAirDate',

  voteAverage: 1,
  name: 'name',
);

final testWatchlistUnitvy =
      Unitvy.watchlist(
  id: 1,
  posterPath:
      'posterPath',

  overview:
      'overview',
  name: 'name',
);

final testWatchlistUnitvyList =
[testWatchlistUnitvy];

const testUnitvyTable =
    UnitvyTable(
  id: 1,
  posterPath:
      'posterPath',

      overview:
      'overview',
  name: 'name',
);

final testUnitvyMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};
