import 'package:flutter/material.dart';

import '../models/moiveDetailsModel.dart';

class GenresChoiceChips extends StatelessWidget {
  final List<Genres> genres;

  GenresChoiceChips({required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: genres.map((genre) {
        return Chip(
          label: Text(genre.name!),
          backgroundColor: Colors.black,
          labelStyle: TextStyle(color: Colors.white),
          shape: StadiumBorder(
            side: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        );
      }).toList(),
    );
  }
}