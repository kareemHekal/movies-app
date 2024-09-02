import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/navbar_tabs/watch_list_page.dart';

import '../models/watch_list_movie.dart';

 class Firebase_Functions{
  static CollectionReference<WatchListMovieModel> getWatchlistCollection() {
    return FirebaseFirestore.instance
        .collection("watchlist")
        .withConverter<WatchListMovieModel>(
      fromFirestore: (snapshot, _) {
        return WatchListMovieModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson(); // Fix the typo here
      },
    );
  }
  static Stream<QuerySnapshot<WatchListMovieModel>> getWatchlistMovies() {
    var collection = getWatchlistCollection();
    return collection
        .snapshots();
  }
  static Future<void> addTask(WatchListMovieModel movie) {
    var collection =getWatchlistCollection ();
    var docRef = collection.doc();
    movie.id = docRef.id;
    return docRef.set(movie);
  }

  static Future<void> deleteMovie(String?id) {
    return getWatchlistCollection().doc(id).delete();
  }
}