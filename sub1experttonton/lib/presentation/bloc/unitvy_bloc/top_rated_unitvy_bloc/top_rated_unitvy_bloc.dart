import 'package:bloc/bloc.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_top_rated_unitvy.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_unitvy_event.dart';
part 'top_rated_unitvy_state.dart';

class TopRatedUnitvyBloc extends Bloc<TopRatedUnitvyEvent, TopRatedUnitvyState> {
  final GetTopRatedUnitvy getTopRatedUnitvy;

  TopRatedUnitvyBloc(
      this.getTopRatedUnitvy,
      ) : super(TopRatedUnitvyEmpty()) {
    on<TopRatedUnitvyGetEvent>((event, emit) async {
      emit(TopRatedUnitvyLoading());
      final result = await getTopRatedUnitvy.execute();
      result.fold(
            (failure) {
          emit(TopRatedUnitvyError(failure.message));
        },
            (data) {
          emit(TopRatedUnitvyLoaded(data));
        },
      );
    });
  }
}