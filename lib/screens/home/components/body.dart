import 'package:flutter/material.dart';
import 'package:movieinfo/constants.dart';
import '../../../models/movie.dart';
import '../genre.dart';
import '../movieDisplay.dart';
import 'categories.dart';
import 'movie_card.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Categorylist(),
          genres(),
          SizedBox(
            height: kDefaultPadding,
          ),
          movieDisplay(),
        ],
      ),
    );
  }
}
