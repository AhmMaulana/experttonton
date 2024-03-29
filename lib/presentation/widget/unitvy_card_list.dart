
import 'package:sub1experttonton/domain/entities/unitvy/unitvy.dart';
import 'package:sub1experttonton/common/styles.dart';

import 'package:flutter/material.dart';
import 'package:sub1experttonton/presentation/ui/pages/unitvy/unitvy_detail_page.dart';

import 'package:cached_network_image/cached_network_image.dart';


class UnitvyCard extends StatelessWidget {
   const UnitvyCard(
      this.tv, {Key? key}) :
         super(key: key);

  final Unitvy tv;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 4
      ),

      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            UnitvyDetailPage.routeName,
            arguments: tv.id,
          );
        },

        child: Stack(
          alignment:
                Alignment.bottomLeft,

          children: [
            Card(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      tv.name ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kHeading6,
                    ),

                    const SizedBox(
                        height: 16
                    ),

                    Text(
                      tv.overview ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),

              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(8)
                ),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl'
                      '${tv.posterPath}',
                  width: 80,
                  placeholder: (
                      context, url)
                  => const Center(

                    child: CircularProgressIndicator(),
                  ),

                  errorWidget: (
                      context,
                      url,
                      error)
                  => const Icon(
                      Icons.error
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
