
import 'package:sub1experttonton/common/exception.dart';

import 'package:sub1experttonton/common/failure.dart';

import 'package:sub1experttonton/data/datasources/unitvy/unitvy_remote_data_source.dart';

import 'package:sub1experttonton/data/models/unitvy/unitvy_table.dart';

import 'package:dartz/dartz.dart';

import 'package:sub1experttonton/data/datasources/unitvy/unitvy_local_data_source.dart';

import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'dart:io';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';


class UnitvyRepositoryImpl
    implements UnitvyRepository {

  final UnitvyRemoteDataSource
  remoteDataSource;

  final UnitvyLocalDataSource
  localDataSource;

  UnitvyRepositoryImpl(
      {

    required this
        .remoteDataSource,

    required this
        .localDataSource,
  }
  );


  @override
  Future<Either<Failure,
      List<Unitvy>>>
      getNowPlayingTv(
      )
  async
  {

    try
    {
      final result =
      await remoteDataSource
          .getNowPlayingTv(
      );

      return Right(result.map(
              (model) => model
          .toEntity(
              )
      )
          .toList(
      )
      );
    }


    on ServerException
    {
      return const Left(
          ServerFailure
            (
              ''
          )
      );
    }


    on SocketException
    {
      return const Left(
          ConnectionFailure
            (
              'Failed to connect to the network'
          )
      );
    }

    on TlsException {
      return const Left(
          SslFailure(
              'Certificate unvalid'
          )
      );
    }
  }


  @override
  Future<Either<Failure,
      UnitvyDetail>>
    getTvDetail(
      int id
      )
  async
  {

    try
    {
      final result =
      await remoteDataSource
          .getTvDetail(
          id
      );

      return Right(
          result.toEntity(
          )
      );
    }


    on ServerException
    {

      return const Left(
          ServerFailure
            (
              ''
          )
      );
    }


    on SocketException
    {

      return const Left(
          ConnectionFailure
            (
              'Failed to connect to the network'
          )
      );
    }

    on TlsException {
      return const Left(
          SslFailure(
              'Certificate unvalid'
          )
      );
    }
  }


  @override
  Future<Either<Failure,
      List<Unitvy>>>
    getUnitvyRecommendations(
      int id
      )
  async
  {

    try
    {
      final result =
      await remoteDataSource
          .getTvRecommendations
        (
          id
      );

      return Right(result.map(
              (model) => model
          .toEntity(
      )
      )
          .toList(
      )
      );
    }


    on ServerException
    {

      return const Left(
          ServerFailure
            (
              ''
          )
      );
    }


    on SocketException
    {

      return const Left(
          ConnectionFailure
            (
              'Failed to connect to the network'
          )
      );
    }

    on TlsException {
      return const Left(
          SslFailure(
              'Certificate unvalid'
          )
      );
    }
  }


  @override
  Future<Either<Failure,
      List<Unitvy>>>
      getPopularTv(

      )
  async
  {

    try
    {

      final result =
      await remoteDataSource
          .getPopularTv(

      );

      return Right(result.map(
              (model) => model
          .toEntity(
      )
      )
          .toList(
      )
      );
    }


    on ServerException {
      return const Left(
          ServerFailure
            (
              ''
          )
      );
    }


    on SocketException
    {

      return const Left(
          ConnectionFailure
            (
              'Failed to connect to the network'
          )
      );
    }

    on TlsException {
      return const Left(
          SslFailure(
              'Certificate unvalid'
          )
      );
    }
  }


  @override
  Future<Either<Failure,
      List<Unitvy>>>
      getTopRatedTv(
      )
  async
  {
    try
    {

      final result =
      await remoteDataSource
          .getTopRatedTv(
      );

      return Right(result.map(
              (model) => model
          .toEntity(
      )
      )
          .toList(
      )
      );
    }


    on ServerException
    {
      return const Left(
          ServerFailure
            (
              ''
          )
      );
    }


    on SocketException
    {

      return const Left(
          ConnectionFailure
            (
              'Failed to connect to the network'
          )
      );
    }

    on TlsException {
      return const Left(
          SslFailure(
              'Certificate unvalid'
          )
      );
    }
  }


  @override
  Future<Either<Failure,
      List<Unitvy>>>
      searchTv(

      String query
      )
  async
  {

    try
    {
      final result =
      await remoteDataSource
          .searchTv(
          query
      );

      return Right(result.map(
              (model) => model
          .toEntity(
      )
      )
          .toList(
      )
      );
    }


    on ServerException {
      return const Left(
          ServerFailure
            (
              ''
          )
      );
    }


    on SocketException
    {
      return const Left(
          ConnectionFailure
            (
              'Failed to connect to the network'
          )
      );
    }

    on TlsException {
      return const Left(
          SslFailure(
              'Certificate unvalid'
          )
      );
    }
  }


  @override
  Future<Either<Failure,
      String>>
      saveWatchlistTv(
      UnitvyDetail tv
      )
  async
  {

    try
    {
      final result =
      await localDataSource
          .insertWatchlistTv(
          UnitvyTable.fromEntity
            (
              tv
          )
      );

      return Right(
          result
      );
    }


    on DatabaseException
    catch (e)
    {

      return Left(
          DatabaseFailure
            (
              e.message
          )
      );
    }

    catch
    (e)
    {

      rethrow;
    }
  }


  @override
  Future<Either<Failure,
      String>>
      removeWatchlistTv(
      UnitvyDetail tv
      )
  async
  {

    try
    {
      final result =
      await localDataSource
          .removeWatchlistTv(
          UnitvyTable.fromEntity
            (
              tv
          )
      );


      return Right(
          result
      );
    }


    on DatabaseException
    catch (e)
    {

      return Left(
          DatabaseFailure
            (
              e.message
          )
      );
    }
  }


  @override
  Future<bool>
  isAddedToWatchlistTv(
      int id
      )
  async
  {

    final result =
    await localDataSource
        .getTvById(
        id
    );


    return result != null;
  }


  @override
  Future<Either<Failure,
      List<Unitvy>>>
      getWatchlistTv(
      )
  async
  {


    final result = await
    localDataSource
        .getWatchlistTv
      (
    );

    return Right(result.map(
            (data) => data
        .toEntity(
    )
    )
        .toList(
    )
    );
  }
}
