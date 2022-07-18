part of 'detail_unitvy_bloc.dart';

abstract class DetailUnitvyEvent extends Equatable {
  const DetailUnitvyEvent();

  @override
  List<Object> get props => [];
}

class GetDetailUnitvyEvent extends DetailUnitvyEvent {
  final int id;

  const GetDetailUnitvyEvent(this.id);

  @override
  List<Object> get props => [];
}