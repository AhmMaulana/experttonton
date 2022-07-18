import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/search_unitvy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_unitvy_event.dart';
part 'search_unitvy_state.dart';

class SearchUnitvyBloc extends Bloc<SearchUnitvyEvent, SearchUnitvyState> {
  final SearchUnitvy searchUnitvy;

  SearchUnitvyBloc({
    required this.searchUnitvy,
  }) : super(SearchUnitvyEmpty()) {
    on<SearchUnitvySetEmpty>((event, emit) => emit(SearchUnitvyEmpty()));

    on<SearchUnitvyQueryEvent>((event, emit) async {
      emit(SearchUnitvyLoading());
      final result = await searchUnitvy.execute(event.query);
      result.fold(
            (failure) {
          emit(SearchUnitvyError(failure.message));
        },
            (data) {
          emit(SearchUnitvyLoaded(data));
        },
      );
    });
  }
}