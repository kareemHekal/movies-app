import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';

import 'cards/MovieDetailsCard.dart';
import 'api_maneger.dart';
import 'cards/regular movie card.dart';
import 'models/moiveDetailsModel.dart';
import 'models/similarMovies.dart';


class MovieDetails_page extends StatelessWidget {
  final dynamic movieResult;
  MovieDetails_page({required this.movieResult ,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: app_colors.black,
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/HomeScreen');}, icon: Icon(Icons.arrow_back_ios_rounded,color: app_colors.yellow,),),
        title: Text(
          "${movieResult.title}",
          style: TextStyle(fontSize: 20, color: app_colors.yellow),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: ApiManeger.getmovieDartModel(movieResult?.id), // Add null check for movieResult.id
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xffFFBB3B),
                        ),
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot);
                  return const Text("Something went wrong. Try again.");
                }
                if (!snapshot.hasData) {
                  return const Text("No data available.");
                }
                movieDartModel movieDetails = snapshot.data;
                return MovieDetailsCard(movieDetails: movieDetails);
              },
            ),
            Container(
              width: double.infinity,
              height: 350, // Adjust the height as needed
              color: app_colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "More Like This",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                        future: ApiManeger.getSimilarMovies(movieResult?.id), // Add null check for movieResult.id
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: Color(0xffFFBB3B),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (snapshot.hasError) {
                            print(snapshot);
                            return const Text("Something went wrong. Try again.");
                          }
                          if (!snapshot.hasData) {
                            return const Text("No data available.");
                          }
                          similar_Movies similarMovies = snapshot.data;
                          if (similarMovies?.results != null) { // Add null check for similarMovies.results
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: similarMovies.results?.length,
                                itemBuilder: (context, index) {
                                  if (similarMovies.results != null) { // Add null check for similarMovies.results
                                    Results movie = similarMovies.results![index];
                                    return MovieCard(movieResult: movie);
                                  } else {
                                    return Container(); // Return an empty container if similarMovies.results is null
                                  }
                                },
                              ),
                            );
                          } else {
                            return Container(); // Return an empty container if similarMovies.results is null
                          }
                        },
                      ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
