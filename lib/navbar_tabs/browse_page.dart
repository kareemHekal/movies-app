import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';

import '../api_maneger.dart';
import '../cards/categoryCard.dart';
import '../models/catogrisModel.dart';

class browse_tab extends StatelessWidget {
  const browse_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Browse Category ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                future: ApiManeger.getCatogoris(),
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
                  catagorisModel catagoris = snapshot.data;
                  List<Genres> genres = catagoris.genres ?? [];

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      Genres genre = genres[index];
                      return categoryCard(
                        name: genre.name,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
