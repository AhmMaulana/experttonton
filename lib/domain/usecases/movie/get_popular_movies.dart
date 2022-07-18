
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/domain/repositories/movie_repository.dart';


class GetPopularMovies {

  final MovieRepository
    repository;

  GetPopularMovies(
      this.repository
      );

  Future<Either<Failure,
      List<Movie>>>
  execute(
      )
  {

    return repository
        .getPopularMovies(

    );
  }
}
