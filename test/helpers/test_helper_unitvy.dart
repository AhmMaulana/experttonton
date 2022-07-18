
import 'package:mockito/annotations.dart';
import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';
import 'package:http/http.dart' as http;

import 'package:sub1experttonton/data/datasources/unitvy/unitvy_remote_data_source.dart';
import 'package:sub1experttonton/data/datasources/db/database_helper_unitvy.dart';
import 'package:sub1experttonton/data/datasources/unitvy/unitvy_local_data_source.dart';


@GenerateMocks([
  UnitvyRepository,
  UnitvyRemoteDataSource,
  UnitvyLocalDataSource,
  DatabaseHelperUnitvy,

],
    customMocks: [
  MockSpec<http.Client>
    (as: #MockHttpClient)
]
)

void main() {}
