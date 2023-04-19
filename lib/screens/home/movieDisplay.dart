import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/movie.dart';
import 'components/movie_card.dart';

import 'dart:math' as math;

class movieDisplay extends StatefulWidget {
  const movieDisplay({super.key});

  @override
  State<movieDisplay> createState() => _movieDisplayState();
}

class _movieDisplayState extends State<movieDisplay> {
  int initialpage = 1;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      //for the small portion at left and right
      viewportFraction: 0.8,
      //defining initial page
      initialPage: initialpage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                initialpage = value;
              });
            },
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) => buildMovieSlider(index)),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            double currentPage = _pageController.page ?? 0;
            value = (index - currentPage) * 0.038;
            value = value.clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialpage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(movie: movies[index]),
            ),
          );
        },
      );
}
