
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';


class RemoveWatchlistUnitvy {
  final UnitvyRepository
  repository;

  RemoveWatchlistUnitvy(
      this.
      repository
      );


  Future<Either<Failure,
      String>>
  execute(
      UnitvyDetail tv
      )
  {

    return repository.
    removeWatchlistTv
      (tv);
  }
}
