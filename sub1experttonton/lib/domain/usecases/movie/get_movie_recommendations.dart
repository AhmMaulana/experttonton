
import 'package:sub1experttonton/domain/repositories/movie_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:dartz/dartz.dart';


class GetMovieRecommendations {

  final MovieRepository
  repository;

  GetMovieRecommendations
      (
      this.repository
      );

  Future<Either<Failure,
      List<Movie>>>
    execute(
      id
      )
  {

    return repository
        .getMovieRecommendations
      (
        id
    );
  }
}
