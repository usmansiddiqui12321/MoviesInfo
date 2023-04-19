import 'package:flutter/material.dart';
import 'package:movieinfo/constants.dart';
import 'package:movieinfo/screens/details/components/titledurationandfabbtn.dart';

import '../../../components/backdropandrating.dart';
import '../../../models/movie.dart';
import 'moviegenres.dart';

class body extends StatelessWidget {
  final Movie movie;
  const body({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backDropandRating(size: size, movie: movie),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationandFabBtn(movie: movie),
          movieGenres(movie: movie),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
            child: Text("Plot Summary",
                style: Theme.of(context).textTheme.headline5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              movie.plot,
              style: TextStyle(color: Color(0xFF737599)),
            ),
          ),
          castandCrew(casts: movie.cast)
        ],
      ),
    );
  }
}

class castandCrew extends StatelessWidget {
  const castandCrew({super.key, required this.casts});
  final List casts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            "Cast And Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: casts.length,
                itemBuilder: (context, index) => castCard(
                      cast: casts[index],
                    )),
          )
        ],
      ),
    );
  }
}

class castCard extends StatelessWidget {
  final Map cast;

  const castCard({super.key, required this.cast});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            cast['movieName'],
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: kTextLightColor),
          ),
        ],
      ),
    );
  }
}
