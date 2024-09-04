
import 'moiveDetailsModel.dart';

class WatchListMovieModel {
  String? id;
  String? posterPath;
  String? title;
  String? Date;
  bool? isSelected;
  int?movie_id;
  List<Genres>? genres;
  String? backdropPath;
  String? overview;


  WatchListMovieModel(
      {required this.isSelected,
        this.id ,
        required this.posterPath,
        required this.backdropPath,
        required this.genres,
        required this.movie_id,
        required this.overview,
        required this.title,
        required this.Date,
        });

  Map<String, dynamic> toJson() { // Fix the typo here
    return {
      "moivename": title,
      "poster": posterPath,
      "isSelected": isSelected,
      "date": Date,
      "id": id,
      'movieid':movie_id,
      'backdroppath':backdropPath,
      'geners':genres,
      'overview':overview
    };
  }

  WatchListMovieModel.fromJson(Map<String, dynamic> json)
      : this(
      title: json['moivename'],
      movie_id: json['movieid'],
      posterPath: json['poster'],
      Date: json['date'],
      id: json['id'],
      backdropPath: json['backdroppath'],
      genres: json['geners'],
      overview: json['overview'],
      isSelected: json['isSelected'],
      );
}