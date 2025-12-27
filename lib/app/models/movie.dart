import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.overview,
  });

  String getPosterImage() {
    return imageUrlPrefix + imageUrl;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'releaseDate': releaseDate,
      'overview': overview,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    String title = map['title'] ?? map['name'];
    String releaseDate = map['release_date'] ?? map['first_air_date'];
    return Movie(
      id: map['id'] as int,
      title: title,
      imageUrl: map['poster_path'] as String,
      releaseDate: releaseDate,
      overview: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
