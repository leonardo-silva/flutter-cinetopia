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
}
