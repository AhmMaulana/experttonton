
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub1experttonton/common/utils.dart';

import 'package:flutter/material.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/watchlist_movie_bloc/watchlist_movie_bloc.dart';

import 'package:sub1experttonton/presentation/widget/movie_card_list.dart';


class WatchlistMoviesPage extends StatefulWidget {
  static const routeName =
      '/watchlist-movie';

  const WatchlistMoviesPage({Key? key}) :
        super(key: key);

  @override
  _WatchlistMoviesPageState createState() =>
      _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchlistMovieBloc>()
          .add(GetListEvent()
      );
      }
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(
        this,
        ModalRoute.of(context)!
    );
  }


  @override
  void didPopNext() {
    context
        .read<WatchlistMovieBloc>()
        .add(GetListEvent()
    );
  }


  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Watchlist'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all
          (8.0),

        child: BlocBuilder<WatchlistMovieBloc,
            WatchlistMovieState>(

          builder: (context, state) {
            if (state is WatchlistMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );

            }
            else if (state is WatchlistMovieLoaded)
            {
              return ListView.builder(
                itemBuilder: (context,
                    index)
                {
                  final movie = state.result
                      [index];
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
