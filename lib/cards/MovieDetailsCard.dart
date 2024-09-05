import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import '../models/moiveDetailsModel.dart';
import 'GenresChoiceChips.dart';

class MovieDetailsCard extends StatelessWidget {
  movieDartModel movieDetails;

  MovieDetailsCard({required this.movieDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          movieDetails.backdropPath != null
              ? Image.network(
                  'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 217,
                )
              : Text("Backdrop Image Not Available",
                  style: TextStyle(fontSize: 16)),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text("${movieDetails.title}",
                        style: TextStyle(fontSize: 18)),
                  ),
                  movieDetails.releaseDate != null
                      ? Text("${movieDetails.releaseDate}",
                          style: TextStyle(fontSize: 10))
                      : Text("Release Date Not Available",
                          style: TextStyle(fontSize: 10)),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        movieDetails.posterPath != null
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                                width: 120,
                                height: 199,
                              )
                            : Text("Poster Image Not Available",
                                style: TextStyle(fontSize: 16)),
                        SizedBox(width: 12),
                        // add some space between the image and the chips
                        Expanded(
                          child: Container(
                            height: 199,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: GenresChoiceChips(
                                      genres: movieDetails.genres ?? []),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView(
                                    children: [
                                      movieDetails.overview != null
                                          ? Text(movieDetails.overview!)
                                          : Text("Overview Not Available"),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.star,
                                              color: app_colors.yellow),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          movieDetails.voteAverage != null
                                              ? Text(
                                                  "${movieDetails.voteAverage}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                )
                                              : Text("Rating Not Available",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
