import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {

  static String route () => '/movies/:id';
  final int movieId;

  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: const Center(
        
      )
    );
  }
}