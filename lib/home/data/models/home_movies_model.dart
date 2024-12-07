import 'package:movie_db_flutter_app/home/data/models/popular_movies_response.dart';
import 'package:movie_db_flutter_app/home/domain/dto/home_movie_entity.dart';

class HomeMoviesModel extends HomeMovieEntity {
  HomeMoviesModel(
      {required super.id,
      required super.title,
      required super.posterUrl,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage});

  factory HomeMoviesModel.fromResponse(
    PopularMovie movie,
  ) {
    return HomeMoviesModel(
        id: movie.id,
        title: movie.title,
        posterUrl: movie.posterPath,
        overview: movie.overview,
        releaseDate: movie.releaseDate.toString(),
        voteAverage: movie.voteAverage);
  }
}
