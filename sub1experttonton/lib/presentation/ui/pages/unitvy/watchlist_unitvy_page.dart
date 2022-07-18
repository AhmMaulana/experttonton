
import 'package:sub1experttonton/presentation/widget/unitvy_card_list.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/watchlist_unitvy_bloc/watchlist_unitvy_bloc.dart';
import 'package:sub1experttonton/common/utils.dart';


class WatchlistUnitvyPage extends StatefulWidget {
  static const routeName =
      '/watchlist-tv';

  const WatchlistUnitvyPage({Key? key}) :
        super(key: key);

  @override
  _WatchlistTvPageState createState() =>
      _WatchlistTvPageState();
}

class _WatchlistTvPageState extends
     State<WatchlistUnitvyPage> with RouteAware {

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchlistUnitvyBloc>()
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
        .read<WatchlistUnitvyBloc>()
        .add(GetListEvent()
    );
  }


  @override
  void dispose() {
    routeObserver
        .unsubscribe(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''
            'Watchlist Tv'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(
            8.0
        ),

        child: BlocBuilder<WatchlistUnitvyBloc,
            WatchlistUnitvyState>(
          builder: (context, state) {

            if (state is WatchlistUnitvyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            else if (state is WatchlistUnitvyLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = state
                      .result[index];
                  return UnitvyCard(tv);
                },

                itemCount: state.result.length,
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
