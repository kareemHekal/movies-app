import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';

import 'api_maneger.dart';
import 'cards/searchedmoviescard.dart';
import 'models/SearchMoviesModel.dart';

class SearchTab extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: app_colors.black, // Set the background color of the search bar
        foregroundColor: Colors.yellow, // Set the color of the icons and text
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.yellow),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow), // Set the color of the underline
        ),
      ),

      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.yellow), // Set the color of the search text
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(Icons.clear, color: Colors.yellow), // Set the color of the clear icon
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: Icon(Icons.search, color: Colors.yellow), // Set the color of the search icon
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, color: Colors.yellow), // Set the color of the back icon
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchData();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        color: app_colors.black, // Set the background color of the suggestions area
        child: Center(
          child: Image.asset("assets/images/Group 22.png")
        ),
      );
    }
    return buildSearchData();
  }

  Widget buildSearchData() {
    return Container(
      color: app_colors.black, // Set the background color of the search results area
      child: FutureBuilder(
        future: ApiManeger.getSerachedMoives(query),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFFBB3B),
              ),
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("Something went wrong. Try again.");
          }
          if (!snapshot.hasData || snapshot.data.results.isEmpty) {
            return const Text("No data available.");
          }

          List<Results_> popularMovies = snapshot.data.results;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity, // allow the ListView to take up the full width
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: popularMovies.length,
                itemBuilder: (context, index) {
                  return SearchedMoviesCard(moviemodel: popularMovies[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}