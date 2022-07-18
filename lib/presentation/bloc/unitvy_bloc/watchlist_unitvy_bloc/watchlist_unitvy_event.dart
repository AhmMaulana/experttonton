part of 'watchlist_unitvy_bloc.dart';

abstract class WatchlistUnitvyEvent extends Equatable {
  const WatchlistUnitvyEvent();

  @override
  List<Object> get props => [];
}

class GetListEvent extends WatchlistUnitvyEvent {}

class GetStatusUnitvyEvent extends WatchlistUnitvyEvent {
  final int id;

  const GetStatusUnitvyEvent(this.id);

  @override
  List<Object> get props => [id];
}

class AddItemUnitvyEvent extends WatchlistUnitvyEvent {
  final UnitvyDetail unitvyDetail;

  const AddItemUnitvyEvent(this.unitvyDetail);

  @override
  List<Object> get props => [unitvyDetail];
}

class RemoveItemUnitvyEvent extends WatchlistUnitvyEvent {
  final UnitvyDetail unitvyDetail ;

  const RemoveItemUnitvyEvent(this.unitvyDetail);

  @override
  List<Object> get props => [unitvyDetail];
}