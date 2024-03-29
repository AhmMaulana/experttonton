
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
class Unitvy
    extends Equatable {
  Unitvy(
      {

    required this
        .backdropPath,

    required this
        .genreIds,

    required this
        .id,

    required this
        .originalName,

    required this
        .overview,

    required this
        .popularity,

    required this
        .posterPath,

    required this
        .firstAirDate,

    required this
        .name,

    required this
        .voteAverage,

    required this
        .voteCount,
  }
  );


  Unitvy.watchlist(
      {

    required this
        .id,

    required this
        .overview,

    required this
        .posterPath,

    required this
        .name,

  }
  );


  String?
      backdropPath;

  List<int>?
      genreIds;

  int
      id;

  String?
      originalName;

  String?
      overview;

  double?
      popularity;

  String?
      posterPath;

  String?
      firstAirDate;

  String?
      name;

  double?
      voteAverage;

  int?
      voteCount;


  @override
  List<Object?>
  get props => [
    backdropPath,
    genreIds,

    id,
    originalName,

    overview,
    popularity,

    posterPath,
    firstAirDate,

    name,
    voteAverage,

    voteCount,
  ];
}
