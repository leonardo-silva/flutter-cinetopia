import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  Releases({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getOnTheAirMovies(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/upcoming.png",
                  height: 80,
                  width: 80,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  child: Text(
                    "Próximos Lançamentos",
                    style: TextStyle(
                      color: Color(0xFFEBEBEB),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) =>
                    MovieCard(movie: viewmodel.moviesList[index]),
                itemCount: viewmodel.moviesList.length,
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
