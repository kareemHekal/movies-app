class newReleasemovies {
  Dates? dates;
  int? page;
  List<New_Results>? results;
  int? totalPages;
  bool? isSelected;
  int? totalNew_Results;

  newReleasemovies(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalNew_Results});

  newReleasemovies.fromJson(Map<String, dynamic> json) {
    isSelected = json["isSelected"];
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <New_Results>[];
      json['results'].forEach((v) {
        results!.add(new New_Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalNew_Results = json['total_results'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

class New_Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  bool? isSelected;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  New_Results(
      {this.isSelected,
      this.adult,
      this.backdropPath,
      this.genreIds,
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
      this.voteCount,});

  New_Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    isSelected = json["isSelected"];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
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
