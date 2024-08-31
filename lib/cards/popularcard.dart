import 'package:flutter/material.dart';
import '../models/PopularMoives.dart';

class PopularCard extends StatelessWidget {
  PopularCard({required this.movieResult, super.key});

  final Results movieResult;

  @override
  Widget build(BuildContext context) {
    String? backgroundImagePath = movieResult.backdropPath;
    String? posterImagePath = movieResult.posterPath;
    String? title = movieResult.title;
    String? time = movieResult.releaseDate;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: 412,
        height: 289,
        child: Stack(
          children: [
            if (backgroundImagePath != null)
              Image.network(
                'https://image.tmdb.org/t/p/w500$backgroundImagePath',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 217,
              ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  if (posterImagePath != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 21, top: 45), // Adjusted top padding
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500$posterImagePath',
                        width: 120,
                        height: 199,
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Container(
                        height: 118, // Matches the height of the poster
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end, // Aligns texts vertically center
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title ?? 'No Title',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis, // Handles long titles
                            ),
                            const SizedBox(height: 8), // Space between title and date
                            Text(
                              time ?? 'No Release Date',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
