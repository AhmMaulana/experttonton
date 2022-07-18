
import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:dartz/dartz.dart';

class GetTopRatedUnitvy {

  final UnitvyRepository
  repository;

  GetTopRatedUnitvy(
      this.
      repository
      );

  Future<Either<Failure,
      List<Unitvy>>>
  execute(

      )
  {

    return repository.
    getTopRatedTv(
    );
  }
}
