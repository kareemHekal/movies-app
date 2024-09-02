class WatchListMovieModel {
  String id;
  String posterimage;
  String title;
  String Date;
  bool isSelected;

  WatchListMovieModel(
      {required this.isSelected,
        this.id = '',
        required this.posterimage,
        required this.title,
        required this.Date,
        });

  Map<String, dynamic> toJson() { // Fix the typo here
    return {
      "moivename": title,
      "poster": posterimage,
      "isSelected": isSelected,
      "date": Date,
      "id": id,
    };
  }

  WatchListMovieModel.fromJson(Map<String, dynamic> json)
      : this(
      title: json['moivename'],
      posterimage: json['poster'],
      Date: json['date'],
      id: json['id'],
      isSelected: json['isSelected'],
      );
}