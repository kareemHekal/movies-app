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
            Image.network(
              'https://image.tmdb.org/t/p/w500${movieDetails.backdropPath}',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 217,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text("${movieDetails.title}",style: TextStyle(
                          fontSize: 18
                      )),
                    ),
                    Text("${movieDetails.releaseDate}",style: TextStyle(
                      fontSize: 10
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                            width: 120,
                            height: 199,
                          ),
                          SizedBox(width: 12), // add some space between the image and the chips
                          Expanded(
                            child: Container(
                              height: 199,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: GenresChoiceChips(genres: movieDetails.genres??[]),
                                  ),
                                  SizedBox(height: 10,),
                                  Expanded(
                                    child: ListView(
                                        children: [Text(movieDetails.overview??''),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.star, color: app_colors.yellow),
                                            SizedBox(width: 5,),
                                            Text(
                                              "${movieDetails.voteAverage}",
                                              style: TextStyle(fontSize: 16, color: Colors.white),
                                            ),
                                          ],
                                        )],),
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
        ));
  }
}
