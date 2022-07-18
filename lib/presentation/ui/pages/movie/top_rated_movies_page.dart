
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/top_rated_movie_bloc/top_rated_movie_bloc.dart';

import 'package:sub1experttonton/presentation/widget/movie_card_list.dart';
import 'package:flutter/material.dart';


class TopRatedMoviesPage extends StatefulWidget {
  static const routeName =
      '/top-rated-movie';

  const TopRatedMoviesPage({Key? key}) :
        super(key: key);

  @override
  _TopRatedMoviesPageState createState()
  => _TopRatedMoviesPageState();
}


class _TopRatedMoviesPageState extends
    State<TopRatedMoviesPage> {


  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<TopRatedMovieBloc>()
          .add(TopRatedMovieGetEvent()
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Top Rated Movies'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all
          (8.0),

        child: BlocBuilder<TopRatedMovieBloc,
            TopRatedMovieState>(
          builder: (context, state) {
            if (state is TopRatedMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );

            }
            else if (state is TopRatedMovieLoaded)
            {

              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state
                      .result[index];
                  return MovieCard(movie);
                },
                itemCount: state.result
                    .length,
              );

            }
            else {
              return const Center(
                key: Key(
                    'error_message'
                ),

                child: Text(
                    "Error"
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
