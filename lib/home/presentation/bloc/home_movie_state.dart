import 'package:movie_db_flutter_app/core/errors/faliure.dart';
import 'package:movie_db_flutter_app/home/domain/dto/home_movie_entity.dart';

sealed class HomeMoviesState {}

final class Init extends HomeMoviesState {}

final class Loading extends HomeMoviesState {}

final class SuccessPopularMovies extends HomeMoviesState {
  final List<HomeMovieEntity> popularMovies;

  SuccessPopularMovies({required this.popularMovies});
}

final class SuccessFavoritesMovies extends HomeMoviesState {
  final List<HomeMovieEntity> favoritesMovies;

  SuccessFavoritesMovies({required this.favoritesMovies});
}

final class FalureRequest extends HomeMoviesState {
  final Failure failure;

  FalureRequest({required this.failure});
}
