import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_db_flutter_app/core/di/di.dart';
import 'package:movie_db_flutter_app/home/presentation/bloc/home_movie_bloc.dart';
import 'package:movie_db_flutter_app/home/presentation/screens/home_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<HomeMovieBloc>())
      ],
      child: MaterialApp(
        title: 'Pokemon APP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
