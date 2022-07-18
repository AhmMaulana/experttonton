// Mocks generated by Mockito 5.2.0 from annotations
// in sub1experttonton/test/helpers/test_helper_unitvy.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i16;
import 'dart:typed_data' as _i17;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite/sqflite.dart' as _i15;
import 'package:sub1experttonton/common/failure.dart' as _i7;
import 'package:sub1experttonton/data/datasources/db/database_helper_unitvy.dart'
    as _i14;
import 'package:sub1experttonton/data/datasources/unitvy/unitvy_local_data_source.dart'
    as _i12;
import 'package:sub1experttonton/data/datasources/unitvy/unitvy_remote_data_source.dart'
    as _i10;
import 'package:sub1experttonton/data/models/unitvy/unitvy_detail_model.dart'
    as _i3;
import 'package:sub1experttonton/data/models/unitvy/unitvy_model.dart' as _i11;
import 'package:sub1experttonton/data/models/unitvy/unitvy_table.dart' as _i13;
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart' as _i8;
import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart'
    as _i9;
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeUnitvyDetailResponse_1 extends _i1.Fake
    implements _i3.UnitvyDetailResponse {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [UnitvyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUnitvyRepository extends _i1.Mock implements _i5.UnitvyRepository {
  MockUnitvyRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>> getNowPlayingTv() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTv, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Unitvy>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Unitvy>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>> getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Unitvy>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.UnitvyDetail>> getTvDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
          returnValue: Future<_i2.Either<_i7.Failure, _i9.UnitvyDetail>>.value(
              _FakeEither_0<_i7.Failure, _i9.UnitvyDetail>())) as _i6
          .Future<_i2.Either<_i7.Failure, _i9.UnitvyDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>
      getUnitvyRecommendations(int? id) => (super.noSuchMethod(
          Invocation.method(#getUnitvyRecommendations, [id]),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Unitvy>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>> searchTv(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Unitvy>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistTv(
          _i9.UnitvyDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTv, [tv]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlistTv(
          _i9.UnitvyDetail? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlistTv(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTv, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
          returnValue: Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>.value(
              _FakeEither_0<_i7.Failure, List<_i8.Unitvy>>())) as _i6
          .Future<_i2.Either<_i7.Failure, List<_i8.Unitvy>>>);
}

/// A class which mocks [UnitvyRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUnitvyRemoteDataSource extends _i1.Mock
    implements _i10.UnitvyRemoteDataSource {
  MockUnitvyRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.UnitvyModel>> getNowPlayingTv() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTv, []),
              returnValue:
                  Future<List<_i11.UnitvyModel>>.value(<_i11.UnitvyModel>[]))
          as _i6.Future<List<_i11.UnitvyModel>>);
  @override
  _i6.Future<List<_i11.UnitvyModel>> getPopularTv() =>
      (super.noSuchMethod(Invocation.method(#getPopularTv, []),
              returnValue:
                  Future<List<_i11.UnitvyModel>>.value(<_i11.UnitvyModel>[]))
          as _i6.Future<List<_i11.UnitvyModel>>);
  @override
  _i6.Future<List<_i11.UnitvyModel>> getTopRatedTv() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTv, []),
              returnValue:
                  Future<List<_i11.UnitvyModel>>.value(<_i11.UnitvyModel>[]))
          as _i6.Future<List<_i11.UnitvyModel>>);
  @override
  _i6.Future<_i3.UnitvyDetailResponse> getTvDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvDetail, [id]),
              returnValue: Future<_i3.UnitvyDetailResponse>.value(
                  _FakeUnitvyDetailResponse_1()))
          as _i6.Future<_i3.UnitvyDetailResponse>);
  @override
  _i6.Future<List<_i11.UnitvyModel>> getTvRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvRecommendations, [id]),
              returnValue:
                  Future<List<_i11.UnitvyModel>>.value(<_i11.UnitvyModel>[]))
          as _i6.Future<List<_i11.UnitvyModel>>);
  @override
  _i6.Future<List<_i11.UnitvyModel>> searchTv(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTv, [query]),
              returnValue:
                  Future<List<_i11.UnitvyModel>>.value(<_i11.UnitvyModel>[]))
          as _i6.Future<List<_i11.UnitvyModel>>);
}

/// A class which mocks [UnitvyLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUnitvyLocalDataSource extends _i1.Mock
    implements _i12.UnitvyLocalDataSource {
  MockUnitvyLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTv(_i13.UnitvyTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTv(_i13.UnitvyTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i13.UnitvyTable?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<_i13.UnitvyTable?>.value())
          as _i6.Future<_i13.UnitvyTable?>);
  @override
  _i6.Future<List<_i13.UnitvyTable>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue:
                  Future<List<_i13.UnitvyTable>>.value(<_i13.UnitvyTable>[]))
          as _i6.Future<List<_i13.UnitvyTable>>);
}

/// A class which mocks [DatabaseHelperUnitvy].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperUnitvy extends _i1.Mock
    implements _i14.DatabaseHelperUnitvy {
  MockDatabaseHelperUnitvy() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i15.Database?> get databaseunitvy =>
      (super.noSuchMethod(Invocation.getter(#databaseunitvy),
              returnValue: Future<_i15.Database?>.value())
          as _i6.Future<_i15.Database?>);
  @override
  _i6.Future<int> insertWatchlistTv(_i13.UnitvyTable? tv) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistTv, [tv]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTv(_i13.UnitvyTable? tv) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistTv, [tv]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTv() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTv, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i16.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i17.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i17.Uint8List>.value(_i17.Uint8List(0)))
          as _i6.Future<_i17.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
