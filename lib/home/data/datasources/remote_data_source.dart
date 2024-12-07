import 'package:movie_db_flutter_app/home/data/models/home_movies_model.dart';
import 'package:movie_db_flutter_app/home/data/models/popular_movies_response.dart';
import 'package:dio/dio.dart';
import 'package:movie_db_flutter_app/shared/constants/app_constants.dart';

abstract class HomeRemoteMoviesDataSource {
  Future<List<HomeMoviesModel>> getPopularMovies();
}

class HomeRemoteMoviesDataSourceImpl implements HomeRemoteMoviesDataSource {
  final Dio api = Dio();
  static const String moviePopularPath = 'movie/popular';

  @override
  Future<List<HomeMoviesModel>> getPopularMovies() async {
    final response = await api.get(AppConstants.baseUrl + moviePopularPath);
    final responseModel = PopularMoviesResponse.fromJson(response.data);
    return responseModel.results
        .map((item) => HomeMoviesModel.fromResponse(item))
        .toList();
  }
}
