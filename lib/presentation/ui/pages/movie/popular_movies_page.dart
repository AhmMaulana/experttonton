
import 'package:sub1experttonton/presentation/bloc/movie_bloc/popular_movie_bloc/popular_movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:sub1experttonton/presentation/widget/movie_card_list.dart';
import 'package:provider/provider.dart';


class PopularMoviesPage extends StatefulWidget {
  static const routeName =
      '/popular-movie';

  const PopularMoviesPage({Key? key}) :
        super(key: key);

  @override
  _PopularMoviesPageState createState() =>
      _PopularMoviesPageState();
}

class _PopularMoviesPageState extends
State<PopularMoviesPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<PopularMovieBloc>()
          .add(PopularMovieGetEvent()
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Popular Movies'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all
          (8.0),

        child: BlocBuilder<PopularMovieBloc,
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return MovieCard(movie);
                },
                itemCount: state.result.length,
              );

            }
            else {
              return const Center(
                key: Key('error_message'),
                child: Text("Error"),
              );
            }
          },
        ),
      ),
    );
  }
}
