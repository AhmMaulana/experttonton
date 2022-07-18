
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

class GetPopularUnitvy {

  final UnitvyRepository
  repository;

  GetPopularUnitvy(
      this.
      repository
      );


  Future<Either<Failure,
      List<Unitvy>>>
  execute(

      )
  {

    return repository.
    getPopularTv(

    );
  }
}
