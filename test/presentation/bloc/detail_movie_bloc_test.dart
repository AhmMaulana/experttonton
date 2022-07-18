
import '../../dummy_data/movie/dummy_objects.dart';
import 'detail_movie_bloc_test.mocks.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import 'package:sub1experttonton/presentation/bloc/movie_bloc/detail_movie_bloc/detail_movie_bloc.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_movie_detail.dart';


@GenerateMocks(
    [
      DetailMovieBloc,
      GetMovieDetail
    ]
)


void main() {
  late MockGetMovieDetail
       mockGetMovieDetail;

  late DetailMovieBloc
       detailMovieBloc;

  setUp(() {
    mockGetMovieDetail =
        MockGetMovieDetail();

    detailMovieBloc =
        DetailMovieBloc(
            getMovieDetail: mockGetMovieDetail);
  }
  );

  const movieId = 1;

  test("initial state should be empty", () {
    expect(detailMovieBloc.state,
        DetailMovieEmpty()
      );
    }
  );


  group('Detail Movies BLoC Test', () {
    blocTest<DetailMovieBloc,
        DetailMovieState>(
      'Should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetMovieDetail.execute(movieId))
            .thenAnswer((_) async =>
            const Right(testMovieDetail)
        );

        return detailMovieBloc;
      },

      act: (bloc) => bloc.add(
          const GetDetailMovieEvent(movieId)
      ),

      expect: () => [DetailMovieLoading(),
        const DetailMovieLoaded(
            testMovieDetail)
      ],
      verify: (bloc) {
        verify(mockGetMovieDetail.execute(movieId));
      },
    );


    blocTest<DetailMovieBloc,
        DetailMovieState>(
      'Should emit [Loading, Error] when get detail is unsuccessful',
      build: () {
        when(mockGetMovieDetail
            .execute(movieId)
        )
            .thenAnswer((_) async =>
        const Left(ServerFailure(
            'Server Failure'
            )
          )
        );

        return detailMovieBloc;
      },

      act: (bloc) => bloc.add(
          const GetDetailMovieEvent(movieId)
      ),

      expect: () => [DetailMovieLoading(),
        const DetailMovieError(
            'Server Failure'
        )
      ],

      verify: (bloc) {
        verify(mockGetMovieDetail
            .execute(movieId)
        );
      },
    );
  }
  );
}



