
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:sub1experttonton/domain/repositories/movie_repository.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:dartz/dartz.dart';

class SearchMovies {

  final MovieRepository
  repository;

  SearchMovies(
      this.
      repository
      );

  Future<Either<Failure,
      List<Movie>>> execute(
      String query
      )
  {

    return repository.
    searchMovies
      (
        query
    );
  }
}
