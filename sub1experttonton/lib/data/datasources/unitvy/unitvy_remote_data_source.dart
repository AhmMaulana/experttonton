import 'package:sub1experttonton/data/models/unitvy/unitvy_response.dart';

import 'package:sub1experttonton/common/exception.dart';

import 'package:sub1experttonton/data/models/unitvy/unitvy_detail_model.dart';
import 'package:http/http.dart' as http;

import 'package:sub1experttonton/data/models/unitvy/unitvy_model.dart';

import 'dart:convert';



abstract class UnitvyRemoteDataSource {
  Future<List<UnitvyModel>>
    getNowPlayingTv(
      );

  Future<List<UnitvyModel>>
    getPopularTv(
      );

  Future<List<UnitvyModel>>
    getTopRatedTv(
      );

  Future<UnitvyDetailResponse>
    getTvDetail(
      int id
      );

  Future<List<UnitvyModel>>
    getTvRecommendations(
      int id
      );

  Future<List<UnitvyModel>>
    searchTv(
      String query
      );
}


class UnitvyRemoteDataSourceImpl implements
    UnitvyRemoteDataSource
{

  static const apiKey =
      'api_key=2174d146bb9c0eab47529b2e77d6b526';

  static const baseUrl =
      'https://api.themoviedb.org/3';

  final http
      .Client client;

  UnitvyRemoteDataSourceImpl(
      {
        required this.client
      }
      );


  @override
  Future<List<UnitvyModel>>

  getNowPlayingTv
      (
      )
  async
  {

    final response =

    await client.get(
        Uri.parse(
            '$baseUrl/tv/on_the_air?$apiKey'
        )
    );

    if (
    response.statusCode == 200) {

      return UnitvyResponse
          .fromJson
        (
          json.decode(
              response.body
          )
      )
          .tvList;

    }
    else
    {

      throw ServerException(

      );
    }
  }


  @override
  Future<UnitvyDetailResponse>
    getTvDetail(
      int id
      )
  async
  {

    final response =

    await client.get(
        Uri.parse(
            '$baseUrl/tv/$id?$apiKey'
        )
    );

    if
    (
    response.statusCode == 200
    )
    {

      return UnitvyDetailResponse
          .fromJson
        (
          json.decode(
              response.body
          )
      );

    }
    else
    {

      throw ServerException(

      );
    }
  }


  @override
  Future<List<UnitvyModel>>
    getTvRecommendations(
      int id
      )

  async
  {
    final response =
    await client
        .get(Uri.parse
      (
        '$baseUrl/tv/$id/recommendations?$apiKey'
    )
    );

    if (
    response.statusCode == 200
    )

    {

      return UnitvyResponse
          .fromJson
        (
          json.decode(
              response.body
          )
      )
          .tvList;
    }

    else
    {

      throw ServerException(
      );

    }
  }


  @override
  Future<List<UnitvyModel>>
  getPopularTv(

      )
  async {
    final response =
    await client.get(
        Uri.parse(
            '$baseUrl/tv/popular?$apiKey'
        )
    );

    if (
    response.statusCode == 200
    )
    {

      return UnitvyResponse
          .fromJson
        (
          json.decode(
              response.body
          )
      )
          .tvList;
    }

    else
    {

      throw ServerException();
    }
  }


  @override
  Future<List<UnitvyModel>>
  getTopRatedTv(

      )
  async
  {

    final response =
    await client.get(
        Uri.parse(
            '$baseUrl/tv/top_rated?$apiKey'
        )
    );

    if (
    response.statusCode == 200
    )

    {

      return UnitvyResponse.fromJson(
          json.decode(
              response.body
          )
      )
          .tvList;

    }

    else {

      throw ServerException();
    }
  }


  @override
  Future<List<UnitvyModel>>
  searchTv(
      String query
      )
  async
  {

    final response =
    await client
        .get(
        Uri.parse(
            '$baseUrl/search/tv?$apiKey&query=$query'
        )
    );

    if (
    response
        .statusCode == 200
    )

    {
      return UnitvyResponse
          .fromJson
        (
          json.decode(
              response.body
          )
      )
          .tvList;

    }

    else {

      throw ServerException(

      );
    }
  }
}
