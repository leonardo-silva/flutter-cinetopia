import 'package:cinetopia/app/services/search_movies_service.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  SearchMovies({super.key});

  final SearchMoviesService searchMoviesService = SearchMoviesService();

  @override
  Widget build(BuildContext context) {
    // In this case we are going to use the widget CustomScrollView instead of SingleChildScrollView
    // because we cannot use SingleChildScrollView with a Column as a child, it raises an exception.
    return FutureBuilder(
      future: searchMoviesService.searchMovies(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset("assets/movie.png", height: 80, width: 80),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Text(
                    "Filmes populares",
                    style: TextStyle(
                      color: Color(0xFFEBEBEB),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      label: Text(
                        "Pesquisar",
                        style: TextStyle(color: Color(0xFFEBEBEB)),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => MovieCard(),
                itemCount: 10,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
