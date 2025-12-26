import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  const Releases({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Image.asset("assets/upcoming.png", height: 80, width: 80),
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
      ],
    );
  }
}
