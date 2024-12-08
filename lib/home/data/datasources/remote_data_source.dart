import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_db_flutter_app/home/data/models/home_movies_model.dart';
import 'package:movie_db_flutter_app/home/data/models/popular_movies_response.dart';
import 'package:dio/dio.dart';
import 'package:movie_db_flutter_app/shared/constants/app_constants.dart';

abstract class HomeRemoteMoviesDataSource {
  Future<List<HomeMoviesModel>> getPopularMovies();
}

class HomeRemoteMoviesDataSourceImpl implements HomeRemoteMoviesDataSource {
  final Dio api = Dio(BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));
  static const String moviePopularPath = 'movie/popular';

  @override
  Future<List<HomeMoviesModel>> getPopularMovies() async {
    configToken();
    final response = await api.get(moviePopularPath);
    final responseModel = PopularMoviesResponse.fromJson(response.data);
    return responseModel.results
        .map((item) => HomeMoviesModel.fromResponse(item))
        .toList();
  }

  void configToken() {
    api.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = dotenv.env['TMDB_BEARER_TOKEN'];
        options.headers.addAll({'Authorization': token});
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        return handler.next(error);
      },
    ));
  }
}
