import '../../../dummy_data/movie/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:mockito/mockito.dart';


void main() {
  late GetWatchlistMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();
    usecase = GetWatchlistMovies
      (mockMovieRepository);
      }
  );

  test('should get list of movies from the repository', ()
  async {

    // arrange
    when(mockMovieRepository.getWatchlistMovies())
        .thenAnswer((_) async =>
        Right(testMovieList));

    // act
    final result = await usecase
        .execute();

    // assert
    expect(result,
        Right(testMovieList)
    );
    }
  );
}
