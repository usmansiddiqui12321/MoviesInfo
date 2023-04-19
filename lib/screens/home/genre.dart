import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/genre_card.dart';

class genres extends StatelessWidget {
  const genres({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Action",
      "Crime",
      "Comedy",
      "Drama",
      "Horror",
      "Animations",
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => genrecard(genre: genres[index]),
      ),
    );
  }
}
