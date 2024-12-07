import 'package:dartz/dartz.dart';
import 'package:movie_db_flutter_app/core/errors/faliure.dart';
import 'package:movie_db_flutter_app/home/domain/dto/home_movie_dto.dart';
import 'package:movie_db_flutter_app/home/domain/repositories/home_repository.dart';

class GetPopularMoviesUsecase {
  final HomeRepository repository;

  GetPopularMoviesUsecase({required this.repository});

  Future<Either<Failure, HomeMovieDto>> call() {
    return repository.getPopularMovies();
  }
}
