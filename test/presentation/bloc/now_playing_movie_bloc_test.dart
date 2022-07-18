
import 'package:mockito/mockito.dart';
import 'now_playing_movie_bloc_test.mocks.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/now_playing_movie_bloc/now_playing_movie_bloc.dart';


@GenerateMocks(
    [
      NowPlayingMovieBloc,
      GetNowPlayingMovies
    ]
)


void main() {
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  late NowPlayingMovieBloc nowPlayingMovieBloc;

  setUp(() {
    mockGetNowPlayingMovies =
        MockGetNowPlayingMovies();
    nowPlayingMovieBloc =
        NowPlayingMovieBloc(
            mockGetNowPlayingMovies);
  }
  );

  final movieList = <Movie>[];


  test("initial state should be empty", () {
    expect(nowPlayingMovieBloc.state,
        NowPlayingMovieEmpty()
      );
    }
  );


  group('Now Playing Movies BLoC Test', () {
    blocTest<NowPlayingMovieBloc,
        NowPlayingMovieState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingMovies
            .execute()
        )
            .thenAnswer((_) async =>
            Right(movieList)
        );

        return nowPlayingMovieBloc;
      },

      act: (bloc) => bloc.add(
          NowPlayingMovieGetEvent()
      ),

      expect: () => [NowPlayingMovieLoading(),
        NowPlayingMovieLoaded
          (movieList)
      ],

      verify: (bloc) {
        verify(mockGetNowPlayingMovies
            .execute()
        );
      },
    );


    blocTest<NowPlayingMovieBloc,
        NowPlayingMovieState>(
      'Should emit [Loading, Error] when get now playing is unsuccessful',
      build: () {
        when(mockGetNowPlayingMovies.execute()
        )
            .thenAnswer((_) async =>
            const Left(ServerFailure(
                'Server Failure')
            )
        );

        return nowPlayingMovieBloc;
      },

      act: (bloc) => bloc.add(
          NowPlayingMovieGetEvent()
      ),

      expect: () => [NowPlayingMovieLoading(),
        const NowPlayingMovieError(
            'Server Failure'
        )
      ],

      verify: (bloc) {
        verify(mockGetNowPlayingMovies
            .execute()
          );
        },
      );
    },
  );
}