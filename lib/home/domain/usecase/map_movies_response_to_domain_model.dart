import 'package:movie_db_flutter_app/home/data/entities/popular_movies_response.dart';
import 'package:movie_db_flutter_app/home/domain/dto/home_movie_dto.dart';

class MapMoviesResponseToDomainModel {
  call(
    PopularMovie movie,
  ) {
    return HomeMovieDto(
        id: movie.id,
        title: movie.title,
        posterUrl: movie.posterPath,
        overview: movie.overview,
        releaseDate: movie.releaseDate.toString(),
        voteAverage: movie.voteAverage);
  }
}
