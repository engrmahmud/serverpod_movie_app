


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_flutter/dependencies.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:noteapp_flutter/features/movie/presentation/pages/movie_list_page.dart';



void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
       BlocProvider(create: (_) => serviceLocator<MovieListBloc>(),),
      ],
      child: 
        const MyApp(),
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serverpod Demo',
      theme: ThemeData.dark(),
      home: MovieListPage(),
    );
  }
}


