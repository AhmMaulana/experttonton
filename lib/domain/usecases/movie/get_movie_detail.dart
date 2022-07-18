
import 'package:sub1experttonton/domain/repositories/movie_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/movie/movie_detail.dart';

import 'package:dartz/dartz.dart';

class GetMovieDetail {
  final MovieRepository
  repository;

  GetMovieDetail
      (
      this.repository
      );

  Future<Either<Failure,
      MovieDetail>>
    execute(
      int id
      )
  {

    return repository
        .getMovieDetail
      (
        id
    );
  }
}
