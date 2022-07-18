
import 'package:sub1experttonton/common/failure.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:dartz/dartz.dart';

class GetUnitvyRecommendations {

  final UnitvyRepository
  repository;

  GetUnitvyRecommendations(
      this.
      repository
      );

  Future<Either<Failure,
      List<Unitvy>>>
  execute(
      id
      )
  {

    return repository.
    getUnitvyRecommendations
      (id);
  }
}
