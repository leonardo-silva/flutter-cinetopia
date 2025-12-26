import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // In this case we are going to use the widget CustomScrollView instead of SingleChildScrollView
    // because we cannot use SingleChildScrollView with a Column as a child, it raises an exception.
    return FutureBuilder(
      future: viewmodel.getMovie(textController.text),
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
                    controller: textController,
                    onEditingComplete: () {
                      FocusScope.of(
                        context,
                      ).unfocus(); // To remove the focus of the text field
                      setState(() {
                        // just calling an empty setState forces to reload the widget, to show the new list of movies, in this case
                      });
                    },
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
