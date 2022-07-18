import '../../../dummy_data/movie/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/usecases/movie/remove_watchlist.dart';


void main() {
  late RemoveWatchlist usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository =
        MockMovieRepository();
    usecase = RemoveWatchlist(
        mockMovieRepository);
    }
  );

  test('should remove watchlist movie from repository', ()
  async {

    // arrange
    when(mockMovieRepository.removeWatchlist(
        testMovieDetail)
    )
        .thenAnswer((_) async =>
        const Right('Removed from watchlist')
    );

    // act
    final result = await usecase.execute(
        testMovieDetail
    );

    // assert
    expect(result, const Right(
        'Removed from watchlist'
      )
    );

    verify(mockMovieRepository.removeWatchlist(
        testMovieDetail)
    );
  }
  );
}
