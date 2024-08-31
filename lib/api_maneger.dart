import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/PopularMoives.dart';
import 'package:movie_app/models/newrelases.dart';

import 'models/topRatedMovies.dart';

class ApiManeger {
 static Future<popularMovies> getPopularMovies() async{
    Uri url = Uri.https("api.themoviedb.org", "3/movie/popular", {
      "api_key": "2b35d85ca7c37f8cf34c134a92690a97",
    });
    http.Response response =await http.get(url);
    var json = jsonDecode(response.body);
    popularMovies popularmovies = popularMovies.fromJson(json);
    return popularmovies;
  }

 static Future<topRatedMovies> getTopRatedMovies() async {
   Uri url = Uri.https("api.themoviedb.org", "3/movie/top_rated", {
     "api_key": "2b35d85ca7c37f8cf34c134a92690a97",
   });
   http.Response response = await http.get(url);
   var json = jsonDecode(response.body);
   topRatedMovies topRatedmovies = topRatedMovies.fromJson(json);
   return topRatedmovies;
 }
 static Future<newReleasemovies> getNewReleasesMovies() async {
   try {
     Uri url = Uri.https("api.themoviedb.org", "3/movie/upcoming", {
       "api_key": "2b35d85ca7c37f8cf34c134a92690a97",
     });

     // Make the HTTP GET request
     http.Response response = await http.get(url);

     // Check if the request was successful
     if (response.statusCode == 200) {
       var json = jsonDecode(response.body);

       // Debug: Print the raw JSON response
       print('API Response: $json');

       // Convert the JSON response to the newReleasemovies model
       newReleasemovies newReleasesMovies = newReleasemovies.fromJson(json);

       return newReleasesMovies;
     } else {
       // Handle non-200 status codes
       print('Failed to load new releases. Status code: ${response.statusCode}');
       throw Exception('Failed to load new releases');
     }
   } catch (e) {
     // Handle any errors that occur during the HTTP request or JSON parsing
     print('Error: $e');
     throw Exception('Failed to load new releases');
   }
 }

}
