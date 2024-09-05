import 'package:flutter/material.dart';
import '../colors.dart';
import '../models/SearchMoviesModel.dart';
import '../models/moiveDetailsModel.dart';
import '../movie details.dart';

class SearchedMoviesCard extends StatelessWidget {
  final Results_ moviemodel;

  SearchedMoviesCard({super.key, required this.moviemodel});

  @override
  Widget build(BuildContext context) {
    movieDartModel moviemodel_ = movieDartModel(
      posterPath: moviemodel.posterPath,
      title: moviemodel.title,
      overview: moviemodel.overview,
      genres: moviemodel.genres,
      backdropPath: moviemodel.backdropPath,
      releaseDate: moviemodel.releaseDate,
      id: moviemodel.id,
    );

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetails_page(movieResult: moviemodel_),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: app_colors.grey,
            borderRadius: BorderRadiusDirectional.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // color of the shadow
                spreadRadius: 1, // spread radius of the shadow
                blurRadius: 7, // blur radius of the shadow
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          height: 170,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 70,
                  decoration: BoxDecoration(
                    color: app_colors.yellow,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  // Clip the image to a circular shape
                  child: Image.network(
                    width: 140,
                    height: 150,
                    'https://image.tmdb.org/t/p/w500${moviemodel.posterPath ?? ''}',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); // Display an error icon if image loading fails
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        moviemodel.title ?? 'No Title Available',
                        textAlign: TextAlign.start,
                        style: TextStyle(color:app_colors.white,fontSize: 20),
                        overflow: TextOverflow.ellipsis, // Handle overflow gracefully
                      ),
                      Text(
                        moviemodel.releaseDate ?? 'No Release Date',
                        textAlign: TextAlign.start,

                        style: TextStyle(color:app_colors.white,fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
