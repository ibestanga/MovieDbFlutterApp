import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_db_flutter_app/core/errors/faliure.dart';
import 'package:movie_db_flutter_app/home/data/datasources/remote_data_source.dart';
import 'package:movie_db_flutter_app/home/data/models/home_movies_model.dart';
import 'package:movie_db_flutter_app/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteMoviesDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<HomeMoviesModel>>> getFavoriteMovies() {
    // TODO: implement getFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<HomeMoviesModel>>> getPopularMovies() async {
    try {
      final List<HomeMoviesModel> result =
          await remoteDataSource.getPopularMovies();

      return right(result);
    } on DioException {
      return left(ServerFailure());
    }
  }
}
