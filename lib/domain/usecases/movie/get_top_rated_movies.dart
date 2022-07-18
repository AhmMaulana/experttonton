
import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:sub1experttonton/domain/repositories/movie_repository.dart';

import 'package:sub1experttonton/common/failure.dart';


import 'package:dartz/dartz.dart';


class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(
      this.repository
      );

  Future<Either<Failure,
      List<Movie>>>
  execute(

      )
  {

    return repository
        .getTopRatedMovies(

    );
  }
}
