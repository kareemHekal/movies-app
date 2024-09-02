import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';

import 'MovieDetailsCard.dart';
import 'api_maneger.dart';
import 'models/moiveDetailsModel.dart';

class MovieDetails_page extends StatelessWidget {
  int id ;
  MovieDetails_page({required this.id ,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: app_colors.grey,
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios_rounded),),
        title: Text(
          "movie details",
          style: TextStyle(fontSize: 20, color: app_colors.yellow),
        ),
      ),
      body: FutureBuilder(
        future: ApiManeger.getmovieDartModel(id),
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
    );
  }
}
