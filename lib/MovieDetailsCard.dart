import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'models/moiveDetailsModel.dart';

class MovieDetailsCard extends StatelessWidget {
  movieDartModel movieDetails;

  MovieDetailsCard({required this.movieDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(movieDetails.title!),
    );
  }
}
