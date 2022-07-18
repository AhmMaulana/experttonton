
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';


class GetWatchlistUnitvy {
  final UnitvyRepository
  _repository;

  GetWatchlistUnitvy(
      this.
      _repository
      );


  Future<Either<Failure,
      List<Unitvy>>>

  execute(
      )
  {

    return _repository.
    getWatchlistTv(
    );
  }
}
