
import 'package:sub1experttonton/data/models/unitvy/unitvy_model.dart';

import 'package:equatable/equatable.dart';

class UnitvyResponse
    extends Equatable
{

  final List<UnitvyModel>
  tvList;

  const UnitvyResponse(
      {
        required this.tvList
      }
      );


  factory UnitvyResponse
      .fromJson
      (

      Map<String, dynamic>
      json) =>
      UnitvyResponse(


      tvList: List<UnitvyModel>
        .from((json
    [
          "results"
    ] as List
    )

        .map((x) => UnitvyModel
          .fromJson(x)
    )

        .where((element) => element
          .posterPath != null
      )
    ),
  );


  Map<String, dynamic>
  toJson() => {
    "results":

    List<dynamic>.from
      (
        tvList.map((x) =>
            x.toJson()
        )
    ),
  };


  @override
  List<Object>
  get props =>
      [
    tvList
  ];
}
