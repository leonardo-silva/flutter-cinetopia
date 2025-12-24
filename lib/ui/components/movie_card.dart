import 'package:cinetopia/app/helpers/util.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 90,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xFF000000),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(movie.getPosterImage()),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.only(right: 16, bottom: 16),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                limitString(movie.title, 20),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "Lançamento: ${movie.releaseDate}",
              style: TextStyle(color: Color(0xFFA5A5A5)),
            ),
          ],
        ),
      ],
    );
  }
}
