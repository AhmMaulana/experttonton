import 'package:bloc/bloc.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_detail.dart';
import 'package:equatable/equatable.dart';

part 'detail_unitvy_event.dart';
part 'detail_unitvy_state.dart';

class DetailUnitvyBloc extends Bloc<DetailUnitvyEvent, DetailUnitvyState> {
  final GetUnitvyDetail getDetailUnitvy;

  DetailUnitvyBloc({
    required this.getDetailUnitvy,
  }) : super(DetailUnitvyEmpty()) {
    on<GetDetailUnitvyEvent>((event, emit) async {
      emit(DetailUnitvyLoading());
      final result = await getDetailUnitvy.execute(event.id);
      result.fold(
            (failure) {
          emit(DetailUnitvyError(failure.message));
        },
            (data) {
          emit(DetailUnitvyLoaded(data));
        },
      );
    });
  }
}