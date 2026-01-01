import 'package:flutter/material.dart';
import 'package:noteapp_flutter/features/movie/presentation/widgets/movie_list_widget.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Movies')),
      ),
      body: MovieListWidget(),
    );
    
  }
}