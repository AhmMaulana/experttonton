
import 'package:sub1experttonton/presentation/ui/pages/unitvy/popular_unitvy_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/about_page.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/top_rated_unitvy_bloc/top_rated_unitvy_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';

import 'package:sub1experttonton/presentation/ui/pages/unitvy/search_page_unitvy.dart';
import 'package:sub1experttonton/presentation/ui/pages/movie/home_movie_page.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/popular_unitvy_bloc/popular_unitvy_bloc.dart';


import 'package:sub1experttonton/presentation/ui/pages/movie/watchlist_movies_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/unitvy_detail_page.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/on_air_unitvy_bloc/on_air_unitvy_bloc.dart';
import 'package:sub1experttonton/common/styles.dart';

import 'package:sub1experttonton/presentation/ui/pages/unitvy/top_rated_unitvy_page.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/watchlist_unitvy_page.dart';

import 'package:flutter/material.dart';


class HomeUnitvyPage extends StatefulWidget {
  const HomeUnitvyPage({Key? key}) :
        super(key: key);

  @override
  _HomeUnitvyPageState createState() =>
      _HomeUnitvyPageState();

  static const routeName =
      '/tv';
}


class _HomeUnitvyPageState extends State<HomeUnitvyPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<OnAirUnitvyBloc>()
          .add(OnAirUnitvyGetEvent()
      );

      context.read<PopularUnitvyBloc>()
          .add(PopularUnitvyGetEvent()
      );

      context.read<TopRatedUnitvyBloc>()
          .add(TopRatedUnitvyGetEvent()
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(

          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
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
              leading: const Icon
                (Icons.movie),
              title: const Text(
                  'Movies'
              ),
              onTap: () {
                Navigator.pushNamed(context,
                    HomeMoviePage
                        .routeName
                );
              },
            ),

            ListTile(
              leading: const Icon
                (Icons.tv),
              title: const Text(
                  'Television'
              ),
              onTap: () {
                Navigator
                    .pop(context);
              },
            ),

            ExpansionTile(
              title: const Text(
                  'Watchlist'
              ),

              leading: const Icon(
                  Icons
                      .save_alt
              ),
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                      Icons.movie
                  ),
                  title: const Text(
                      'Movie'
                  ),

                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        WatchlistMoviesPage
                            .routeName);
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
                  Icons.info_outline
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
                  SearchUnitvyPage
                      .routeName
              );
            },
            icon: const Icon(
                Icons.search
            ),
          )
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(
            8.0
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing TV',
                style: kHeading6,
              ),

              BlocBuilder<OnAirUnitvyBloc,
                  OnAirUnitvyState>(
                builder: (context, state) {

                  if (state is OnAirUnitvyLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  }
                  else if (state is OnAirUnitvyLoaded) {
                    return TvList(state.result);
                  }

                  else if (state is OnAirUnitvyError) {
                    return Text(state.message);
                  }

                  else {
                    return const Text(
                        'Failed'
                    );
                  }
                },
              ),

              _buildSubHeading(
                title: 'Popular TV',
                onTap: () => Navigator.pushNamed(
                    context, PopularUnitvyPage.routeName
                ),
              ),

              BlocBuilder<PopularUnitvyBloc,
                  PopularUnitvyState>(
                builder: (context, state) {

                  if (state is PopularUnitvyLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else if (state is PopularUnitvyLoaded) {
                    return TvList(state
                        .result);
                  }

                  else if (state is PopularUnitvyError) {
                    return Text(state
                        .message);
                  }

                  else {
                    return const Text('Failed');
                  }
                },
              ),

              _buildSubHeading(
                title: 'Top Rated TV',
                onTap: () => Navigator.pushNamed(
                    context, TopRatedUnitvyPage.routeName
                ),
              ),

              BlocBuilder<TopRatedUnitvyBloc,
                  TopRatedUnitvyState>(
                builder: (context, state) {
                  if (state is TopRatedUnitvyLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else if (state is TopRatedUnitvyLoaded) {
                    return TvList(state
                        .result);
                  }

                  else if (state is TopRatedUnitvyError) {
                    return Text(state
                        .message);
                  }

                  else {
                    return const Text(
                        'Failed'
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
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
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class TvList extends StatelessWidget {
  final List<Unitvy> tv;

   const TvList(this.tv, {Key? key}) :
         super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvs = tv[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  UnitvyDetailPage.routeName,
                  arguments: tvs.id,
                );
              },

              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(16)
                ),

                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${
                      tvs.posterPath
                  }',
                  placeholder: (context, url) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),

                  errorWidget: (
                      context,
                      url,
                      error
                      )
                  => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tv.length,
      ),
    );
  }
}
