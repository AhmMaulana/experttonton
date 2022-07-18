import 'package:bloc/bloc.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_recomendations.dart';
import 'package:equatable/equatable.dart';

part 'recommendation_unitvy_event.dart';
part 'recommendation_unitvy_state.dart';

class RecommendationUnitvyBloc
    extends Bloc<RecommendationUnitvyEvent,
        RecommendationUnitvyState> {
  final GetUnitvyRecommendations getUnitvyRecommendations;

  RecommendationUnitvyBloc({
    required this.getUnitvyRecommendations,
  }
  )
      : super(RecommendationUnitvyEmpty())
  {
    on<GetRecommendationUnitvyEvent>(
            (event, emit)
        async {
      emit(RecommendationUnitvyLoading()
      );

      final result = await getUnitvyRecommendations
          .execute(event.id);
      result.fold(
            (failure) {
          emit(RecommendationUnitvyError(
              failure.message)
          );
        },
            (data) {
          emit(RecommendationUnitvyLoaded(data)
            );
          },
        );
      }
    );
  }
}