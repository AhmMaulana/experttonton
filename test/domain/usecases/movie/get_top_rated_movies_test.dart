import '../../../helpers/test_helper.mocks.dart';

import 'package:mockito/mockito.dart';
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/domain/usecases/movie/get_top_rated_movies.dart';


void main() {
  late GetTopRatedMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();
    usecase =
        GetTopRatedMovies(mockMovieRepository);
     }
    );
  final tMovies = <Movie>[];


  test('should get list of movies from repository', ()
      async {

    // arrange
    when(mockMovieRepository.getTopRatedMovies())
        .thenAnswer((_) async =>
        Right(tMovies)
    );

    // act
    final result = await usecase
        .execute();

    // assert
    expect(result,
        Right(tMovies)
    );
  });
}
