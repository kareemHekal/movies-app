import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movie_app/firebase/firebase_functions.dart';
import '../colors.dart';
import '../models/moiveDetailsModel.dart';
import '../models/newrelases.dart';
import '../models/watch_list_movie.dart';
import '../movie details.dart';

class WatchlistMovieCard extends StatelessWidget {
  WatchListMovieModel moviemodel;

  WatchlistMovieCard({super.key, required this.moviemodel});

  @override
  Widget build(BuildContext context) {
    movieDartModel moviemodel_ = movieDartModel(
        posterPath: moviemodel.posterPath,
        title: moviemodel.title,
        overview: moviemodel.overview,
        genres: moviemodel.genres,
        backdropPath: moviemodel.backdropPath,
        releaseDate: moviemodel.Date,
        id: moviemodel.movie_id);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 10),
      child: GestureDetector(
        onTap: () {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetails_page(movieResult: moviemodel_)),
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
          child: Slidable(
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              extentRatio: .6,
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  onPressed: (context) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: app_colors.grey,
                          title: Text(
                            'Warning',
                            style: TextStyle(color: app_colors.yellow),
                          ),
                          content: Text(
                            'This will delete the movie from the watchlist ',
                            style: TextStyle(color: app_colors.yellow),
                          ),
                          actions: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: app_colors.grey,
                                // Set button background color to grey
                                elevation: 5,
                                // Add some shadow to the button
                                shadowColor: Colors.grey[
                                    300], // Set shadow color to a lighter grey
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: app_colors.yellow),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // close the dialog
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: app_colors.grey,
                                // Set button background color to grey
                                elevation: 5,
                                // Add some shadow to the button
                                shadowColor: Colors.grey[
                                    300], // Set shadow color to a lighter grey
                              ),
                              child: Text('OK',
                                  style: TextStyle(color: app_colors.yellow)),
                              onPressed: () {
                                Firebase_Functions.deleteMovie(moviemodel.id);
                                print('OK button pressed, deleting data...');

                                Navigator.of(context).pop(); // close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 70,
                    decoration: BoxDecoration(
                        color: app_colors.yellow,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    // Clip the image to a circular shape
                    child: Image.network(
                      width: 140,
                      height: 150,
                      'https://image.tmdb.org/t/p/w500${moviemodel.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            moviemodel.title ?? '',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Text(
                        moviemodel.Date!,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
