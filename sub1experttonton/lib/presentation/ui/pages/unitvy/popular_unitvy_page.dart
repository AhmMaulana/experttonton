
import 'package:sub1experttonton/presentation/widget/unitvy_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/popular_unitvy_bloc/popular_unitvy_bloc.dart';
import 'package:flutter/material.dart';

class PopularUnitvyPage extends StatefulWidget {
  static const routeName =
      '/popular-tv';

  const PopularUnitvyPage({Key? key})
      : super(key: key);

  @override
  _PopularTvPageState createState() =>
      _PopularTvPageState();
}


class _PopularTvPageState extends
State<PopularUnitvyPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<PopularUnitvyBloc>()
          .add(PopularUnitvyGetEvent());
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Popular Tv'
        ),
      ),


      body: Padding(
        padding: const EdgeInsets.all
          (8.0),
        child: BlocBuilder<PopularUnitvyBloc,
            PopularUnitvyState>(
          builder: (context, state) {
            if (state is PopularUnitvyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            else if (state is PopularUnitvyLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvs = state.result[index];
                  return UnitvyCard(tvs);
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
