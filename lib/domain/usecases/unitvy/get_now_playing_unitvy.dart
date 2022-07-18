
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';


class GetNowPlayingUnitvy {

  final UnitvyRepository
      repository;

  GetNowPlayingUnitvy(
      this.
      repository
      );


  Future<Either<Failure,
      List<Unitvy>>>
      execute(

      )
  {

    return repository.
    getNowPlayingTv(
    );
  }
}
