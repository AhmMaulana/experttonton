part of 'recommendation_unitvy_bloc.dart';

abstract class RecommendationUnitvyEvent extends Equatable {
  const RecommendationUnitvyEvent();

  @override
  List<Object> get props => [];
}

class GetRecommendationUnitvyEvent extends RecommendationUnitvyEvent {
  final int id;

  const GetRecommendationUnitvyEvent(this.id);

  @override
  List<Object> get props => [];
}