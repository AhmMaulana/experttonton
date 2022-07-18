
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/top_rated_movies_page.dart';

import 'package:sub1experttonton/presentation/ui/pages/about_page.dart';
import 'package:sub1experttonton/common/styles.dart';

import 'package:sub1experttonton/domain/entities/movie/movie.dart';

import 'package:sub1experttonton/presentation/ui/pages/movie/movie_detail_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/home_unitvy_page.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/now_playing_movie_bloc/now_playing_movie_bloc.dart';

import 'package:sub1experttonton/presentation/ui/pages/movie/search_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/popular_movies_page.dart';

import 'package:sub1experttonton/presentation/bloc/movie_bloc/popular_movie_bloc/popular_movie_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';

import 'package:flutter/material.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/watchlist_unitvy_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/watchlist_movies_page.dart';



class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture:
              CircleAvatar(
                backgroundImage:
                AssetImage(
                    'assets/circle-g.png'
                ),
              ),

              accountName: Text(
                  'Ditonton'
              ),

              accountEmail: Text(
                  'ditonton@dicoding.com'
              ),
            ),


            ListTile(
              leading: const Icon(
                  Icons.movie
              ),

              title: const Text(
                  'Movies'
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                  Icons.tv
              ),

              title: const Text(
                  'Television'
              ),

              onTap: () {
                Navigator.pushNamed(
                    context,
                    HomeUnitvyPage
                        .routeName
                );
              },
            ),


            ExpansionTile(
              title: const Text(
                  'Watchlist'
              ),

              leading: const Icon(
                  Icons.save_alt
              ),

              children: <Widget>[
                ListTile(
                  leading: const Icon(
                      Icons.movie
                  ),
                  title: const Text(
                      'Movies'
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        WatchlistMoviesPage
                            .routeName
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(
                      Icons.tv
                  ),
                  title: const Text(
                      'Television'
                  ),

                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        WatchlistUnitvyPage
                            .routeName
                    );
                  },
                ),
              ],
            ),

            ListTile(
              onTap: () {
                Navigator.pushNamed(
                    context,
                    AboutPage
                        .routeName
                );
              },

              leading: const Icon(
                  Icons
                      .info_outline
              ),

              title: const Text(
                  'About'
              ),
            ),
          ],
        ),
      ),


      appBar: AppBar(
        title: const Text(
            'Ditonton'
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  SearchPage
                      .routeName
              );
            },


            icon: const Icon(
                Icons
                    .search
            ),
          )
        ],
      ),


      body: Padding(
        padding: const
        EdgeInsets.all(
            8.0
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Text(
                'Now Playing Movies',

                style: kHeading6,
              ),

              BlocBuilder<NowPlayingMovieBloc,
                  NowPlayingMovieState>(
                builder: (context, state) {
                  if (state is NowPlayingMovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else if (
                  state is NowPlayingMovieLoaded)
                  {
                    return MovieList(state
                        .result);
                  }

                  else if (
                  state is NowPlayingMovieError)
                  {
                    return Text(state
                        .message);
                  }

                  else {
                    return const Text(
                        'Failed');
                  }
                },
              ),

              _buildSubHeading(
                title: 'Popular Movies',
                onTap: () =>
                    Navigator.pushNamed(context,
                        PopularMoviesPage
                            .routeName
                    ),
              ),


              BlocBuilder<PopularMovieBloc,
                  PopularMovieState>(
                builder: (context, state) {
                  if (state is PopularMovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else if (
                  state is PopularMovieLoaded)
                  {
                    return MovieList(state
                        .result);
                  }

                  else if (
                  state is PopularMovieError)
                  {
                    return Text(state
                        .message);
                  }

                  else {
                    return const Text(
                        'Failed');
                  }
                },
              ),

              _buildSubHeading(
                title: 'Top Rated Movies',
                onTap: () =>
                    Navigator.pushNamed(context,
                        TopRatedMoviesPage.routeName
                    ),
              ),


              BlocBuilder<TopRatedMovieBloc,
                  TopRatedMovieState>(
                builder: (context, state) {
                  if (state is TopRatedMovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else if (
                  state is TopRatedMovieLoaded)
                  {
                    return MovieList(state
                        .result);
                  }

                  else if (state is TopRatedMovieError)
                  {
                    return Text(state.message);
                  }

                  else {
                    return const Text(
                        'Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<NowPlayingMovieBloc>()
          .add(NowPlayingMovieGetEvent()
      );

      context.read<PopularMovieBloc>()
          .add(PopularMovieGetEvent()
      );

      context.read<TopRatedMovieBloc>()
          .add(TopRatedMovieGetEvent()
      );
      }
    );
  }


  Row _buildSubHeading(
      {
        required String title,
        required Function()
        onTap
      }
      )
  {

    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),

        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(
                8.0
            ),

            child: Row(
              children: const [Text(
                  'See More'
              ), Icon(Icons
                  .arrow_forward_ios)
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({Key? key}) : super(key: key);

  @override
  _HomeMoviePageState createState() =>
      _HomeMoviePageState();
  static const routeName =
      '/home';
}


class MovieList extends StatelessWidget {
  final List<Movie> movies;

    const MovieList(
      this
          .movies, {Key? key}
      ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (
            context,
            index
            ) {
          final movie = movies[
            index
          ];

          return Container(
            padding: const
            EdgeInsets.all(
                8
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage
                      .routeName,
                  arguments: movie.id,
                );
              },

              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(16)
                ),

                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie
                      .posterPath
                  }',

                  placeholder: (context, url) =>
                  const Center(
                    child: CircularProgressIndicator(),
                  ),

                  errorWidget: (context,
                      url,
                      error)
                  => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },

        itemCount: movies.length,
      ),
    );
  }
}
