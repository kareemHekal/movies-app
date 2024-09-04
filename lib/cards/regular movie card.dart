import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/firebase/firebase_functions.dart';

import '../colors.dart';
import '../models/watch_list_movie.dart';
import '../movie details.dart';

class MovieCard extends StatefulWidget {
  final dynamic movieResult;


  MovieCard({
    required this.movieResult,

    super.key,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MovieDetails_page(movieResult: widget.movieResult)),
          );
        },
        child: Card(
          color: Colors.transparent,
          elevation: 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 150,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${widget.movieResult
                              .posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                              onTap: () {
                                addMovieToWatchList();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: (widget.movieResult.isSelected == true)
                                    ? Image.asset(
                                    "assets/images/bookmark (1).png")
                                    : Image.asset("assets/images/bookmark.png"),
                              )
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 100,
                  color: app_colors.grey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.star, color: app_colors.yellow),
                            Text(
                              "${widget.movieResult.voteAverage}",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          "${widget.movieResult.title}",
                          style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          " ${widget.movieResult.releaseDate}",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addMovieToWatchList() async {
    if (widget.movieResult.isSelected==true) {
      // Movie is already selected, show dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: app_colors.grey,
            title: Text('Movie Already Added',
                style: TextStyle(color: app_colors.yellow, fontSize: 20)),
            content: Text('This movie is already added to your watch list.',
                style: TextStyle(color: app_colors.yellow, fontSize: 20)),
            actions: [
              TextButton(
                child: Text('OK',
                    style: TextStyle(color: app_colors.yellow, fontSize: 15)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Exit the function here
    }

    // Check if the movie already exists in the Firebase collection
    final movieRef = FirebaseFirestore.instance.collection('watchlist');
    final movieQuery = movieRef.where('id', isEqualTo: widget.movieResult.id);
    final movieSnapshot = await movieQuery.get();

    if (movieSnapshot.docs.isNotEmpty) {
      // Movie already exists, show dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: app_colors.grey,
            title: Text('Movie Already Added___',
                style: TextStyle(color: app_colors.yellow, fontSize: 20)),
            content: Text('This movie is already added to your watch list.',
                style: TextStyle(color: app_colors.yellow, fontSize: 20)),
            actions: [
              TextButton(
                child: Text('OK',
                    style: TextStyle(color: app_colors.yellow, fontSize: 15)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Exit the function here
    }

    // Movie does not exist, add it to the collection
    setState(() {
      widget.movieResult.isSelected = true;
    });
    WatchListMovieModel movie = WatchListMovieModel(
      Date: widget.movieResult.releaseDate,
      overview: widget.movieResult.overview,
      movie_id: widget.movieResult.id ,
      genres: widget.movieResult.genres,
      backdropPath: widget.movieResult.backdropPath,
      title: widget.movieResult.title,
      isSelected: widget.movieResult.isSelected,
      posterPath: widget.movieResult.posterPath,
    );
    Firebase_Functions.addTask(movie);
  }

}