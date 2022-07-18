import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_status_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/remove_watchlist_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/save_watchlist_unitvy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_unitvy_event.dart';
part 'watchlist_unitvy_state.dart';

class WatchlistUnitvyBloc extends
Bloc<WatchlistUnitvyEvent,
    WatchlistUnitvyState> {

  static const watchlistAddSuccessMessage =
      'Added to Watchlist';

  static const watchlistRemoveSuccessMessage =
      'Removed from Watchlist';

  final GetWatchlistUnitvy
        getWatchlistUnitvy;
  final GetWatchListStatusUnitvy
        getWatchListStatus;
  final SaveWatchlistUnitvy
        saveWatchlist;
  final RemoveWatchlistUnitvy
        removeWatchlist;

  WatchlistUnitvyBloc({
    required this
        .getWatchlistUnitvy,
    required this
        .getWatchListStatus,
    required this
        .saveWatchlist,
    required this
        .removeWatchlist,
    }
  ) : super(WatchlistUnitvyEmpty()) {
    on<GetListEvent>((event, emit) async {
      emit(WatchlistUnitvyLoading()
      );

      final result = await getWatchlistUnitvy
          .execute();
      result.fold(
            (failure) {
          emit(WatchlistUnitvyError(
              failure.message)
          );
        },
            (data) {
          emit(WatchlistUnitvyLoaded(data)
          );
        },
      );
    }
    );

    on<GetStatusUnitvyEvent>((event, emit) async {
      final id = event.id;
      final result = await getWatchListStatus
          .execute(id);

      emit(WatchlistUnitvyStatusLoaded(
          result)
      );
    }
    );

    on<AddItemUnitvyEvent>((event, emit) async {
      final tvDetail = event.unitvyDetail;
      final result = await saveWatchlist.execute(tvDetail);

      result.fold(
            (failure) {
          emit(WatchlistUnitvyError(failure.message));
        },
            (successMessage) {
          emit(WatchlistUnitvySuccess(successMessage));
        },
      );
    });

    on<RemoveItemUnitvyEvent>((event, emit) async {
      final tvDetail = event.unitvyDetail;
      final result = await removeWatchlist.execute(tvDetail);

      result.fold(
            (failure) {
          emit(WatchlistUnitvyError(failure.message));
        },
            (successMessage) {
          emit(WatchlistUnitvySuccess(successMessage));
        },
      );
    });
  }
}