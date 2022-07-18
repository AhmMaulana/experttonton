part of 'detail_unitvy_bloc.dart';

abstract class DetailUnitvyState extends Equatable {
  const DetailUnitvyState();

  @override
  List<Object> get props => [];
}

class DetailUnitvyEmpty extends DetailUnitvyState {}

class DetailUnitvyLoading extends DetailUnitvyState {}

class DetailUnitvyError extends DetailUnitvyState {
  final String message;

  const DetailUnitvyError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailUnitvyLoaded extends DetailUnitvyState {
  final UnitvyDetail unitvyDetail;

  const DetailUnitvyLoaded(this.unitvyDetail);

  @override
  List<Object> get props => [unitvyDetail];
}