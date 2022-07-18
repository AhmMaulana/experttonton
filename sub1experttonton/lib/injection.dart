import 'package:sub1experttonton/data/datasources/db/database_helper_unitvy.dart';
import 'package:sub1experttonton/data/datasources/movie/movie_local_data_source.dart';
import 'package:sub1experttonton/data/datasources/db/database_helper.dart';
import 'package:sub1experttonton/data/datasources/ssl_pin/ssl_pinning.dart';

import 'package:sub1experttonton/data/datasources/unitvy/unitvy_local_data_source.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:sub1experttonton/data/datasources/movie/movie_remote_data_source.dart';
import 'package:sub1experttonton/data/repositories/movie_repository_impl.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_movie_detail.dart';

import 'package:sub1experttonton/data/datasources/unitvy/unitvy_remote_data_source.dart';
import 'package:sub1experttonton/domain/repositories/movie_repository.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:sub1experttonton/data/repositories/unitvy_repository_impl.dart';

import 'package:sub1experttonton/domain/repositories/unitvy_repository.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:sub1experttonton/domain/usecases/movie/search_movies.dart';

import 'package:sub1experttonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:sub1experttonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_top_rated_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/movie/save_watchlist.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_detail.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_now_playing_unitvy.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/detail_unitvy_bloc/detail_unitvy_bloc.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_popular_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/remove_watchlist_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_status_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_watchlist_unitvy.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/top_rated_unitvy_bloc/top_rated_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/detail_movie_bloc/detail_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/recommendation_unitvy_bloc/recommendation_unitvy_bloc.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/get_unitvy_recomendations.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/now_playing_movie_bloc/now_playing_movie_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/popular_movie_bloc/popular_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/on_air_unitvy_bloc/on_air_unitvy_bloc.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/search_unitvy.dart';
import 'package:sub1experttonton/domain/usecases/unitvy/save_watchlist_unitvy.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/watchlist_movie_bloc/watchlist_movie_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/search_unitvy_bloc/search_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/search_movie_bloc/search_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/recommendation_movie_bloc/recommendation_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/popular_unitvy_bloc/popular_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/watchlist_unitvy_bloc/watchlist_unitvy_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => DetailMovieBloc(
    getMovieDetail: locator(),
  ));
  locator.registerFactory(
        () => NowPlayingMovieBloc(locator()),
  );
  locator.registerFactory(
        () => PopularMovieBloc(locator()),
  );
  locator.registerFactory(() => RecommendationMovieBloc(
    getMovieRecommendations: locator(),
  ));
  locator.registerFactory(() => SearchMovieBloc(
    searchMovies: locator(),
  ));
  locator.registerFactory(
        () => TopRatedMovieBloc(locator()),
  );
  locator.registerFactory(() => DetailUnitvyBloc(
    getDetailUnitvy: locator(),
  ));
  locator.registerFactory(
        () => OnAirUnitvyBloc(locator()),
  );
  locator.registerFactory(
        () => PopularUnitvyBloc(locator()),
  );
  locator.registerFactory(() => RecommendationUnitvyBloc(
    getUnitvyRecommendations: locator(),
  ));
  locator.registerFactory(() => SearchUnitvyBloc(
    searchUnitvy: locator(),
  ));
  locator.registerFactory(
        () => TopRatedUnitvyBloc(locator()),
  );
  locator.registerFactory(() => WatchlistMovieBloc(
    getWatchlistMovies: locator(),
    getWatchListStatus: locator(),
    saveWatchlist: locator(),
    removeWatchlist: locator(),
  ));
  locator.registerFactory(() => WatchlistUnitvyBloc(
    getWatchlistUnitvy: locator(),
    getWatchListStatus: locator(),
    saveWatchlist: locator(),
    removeWatchlist: locator(),
    )
  );


  //usecase
  locator.registerLazySingleton(() =>
      GetMovieRecommendations(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetPopularMovies(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetTopRatedMovies(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetMovieDetail(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      SearchMovies(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      SaveWatchlist(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      RemoveWatchlist(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetWatchListStatus(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetNowPlayingMovies(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetWatchlistMovies(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetUnitvyRecommendations(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetPopularUnitvy(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetWatchListStatusUnitvy(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetUnitvyDetail(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      SearchUnitvy(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      GetWatchlistUnitvy(
          locator()
      )
  );


  locator.registerLazySingleton(() =>
      SaveWatchlistUnitvy(
          locator()
      )
  );
  locator.registerLazySingleton(() =>
      GetTopRatedUnitvy(
          locator()
      )
  );
  locator.registerLazySingleton(() =>
      GetNowPlayingUnitvy(
          locator()
      )
  );

  locator.registerLazySingleton(() =>
      RemoveWatchlistUnitvy(
          locator()
      )
  );


  // repository
  locator.registerLazySingleton<UnitvyRepository>(
        () => UnitvyRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );


  // data sources
  locator.registerLazySingleton<UnitvyRemoteDataSource>(
          () => UnitvyRemoteDataSourceImpl(
              client: locator()
          )
  );
  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(
              databaseHelper: locator()
          )
  );

  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(
              client: locator()
          )
  );
  locator.registerLazySingleton<UnitvyLocalDataSource>(
          () => UnitvyLocalDataSourceImpl(
              databaseHelperunitvy: locator()
          )
  );


  // helper
  locator.registerLazySingleton<DatabaseHelperUnitvy>(()
      => DatabaseHelperUnitvy()
  );

  locator.registerLazySingleton<DatabaseHelper>(()
      => DatabaseHelper()
  );

  // external
  locator.registerLazySingleton(() => SSLPinning.client);
}
