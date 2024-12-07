import 'package:dartz/dartz.dart';
import 'package:movie_db_flutter_app/core/errors/faliure.dart';
import 'package:movie_db_flutter_app/home/data/models/home_movies_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeMoviesModel>>> getPopularMovies();
  Future<Either<Failure, List<HomeMoviesModel>>> getFavoriteMovies();
}
