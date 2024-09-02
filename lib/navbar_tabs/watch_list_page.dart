import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';

import '../cards/WatchlistMoviesCard.dart';
import '../firebase/firebase_functions.dart';

class watch_list_tab extends StatelessWidget {
  const watch_list_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 50, bottom: 20),
            child: Text(
              "Watchlist",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            height: 700,
            child: StreamBuilder(
              stream: Firebase_Functions.getWatchlistMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: app_colors.yellow,
                  ));
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text("Something went wrong"),
                        ElevatedButton(
                            onPressed: () {}, child: Text('try again'))
                      ],
                    ),
                  );
                }
                var watchlistMovies =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                if (watchlistMovies.isEmpty) {
                  return Center(
                    child: Text(
                      "No Watchlist Movies",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: app_colors.yellow),
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    return WatchlistMovieCard(
                      moviemodel: watchlistMovies[index],
                    );
                  },
                  itemCount: watchlistMovies.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
