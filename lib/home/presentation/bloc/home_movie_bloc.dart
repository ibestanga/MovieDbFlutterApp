import 'package:movie_db_flutter_app/home/domain/usecase/get_favorites_movies_usecase.dart';
import 'package:movie_db_flutter_app/home/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_event.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMovieBloc extends Bloc<HomeMoviesEvent, HomeMoviesState> {
  final GetPopularMoviesUsecase _getPopularMoviesUsecase;
  final GetFavoritesMoviesUsecase _getFavoritesMoviesUsecase;

  HomeMovieBloc(this._getPopularMoviesUsecase, this._getFavoritesMoviesUsecase)
      : super(Init()) {
    on<OnGetPopularMovies>((event, emit) async {
      emit(Loading());

      final result = await _getPopularMoviesUsecase();

      result.fold((error) => emit(FalureRequest(failure: error)),
          (movie) => emit(SuccessPopularMovies(popularMovies: movie)));
    });
  }
}
