import '../../../helpers/test_helper.mocks.dart';
import 'package:dartz/dartz.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/domain/entities/movie/movie.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_now_playing_movies.dart';


void main() {
  late GetNowPlayingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();
    usecase = GetNowPlayingMovies
      (mockMovieRepository);
  });

  final tMovies = <Movie>[];

  test('should get list of movies from the repository', ()
  async {

    // arrange
    when(mockMovieRepository.getNowPlayingMovies())
        .thenAnswer((_) async =>
        Right(tMovies));

    // act
    final result = await usecase.execute();

    // assert
    expect(result, Right(tMovies));
  });
}
