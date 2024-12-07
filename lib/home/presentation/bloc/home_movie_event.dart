sealed class HomeMoviesEvent {}

final class OnGetPopularMovies extends HomeMoviesEvent {
  OnGetPopularMovies();
}

final class OnGetFavoritesMovies extends HomeMoviesEvent {
  OnGetFavoritesMovies();
}
