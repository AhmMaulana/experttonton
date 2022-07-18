import '../../../helpers/test_helper.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:sub1experttonton/domain/usecases/movie/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();
    usecase = SearchMovies
      (mockMovieRepository);
    }
  );

  const tQuery =
      'Spiderman';
  final tMovies =
      <Movie>[];

  test('should get list of movies from the repository', ()
  async {

    // arrange
    when(mockMovieRepository.searchMovies
      (tQuery)
    )
        .thenAnswer((_) async =>
        Right(tMovies)
    );

    // act
    final result = await usecase
        .execute(tQuery);

    // assert
    expect(result,
        Right(tMovies)
    );
  });
}
