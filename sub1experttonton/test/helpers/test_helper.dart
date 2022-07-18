import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:sub1experttonton/domain/repositories/movie_repository.dart';
import 'package:sub1experttonton/data/datasources/movie/movie_local_data_source.dart';

import 'package:sub1experttonton/data/datasources/db/database_helper.dart';
import 'package:sub1experttonton/data/datasources/movie/movie_remote_data_source.dart';


@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
],
    customMocks: [
  MockSpec<http.Client>
    (as: #MockHttpClient)
])

void main() {}
