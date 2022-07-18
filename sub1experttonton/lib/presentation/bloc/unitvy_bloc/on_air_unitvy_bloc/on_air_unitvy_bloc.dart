import 'package:bloc/bloc.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_now_playing_unitvy.dart';
import 'package:equatable/equatable.dart';

part 'on_air_unitvy_event.dart';
part 'on_air_unitvy_state.dart';

class OnAirUnitvyBloc extends Bloc<OnAirUnitvyEvent, OnAirUnitvyState> {
  final GetNowPlayingUnitvy getOnAirUnitvy;

  OnAirUnitvyBloc(
      this.getOnAirUnitvy,
      ) : super(OnAirUnitvyEmpty()) {
    on<OnAirUnitvyGetEvent>((event, emit) async {
      emit(OnAirUnitvyLoading());
      final result = await getOnAirUnitvy.execute();
      result.fold(
            (failure) {
          emit(OnAirUnitvyError(failure.message));
        },
            (data) {
          emit(OnAirUnitvyLoaded(data));
        },
      );
    });
  }
}