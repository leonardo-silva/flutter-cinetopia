import 'dart:convert';

import 'package:cinetopia/app/helpers/consts.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String overView;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.overView,
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
      'overView': overView,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['poster_path'] as String,
      releaseDate: map['release_date'] as String,
      overView: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}
