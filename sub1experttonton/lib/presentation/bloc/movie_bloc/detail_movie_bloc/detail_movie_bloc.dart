
import 'package:equatable/equatable.dart';
import 'package:sub1experttonton/domain/entities/movie/movie_detail.dart';

import 'package:bloc/bloc.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_movie_detail.dart';

part 'detail_movie_state.dart';
part 'detail_movie_event.dart';


class DetailMovieBloc extends
  Bloc<DetailMovieEvent,
      DetailMovieState> {

  final GetMovieDetail getMovieDetail;

  DetailMovieBloc({required this
      .getMovieDetail,}
      )
      : super(DetailMovieEmpty()) {on<GetDetailMovieEvent>(
          (event, emit)
      async {
      emit(DetailMovieLoading()
      );

      final result = await getMovieDetail
          .execute(event.id);
      result.fold(
            (failure) {
          emit(DetailMovieError(
              failure.message)
          );
        },
            (data) {
            emit(DetailMovieLoaded(data)
            );
          },
        );
      }
    );
  }
}