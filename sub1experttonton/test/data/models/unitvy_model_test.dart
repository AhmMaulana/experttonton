import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/data/models/unitvy/unitvy_model.dart';


void main() {
  const tTvModel = UnitvyModel(
    posterPath:
        'posterPath',
    backdropPath:
        'backdropPath',
    genreIds:
        [1, 2, 3],

    firstAirDate:
          'firstAirDate',
    voteAverage: 1,

    originalName:
          'originalName',
    overview:
          'overview',

    popularity: 1,
    name:
        'name',

    voteCount: 1,
    id: 1,
  );

  final tTv =
      Unitvy(
        genreIds:
            const [1, 2, 3],
        id: 1,
        posterPath:
            'posterPath',

        originalName:
            'originalName',
        overview:
            'overview',

        voteAverage: 1,
        name:
            'name',

        popularity: 1,
        firstAirDate:
            'firstAirDate',

        voteCount: 1,
        backdropPath:
            'backdropPath',
      );


  test('should be a subclass of Tv entity', ()
    async {
      final result = tTvModel
          .toEntity();
      expect(result,
          tTv);
    }
  );
}
