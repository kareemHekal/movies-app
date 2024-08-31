import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import '../models/newrelases.dart';
import '../models/topRatedMovies.dart';

class RegularMovieCard extends StatefulWidget {
  final New_Results movieResult;
  RegularMovieCard({required this.movieResult, super.key});

  @override
  State<RegularMovieCard> createState() => _RegularMovieCardState();
}

class _RegularMovieCardState extends State<RegularMovieCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    String? posterImagePath = widget.movieResult.posterPath;

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.transparent,
        height: 186,
        child: SingleChildScrollView( // Add this
          child: Column(
            children: [
              Container(
                height: 127,
                width: 96,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${widget.movieResult.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: isSelected
                              ? Image.asset("assets/images/bookmark (1).png")
                              : Image.asset("assets/images/bookmark.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(

                width:97,
                height: 110,
                color: app_colors.grey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star, color: app_colors.yellow,),
                        Text(
                          "${widget.movieResult.voteAverage}",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.movieResult.title}",
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      " ${widget.movieResult.releaseDate?.substring(0, 10)}",
                      style: TextStyle(fontSize: 8, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TopRatedCard extends StatefulWidget {
  final TopRatedResult movieResult;
  TopRatedCard({required this.movieResult, super.key});

  @override
  State<TopRatedCard> createState() => _TopRatedCardState();
}

class _TopRatedCardState extends State<TopRatedCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.transparent,
        elevation: 5,
        child: SingleChildScrollView( // Add this
          child: Column(
            children: [
              Container(
                height: 200,
                width: 150,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${widget.movieResult.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: isSelected
                              ? Image.asset("assets/images/bookmark (1).png")
                              : Image.asset("assets/images/bookmark.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width:150,
                height: 100,
                color: app_colors.grey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star, color: app_colors.yellow,),
                        Text(
                          "${widget.movieResult.voteAverage}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.movieResult.title}",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      " ${widget.movieResult.releaseDate?.substring(0, 10)}",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}