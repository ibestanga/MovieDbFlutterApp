class HomeMovieEntity {
  final int id;
  final String title;
  final String posterUrl;
  final String overview;
  final String releaseDate;
  final double voteAverage;

  HomeMovieEntity(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage});
}
