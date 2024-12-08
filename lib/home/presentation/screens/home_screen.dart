import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_bloc.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_event.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("home view"),
        ),
        body: BlocBuilder<HomeMovieBloc, HomeMoviesState>(
            builder: (context, state) {
          switch (state) {
            case Init():
              return Center(
                  child: Column(
                children: [
                  const Text("init state"),
                  TextButton(
                      onPressed: () => BlocProvider.of<HomeMovieBloc>(context)
                          .add(OnGetPopularMovies()),
                      child: const Text("press"))
                ],
              ));
            case Loading():
              return const Center(child: CircularProgressIndicator());
            case SuccessPopularMovies():
              return Center(
                  child: Text("lista size${state.popularMovies.length}"));
            case SuccessFavoritesMovies():
            // TODO: Handle this case.
            case FalureRequest():
              return const Center(child: Text("Error"));
          }
        }));
  }
}
