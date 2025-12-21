import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  const SearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    // In this case we are going to use the widget CustomScrollView instead of SingleChildScrollView
    // because we cannot use SingleChildScrollView with a Column as a child, it raises an exception.
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Image.asset("assets/movie.png", height: 80, width: 80),
        ),
        SliverToBoxAdapter(child: Text("Filmes populares")),
        SliverToBoxAdapter(child: TextField()),
        SliverList.builder(
          itemBuilder: (context, index) => MovieCard(),
          itemCount: 10,
        ),
      ],
    );
  }
}
