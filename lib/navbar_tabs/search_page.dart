import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';

import '../searchpage.dart';

class search_tab extends StatelessWidget {
  const search_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Click the search icon to explore movies",
              style: TextStyle(
                color: app_colors.yellow,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: app_colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchTab());
                  },
                  icon: Icon(
                    Icons.search,
                    color: app_colors.yellow,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}