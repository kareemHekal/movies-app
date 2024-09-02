import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api_maneger.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/models/PopularMoives.dart';
import 'package:movie_app/models/newrelases.dart';
import '../cards/popularcard.dart';
import '../cards/regular movie card.dart';
import '../models/topRatedMovies.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: ApiManeger.getPopularMovies(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Color(0xffFFBB3B),
                      ),
                    ],
                  ));
                }
                if (snapshot.hasError) {
                  return const Text("Something went wrong. Try again.");
                }
                if (!snapshot.hasData) {
                  return const Text("No data available.");
                }
                List<Results> popularMovies = snapshot.data.results ?? [];

                return Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 0),
                  child: CarouselSlider(
                    items: popularMovies.map((movie) {
                      return Builder(
                        builder: (BuildContext context) {
                          return PopularCard(movieResult: movie);
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 350, // Adjust the height as needed
              color: app_colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Releases",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: ApiManeger.getNewReleasesMovies(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Color(0xffFFBB3B),
                                ),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          print(snapshot);
                          return const Text("Something went wrong. Try again.");
                        }
                        if (!snapshot.hasData) {
                          return const Text("No data available.");
                        }
                        List<New_Results> popularMovies =
                            snapshot.data.results ?? [];

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: popularMovies.length,
                            // Set the item count
                            itemBuilder: (context, index) {
                              // Access the element at index
                              New_Results movie = popularMovies[index];
                              return MovieCard(
                                movieResult: movie,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 350, // Adjust the height as needed
              color: app_colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recomended",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: ApiManeger.getTopRatedMovies(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Color(0xffFFBB3B),
                              ),
                            ],
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        print(snapshot);
                        return const Text("Something went wrong. Try again.");
                      }
                      if (!snapshot.hasData) {
                        return const Text("No data available.");
                      }
                      List<TopRatedResult> popularMovies =
                          snapshot.data.results ?? [];
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMovies.length,
                          // Set the item count
                          itemBuilder: (context, index) {
                            // Access the element at index
                            TopRatedResult movie = popularMovies[index];
                            return MovieCard(movieResult: movie,

                            );
                          },
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
