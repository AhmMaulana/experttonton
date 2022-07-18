
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';
import 'package:dartz/dartz.dart';


class SaveWatchlistUnitvy {
  final UnitvyRepository
  repository;

  SaveWatchlistUnitvy(
      this.
      repository
      );


  Future<Either<Failure, String>>
  execute(
      UnitvyDetail tv
      )
  {

    return repository.
    saveWatchlistTv
      (tv);
  }
}