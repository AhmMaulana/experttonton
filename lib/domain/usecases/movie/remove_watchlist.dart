
import 'package:sub1experttonton/domain/entities/movie/movie_detail.dart';
import 'package:sub1experttonton/common/failure.dart';

import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/domain/repositories/movie_repository.dart';

class RemoveWatchlist {

  final MovieRepository
  repository;

  RemoveWatchlist(
      this.
      repository
      );

  Future<Either<Failure,
      String>>

  execute(
      MovieDetail movie
      ) {

    return repository
        .removeWatchlist(
        movie
    );
  }
}
