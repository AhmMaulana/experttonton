
import 'package:sub1experttonton/common/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/recommendation_unitvy_bloc/recommendation_unitvy_bloc.dart';
import 'package:sub1experttonton/domain/entities/genre.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/watchlist_unitvy_bloc/watchlist_unitvy_bloc.dart';

import 'package:sub1experttonton/presentation/bloc/unitvy_bloc/detail_unitvy_bloc/detail_unitvy_bloc.dart';
import 'package:sub1experttonton/domain/entities/unitvy/unitvy_detail.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';


class UnitvyDetailPage extends StatefulWidget {
  static const routeName =
      '/detail-tv';

  final int id;
    const UnitvyDetailPage(
      {Key? key, required this.id}
      ) : super(key: key);


  @override
  _TvDetailPageState createState() =>
      _TvDetailPageState();
}

class _TvDetailPageState extends State<UnitvyDetailPage> {


  @override
  void initState() {
    super.initState();
    Future.microtask(() {

      context
          .read<DetailUnitvyBloc>()

          .add(GetDetailUnitvyEvent(
          widget.id)
      );

      context
          .read<RecommendationUnitvyBloc>()

          .add(GetRecommendationUnitvyEvent(
          widget.id)
      );

      context
          .read<WatchlistUnitvyBloc>()
          .add(GetStatusUnitvyEvent(
          widget.id)
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    RecommendationUnitvyState tvRecommendations =
        context.watch<RecommendationUnitvyBloc>()
            .state;
    return Scaffold(
      body: BlocListener<WatchlistUnitvyBloc,
          WatchlistUnitvyState>(
        listener: (_, state) {
          if (state is WatchlistUnitvySuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
              content: Text(state
                  .message),
            )
            );

            context
                .read<WatchlistUnitvyBloc>()
                .add(GetStatusUnitvyEvent(
                widget.id)
            );
          }
        },


        child: BlocBuilder<DetailUnitvyBloc,
            DetailUnitvyState>(
          builder: (context, state) {
            if (state is DetailUnitvyLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            else if (state is DetailUnitvyLoaded) {
              final tv = state.unitvyDetail;
              bool isAddedToWatchlistTv = (
                  context.watch<WatchlistUnitvyBloc>()
                      .state

              is WatchlistUnitvyStatusLoaded) ? (
                  context.read<WatchlistUnitvyBloc>()
                      .state

              as WatchlistUnitvyStatusLoaded)
                  .result : false;

              return SafeArea(
                child: DetailContent(
                  tv,
                  tvRecommendations is RecommendationUnitvyLoaded ?
                  tvRecommendations
                      .unitvy : List.empty(),

                  isAddedToWatchlistTv,
                ),
              );
            }

            else {
              return const Text(
                  "Empty"
              );
            }
          },
        ),
      ),
    );
  }
}


class DetailContent extends StatelessWidget {
  final UnitvyDetail tv;

  final List<Unitvy> recommendations;

  final bool isAddedWatchlistTv;

   const DetailContent(
      this.tv,

      this.recommendations,

      this.isAddedWatchlistTv,
       {Key? key}
      ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context)
        .size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
          'https://image.tmdb.org/t/p/w500'
              '${tv.posterPath}',

          width: screenWidth,
          placeholder: (
              context,
              url) => const Center(

            child: CircularProgressIndicator(),
          ),

          errorWidget: (
              context,
              url,
              error)
          => const Icon(Icons.error),
        ),

        Container(
          margin: const EdgeInsets.only(
              top: 48 + 8
          ),

          child: DraggableScrollableSheet(
            builder: (
                context,
                scrollController
                )
            {

              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16)
                  ),
                ),

                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),

                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 16
                      ),

                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              tv.name,
                              style: kHeading5,
                            ),

                            ElevatedButton(
                              onPressed: ()
                              async {

                                if (!isAddedWatchlistTv) {
                                  BlocProvider.of<WatchlistUnitvyBloc>
                                    (context)

                                      .add(AddItemUnitvyEvent(
                                      tv)
                                  );
                                }

                                else {
                                  BlocProvider.of<WatchlistUnitvyBloc>
                                    (context)
                                    .add(RemoveItemUnitvyEvent(
                                      tv)
                                  );
                                }
                              },

                              child: Row(
                                mainAxisSize:
                                    MainAxisSize.min,

                                children: [
                                  isAddedWatchlistTv ?
                                  const Icon(Icons.check) :
                                  const Icon(Icons.add),
                                  const Text(
                                      'Watchlist'
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              _showGenres(tv.genres),
                            ),

                            Text((
                                  tv.firstAirDate),
                            ),


                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tv.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      const Icon(
                                        Icons.star,
                                    color: kMikadoYellow,
                                  ),

                                  itemSize: 24,
                                ),

                                Text(
                                    '${tv.voteAverage}'
                                )
                              ],
                            ),

                            const SizedBox(
                                height: 16
                            ),

                            Text(
                              'Overview',
                              style: kHeading6,
                            ),

                            Text(
                              tv.overview,
                            ),

                            const SizedBox(
                                height: 16
                            ),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),

                            BlocBuilder<RecommendationUnitvyBloc,
                                RecommendationUnitvyState>(
                              builder: (context, state) {
                                if (state is RecommendationUnitvyLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );

                                }

                                else if (state is RecommendationUnitvyError) {
                                  return Text(state.message);
                                }

                                else if (state is RecommendationUnitvyLoaded) {
                                  final recommendations =
                                      state.unitvy;
                                  if (recommendations
                                      .isEmpty)
                                  {
                                    return const Text(
                                        "No tv recommendations"
                                    );
                                  }

                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,
                                          index) {
                                        final tv =
                                        recommendations[index];

                                        return Padding(
                                          padding: const EdgeInsets.all(
                                              4.0
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                UnitvyDetailPage.routeName,
                                                arguments: tv.id,
                                              );
                                            },

                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(8),
                                              ),

                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://image.tmdb.org/t/p/w500${tv
                                                    .posterPath}',

                                                placeholder: (context, url) =>
                                                    const Center(
                                                      child:
                                                      CircularProgressIndicator(),
                                                    ),

                                                errorWidget:
                                                    (context, url, error) =>
                                                    const Icon(
                                                        Icons.error
                                                    ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },

                                      itemCount: recommendations.length,
                                    ),
                                  );
                                }

                                else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },

            minChildSize: 0.25,

          ),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                  Icons.arrow_back
              ),

              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }


  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0,
        result.length - 2);
  }
}
