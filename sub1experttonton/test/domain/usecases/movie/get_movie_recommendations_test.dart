
import '../../../helpers/test_helper.mocks.dart';
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_movie_recommendations.dart';


void main() {
  late GetMovieRecommendations usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();
    usecase = GetMovieRecommendations
      (mockMovieRepository);
    }
  );

  final tMovies =
      <Movie>[];
  const tId = 1;

  test('should get list of movie recommendations from the repository', ()
  async {

        // arrange
        when(mockMovieRepository.getMovieRecommendations
          (tId))
            .thenAnswer((_) async =>
            Right(tMovies));

        // act
        final result = await usecase
            .execute(tId);

        // assert
        expect(result,
            Right(tMovies)
        );
        }
      );
}
