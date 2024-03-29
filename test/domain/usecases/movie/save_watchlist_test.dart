
import '../../../dummy_data/movie/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

import 'package:dartz/dartz.dart';
import 'package:sub1experttonton/domain/usecases/movie/save_watchlist.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


void main() {
  late SaveWatchlist
  usecase;

  late MockMovieRepository
  mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();

    usecase =
        SaveWatchlist(
            mockMovieRepository
        );
  }
  );


  test('should save movie to the repository',
          () async {

    // arrange
    when(mockMovieRepository.saveWatchlist(
        testMovieDetail))
        .thenAnswer((_) async =>
    const Right('Added to Watchlist')
    );

    // act
    final result = await usecase
        .execute(testMovieDetail
    );

    // assert
    verify(mockMovieRepository.saveWatchlist(testMovieDetail)
    );
    expect(result,
        const Right('Added to Watchlist')
    );
  }
  );
}