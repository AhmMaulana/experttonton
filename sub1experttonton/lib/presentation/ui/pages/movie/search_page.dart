
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub1experttonton/common/styles.dart';

import 'package:sub1experttonton/presentation/widget/movie_card_list.dart';
import 'package:sub1experttonton/presentation/bloc/movie_bloc/search_movie_bloc/search_movie_bloc.dart';


class SearchPage extends StatelessWidget {
  static const routeName =
      '/search';

  const SearchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Search'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all
          (16.0),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                context
                .read<SearchMovieBloc>()
                    .add(SearchMovieQueryEvent(query)
                );
              },

              decoration: const InputDecoration(
                hintText:
                      'Search title',
                prefixIcon: Icon(
                    Icons.search
                ),

                border: OutlineInputBorder(),
              ),

              textInputAction:
              TextInputAction.search,
            ),

            const SizedBox(
                height: 16
            ),

            Text(
              'Search Result',
              style: kHeading6,
            ),

            BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                }
                else if (state is SearchMovieLoaded)
                {
                  final result = state.result;

                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets
                          .all(8),

                      itemBuilder: (context, index) {
                        final movie = state
                            .result[index];

                        return MovieCard(movie);
                      },
                      itemCount: result.length,
                    ),
                  );

                }
                else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
