import 'package:flutter/material.dart';
import 'package:movieinfo/models/movie.dart';
import 'package:movieinfo/screens/details/components/body.dart';

class detailScreen extends StatelessWidget {
  const detailScreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(movie: movie,),
    );
  }
}
