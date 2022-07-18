
import 'package:sub1experttonton/domain/entities/movie/movie_detail.dart';

import 'package:sub1experttonton/domain/repositories/movie_repository.dart';

import 'package:sub1experttonton/common/failure.dart';
import 'package:dartz/dartz.dart';


class SaveWatchlist {

  final MovieRepository
  repository;

  SaveWatchlist(
      this.
      repository
      );

  Future<Either<Failure,
      String>> execute(
      MovieDetail movie
      )
  {

    return repository.
    saveWatchlist(
        movie
    );
  }
}
