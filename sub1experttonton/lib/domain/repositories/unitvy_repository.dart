
import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:dartz/dartz.dart';

abstract class
  UnitvyRepository {

  Future<Either<Failure,
      List<Unitvy>>>
      getNowPlayingTv(
      );

  Future<Either<Failure,
      List<Unitvy>>>
      getPopularTv(
      );

  Future<Either<Failure,
      List<Unitvy>>>
      getTopRatedTv(
      );

  Future<Either<Failure,
      UnitvyDetail>>
      getTvDetail(
      int id
      );

  Future<Either<Failure,
      List<Unitvy>>>
      getUnitvyRecommendations(
      int id
      );

  Future<Either<Failure,
      List<Unitvy>>>
      searchTv(
      String query
      );

  Future<Either<Failure,
      String>>
      saveWatchlistTv(
      UnitvyDetail tv
      );

  Future<Either<Failure,
      String>>
      removeWatchlistTv(
      UnitvyDetail tv
      );

  Future<bool>
      isAddedToWatchlistTv(
      int id
      );

  Future<Either<Failure,
      List<Unitvy>>>
      getWatchlistTv(
      );

}
