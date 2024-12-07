import 'package:dartz/dartz.dart';
import 'package:movie_db_flutter_app/core/errors/faliure.dart';
import 'package:movie_db_flutter_app/home/domain/dto/home_movie_dto.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeMovieDto>> getPopularMovies();
  Future<Either<Failure, HomeMovieDto>> getFavoriteMovies();
}
