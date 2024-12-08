import 'package:get_it/get_it.dart';
import 'package:movie_db_flutter_app/home/data/datasources/remote_data_source.dart';
import 'package:movie_db_flutter_app/home/data/repositories/home_repository_impl.dart';
import 'package:movie_db_flutter_app/home/domain/repositories/home_repository.dart';
import 'package:movie_db_flutter_app/home/domain/usecase/get_favorites_movies_usecase.dart';
import 'package:movie_db_flutter_app/home/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_bloc.dart';

// pd = poolDependencies
final pd = GetIt.instance;

Future<HomeRepository> createHomeRepository(
    HomeRemoteMoviesDataSource dataSource) async {
  return HomeRepositoryImpl(remoteDataSource: dataSource);
}

Future<void> init() async {
  // Home

  // Presentations
  pd.registerFactory(() => HomeMovieBloc(pd(), pd()));

  // Domain
  pd.registerLazySingleton(() => GetPopularMoviesUsecase(repository: pd()));
  pd.registerLazySingleton(() => GetFavoritesMoviesUsecase(repository: pd()));

  // Data
  pd.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: pd()));

  pd.registerLazySingleton<HomeRemoteMoviesDataSource>(
      () => HomeRemoteMoviesDataSourceImpl());
}
