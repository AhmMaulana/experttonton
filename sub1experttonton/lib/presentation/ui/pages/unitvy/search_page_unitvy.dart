
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/search_unitvy_bloc/search_unitvy_bloc.dart';

import 'package:flutter/material.dart';

import 'package:sub1experttonton/presentation/widget/unitvy_card_list.dart';
import 'package:sub1experttonton/common/styles.dart';


class SearchUnitvyPage extends StatelessWidget {
  static const routeName =
      '/search-tv';

  const SearchUnitvyPage({Key? key}) :
        super(key: key);


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
                    .read<SearchUnitvyBloc>()
                    .add(SearchUnitvyQueryEvent(query)
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


            BlocBuilder<SearchUnitvyBloc,
                SearchUnitvyState>(
              builder: (context, state) {
                if (state is SearchUnitvyLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                else if (state is SearchUnitvyLoaded) {
                  final result = state.result;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(
                          8
                      ),

                      itemBuilder: (context,
                          index) {
                        final tv = state
                            .result[index];

                        return UnitvyCard(tv);
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
