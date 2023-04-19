import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/movie.dart';
import '../../home/components/genre_card.dart';

class movieGenres extends StatelessWidget {
  const movieGenres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie.genra.length,
            itemBuilder: (context, index) =>
                genrecard(genre: movie.genra[index])),
      ),
    );
  }
}
