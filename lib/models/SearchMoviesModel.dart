import 'package:movie_app/models/moiveDetailsModel.dart';

class searchMoivesModel {
  int? page;
  List<Results_>? results;
  int? totalPages;
  int? totalResults;

  searchMoivesModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  searchMoivesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results_>[];
      json['results'].forEach((v) {
        results!.add(new Results_.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

}

class Results_ {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<Genres>?genres;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results_(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.genres,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  Results_.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    genres = json ['geners'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

}