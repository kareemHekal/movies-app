
class topRatedMovies {
  int? page;
  List<TopRatedResult>? results;
  int? totalPages;
  int? totalNew_Results;

  topRatedMovies({this.page, this.results, this.totalPages, this.totalNew_Results});
  topRatedMovies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TopRatedResult>[];
      json['results'].forEach((v) {
        results!.add(new TopRatedResult.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalNew_Results = json['total_results'];
  }
}

class TopRatedResult {
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

  TopRatedResult(
      {this.adult,
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
        this.voteCount,this.isSelected});

  TopRatedResult.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
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
    isSelected = json["isSelected"];
  }
}