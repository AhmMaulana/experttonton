
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';
import 'package:dartz/dartz.dart';

class GetUnitvyDetail {

  final UnitvyRepository
  repository;

  GetUnitvyDetail(
      this.
      repository
      );

  Future<Either<Failure,
      UnitvyDetail>>
  execute(
      int id
      )
  {

    return repository.
    getTvDetail
      (id);
  }
}
