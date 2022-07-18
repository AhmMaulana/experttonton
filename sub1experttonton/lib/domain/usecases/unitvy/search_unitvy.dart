import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:dartz/dartz.dart';


class SearchUnitvy {
  final UnitvyRepository
  repository;

  SearchUnitvy(
      this.
      repository
      );


  Future<Either<Failure,
      List<Unitvy>>>
  execute(
      String query
      )
  {

    return repository.
    searchTv(
        query
    );
  }
}
