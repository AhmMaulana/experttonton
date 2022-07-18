part of 'recommendation_unitvy_bloc.dart';

abstract class RecommendationUnitvyState extends Equatable {
  const RecommendationUnitvyState();

  @override
  List<Object> get props => [];
}

class RecommendationUnitvyEmpty extends RecommendationUnitvyState {}

class RecommendationUnitvyLoading extends RecommendationUnitvyState {}

class RecommendationUnitvyError extends RecommendationUnitvyState {
  final String message;

  const RecommendationUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class RecommendationUnitvyLoaded extends RecommendationUnitvyState {
  final List<Unitvy> unitvy;

  const RecommendationUnitvyLoaded(this.unitvy);

  @override
  List<Object> get props => [Unitvy];
}