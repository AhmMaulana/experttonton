

import 'package:sub1experttonton/domain/usecases/unitvy/get_popular_unitvy.dart';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

part 'popular_unitvy_state.dart';
part 'popular_unitvy_event.dart';

class PopularUnitvyBloc extends Bloc<PopularUnitvyEvent, PopularUnitvyState> {
  final GetPopularUnitvy getPopularUnitvy;

  PopularUnitvyBloc(
      this.getPopularUnitvy,)
      : super(PopularUnitvyEmpty())
  {

    on<PopularUnitvyGetEvent>(
            (event, emit) async {
      emit(PopularUnitvyLoading()
      );
      final result = await getPopularUnitvy
          .execute();
      result.fold(
            (failure) {
          emit(PopularUnitvyError(
              failure.message));
        },

            (data) {
          emit(PopularUnitvyLoaded(data)
          );
        },
      );
    }
    );
  }
}