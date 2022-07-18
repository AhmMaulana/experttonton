
import 'package:sub1experttonton/presentation/ui/pages/unitvy/home_unitvy_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/about_page.dart';

import 'package:sub1experttonton/common/styles.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/movie_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sub1experttonton/presentation/ui/pages/movie/home_movie_page.dart';
import 'package:sub1experttonton/common/utils.dart';
import 'package:sub1experttonton/data/datasources/ssl_pin/ssl_pinning.dart';

import 'package:sub1experttonton/presentation/ui/pages/unitvy/popular_unitvy_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/search_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:sub1experttonton/presentation/ui/pages/movie/popular_movies_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/top_rated_movies_page.dart';

import 'package:sub1experttonton/presentation/ui/pages/unitvy/search_page_unitvy.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/top_rated_unitvy_page.dart';

import 'package:flutter/material.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/unitvy_detail_page.dart';

import 'package:sub1experttonton/presentation/ui/pages/movie/watchlist_movies_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/watchlist_unitvy_page.dart';

import 'package:provider/provider.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/detail_movie_bloc/detail_movie_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/movie_bloc/recommendation_movie_bloc/recommendation_movie_bloc.dart';
import 'package:sub1experttonton/injection.dart' as di;
import 'package:sub1experttonton/presentation/bloc/movie_bloc/now_playing_movie_bloc/now_playing_movie_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/movie_bloc/search_movie_bloc/search_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/movie_bloc/watchlist_movie_bloc/watchlist_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/popular_movie_bloc/popular_movie_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/top_rated_unitvy_bloc/top_rated_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/recommendation_unitvy_bloc/recommendation_unitvy_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/popular_unitvy_bloc/popular_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/unitvy_screen.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/detail_unitvy_bloc/detail_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/search_unitvy_bloc/search_unitvy_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/on_air_unitvy_bloc/on_air_unitvy_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/watchlist_unitvy_bloc/watchlist_unitvy_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SSLPinning.init();
  await Firebase.initializeApp();
  di.init();
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // bloc movie
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),

        // bloc unitvy
        BlocProvider(
          create: (_) => di.locator<DetailUnitvyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RecommendationUnitvyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchUnitvyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularUnitvyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedUnitvyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnAirUnitvyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistUnitvyBloc>(),
        ),

      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark()
            .copyWith(
          colorScheme:
              kColorScheme,

          primaryColor:
              kRichBlack,

          scaffoldBackgroundColor:
              kRichBlack,

          textTheme:
              kTextTheme,
        ),


        home: const SplashScreen(),
        navigatorObservers:
            [routeObserver],
        onGenerateRoute:
            (RouteSettings settings)
        {

          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) =>
                  const HomeMoviePage());

            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) =>
                  const TopRatedMoviesPage());


            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) =>
                  const PopularMoviesPage());

              case MovieDetailPage.routeName:
              final id = settings.arguments as int;

              return MaterialPageRoute(
                builder: (_) =>
                    MovieDetailPage
                  (id: id),
                settings: settings,
              );


            case '/tv':
              return MaterialPageRoute(builder: (_) =>
                  const HomeUnitvyPage());

            case TopRatedUnitvyPage.routeName:
              return CupertinoPageRoute(builder: (_) =>
                  const TopRatedUnitvyPage());

              case PopularUnitvyPage.routeName:
              return CupertinoPageRoute(builder: (_) =>
                  const PopularUnitvyPage());


            case UnitvyDetailPage.routeName:
              final id = settings.arguments as int;

              return MaterialPageRoute(
                builder: (_) => UnitvyDetailPage(id: id),
                settings: settings,
              );

              case SearchUnitvyPage.routeName:
              return CupertinoPageRoute(builder: (_) =>
                  const SearchUnitvyPage());

              case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) =>
                  const SearchPage());

              case WatchlistUnitvyPage.routeName:
              return MaterialPageRoute(builder: (_) =>
                  const WatchlistUnitvyPage());

              case WatchlistMoviesPage.routeName:
              return MaterialPageRoute(builder: (_) =>
                  const WatchlistMoviesPage());

              case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) =>
                  const AboutPage());

              default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                        'Page not found :'
                    ),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
