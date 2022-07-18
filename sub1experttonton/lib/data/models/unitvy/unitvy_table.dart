
import 'package:equatable/equatable.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';


class UnitvyTable extends Equatable {

  final int
    id;

  final String?
    name;

  final String?
    posterPath;

  final String?
    overview;

  const UnitvyTable(
      {
    required this
        .id,

    required this
        .name,

    required this
        .posterPath,

    required this
        .overview,
  }
  );


  factory UnitvyTable
      .fromEntity(

      UnitvyDetail tv
      ) =>
      UnitvyTable(

        id: tv
        .id,

        name: tv
        .name,

        posterPath: tv
        .posterPath,

        overview: tv
        .overview,
  );


  factory UnitvyTable
      .fromMap(Map<String,
      dynamic> map)
      => UnitvyTable(

        id: map
        [
          'id'
        ],

        name: map
        [
          'name'
        ],

        posterPath: map
        [
          'posterPath'
        ],

        overview: map
        [
          'overview'
        ],
  );


  Map<String, dynamic>
  toJson() => {

    'id':
        id,

    'name':
        name,

    'posterPath':
        posterPath,

    'overview':
        overview,
  };


  Unitvy toEntity() =>
      Unitvy.watchlist(

    id:
        id,

    overview:
        overview,

    posterPath:
        posterPath,

    name:
        name,
  );


  @override
  List<Object?>
  get props =>
      [
    id,
    name,
    posterPath,
    overview
  ];
}
