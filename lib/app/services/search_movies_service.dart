// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart';

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  List<Movie> movies = <Movie>[];

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await get(
        Uri.parse(popularMoviesUrl),
        headers: requestHeader,
      );

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    return movies;
  }
}

class SearchForMovieService implements SearchMoviesService {
  List<Movie> movies = <Movie>[];
  final String query;

  SearchForMovieService({required this.query});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await get(
        Uri.parse(moviePrefixUrl + query + movieFilterSulfix),
        headers: requestHeader,
      );

      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)['results']) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print(e);
    }

    return movies;
  }
}
