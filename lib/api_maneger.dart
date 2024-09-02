import 'dart:convert';
import 'dart:io';

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

     http.Response response = await http.get(url);

     if (response.statusCode == 200) {
       var json = jsonDecode(response.body);

       print('API Response: $json');

       newReleasemovies newReleasesMovies = newReleasemovies.fromJson(json);

       return newReleasesMovies;
     } else {
       print('Failed to load new releases. Status code: ${response.statusCode}');
       throw Exception('Failed to load new releases. Status code: ${response.statusCode}');
     }
   } on SocketException {
     print('Error: No internet connection');
     throw Exception('No internet connection');
   } on FormatException {
     print('Error: Invalid JSON response');
     throw Exception('Invalid JSON response');
   } catch (e) {
     print('Error: $e');
     throw Exception('Failed to load new releases');
   }
 }

}
