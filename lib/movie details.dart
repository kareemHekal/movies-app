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
              future: ApiManeger.getmovieDartModel(movieResult.id),
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
                        future: ApiManeger.getSimilarMovies(movieResult.id),
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
                          similar_Movies similarMovies = snapshot.data; // Get the instance of similar_Movies
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: similarMovies.results?.length, // Access the results property on the instance
                              itemBuilder: (context, index) {
                                // Access the element at index
                                Results movie = similarMovies.results![index]; // Use the instance property
                                return MovieCard(movieResult: movie); // assume you have a MovieCard widget
                              },
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
