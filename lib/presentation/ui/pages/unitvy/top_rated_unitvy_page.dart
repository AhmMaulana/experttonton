
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/top_rated_unitvy_bloc/top_rated_unitvy_bloc.dart';

import 'package:flutter/material.dart';
import 'package:sub1experttonton/presentation/widget/unitvy_card_list.dart';


class TopRatedUnitvyPage extends StatefulWidget {
  static const routeName =
      '/top-rated-tv';

  const TopRatedUnitvyPage({Key? key})
      : super(key: key);

  @override
  _TopRatedTvPageState createState()
  => _TopRatedTvPageState();
}

class _TopRatedTvPageState extends
    State<TopRatedUnitvyPage> {


  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<TopRatedUnitvyBloc>()
          .add(TopRatedUnitvyGetEvent()
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Top Rated Tv'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all
          (8.0),

        child: BlocBuilder<TopRatedUnitvyBloc,
            TopRatedUnitvyState>(
          builder: (context, state) {

            if (state is TopRatedUnitvyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            else if (state is TopRatedUnitvyLoaded)
            {
              return ListView.builder(
                itemBuilder: (context,
                    index) {
                  final tvs = state
                      .result[index];
                  return UnitvyCard(
                      tvs);
                },
                itemCount: state
                    .result.length,
              );
            }

            else {
              return const Center(
                key: Key(
                    'error_message'
                ),

                child: Text(
                    "Error"),
              );
            }
          },
        ),
      ),
    );
  }
}
