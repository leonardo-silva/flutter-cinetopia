import 'package:cinetopia/app/helpers/consts.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D0E44),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 45, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.arrow_back),
            Center(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/movie.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: 176,
                    height: 235,
                    decoration: BoxDecoration(
                      color: Color(0xFF000000),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          "$imageUrlPrefix/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 15),
              child: Text(
                "Descrição",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "Thor parte em uma jornada de autodescoberta, diferente de tudo que ele já enfrentou. Mas seus esforços são interrompidos por um assassino galáctico conhecido como Gorr, o Carniceiro dos Deuses, que busca a extinção dos deuses.",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
