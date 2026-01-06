import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp_flutter/core/widgets/loader.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_retrieve/movie_retrieve_bloc.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_retrieve/movie_retrieve_events.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_retrieve/movie_retrieve_state.dart';

class MovieDetailPage extends StatefulWidget {

  static String route ([int? movieId]) => '/movies/${movieId ?? ':id'}';
  final int movieId;
  
  const MovieDetailPage({super.key, required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
 
  @override
  void initState() {
    super.initState();
    context.read<MovieRetrieveBloc>().add(FetchMovieEvent(id: widget.movieId));
    
  }


  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<MovieRetrieveBloc, MovieRetrieveState>(
      listener: (context, state) {
        
        if (state is MovieRetrieveErrorState) {
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
            content: Text(state.message)
          ));
          context.pop();
        }
      },
      builder: (context, state) {
        switch(state) {
          
          case MovieRetrieveInitialState():
            return const SizedBox();
            
          case MovieRetrieveLoadingState():
            return Scaffold(body: Center(child: const Loader()));
            
          case MovieRetrieveErrorState():
            return Scaffold(body :  Center(child: Text(state.message)));
            
          case MovieRetrieveSuccessState():
            final movie = state.movie;
            return Scaffold(
              appBar: AppBar(
                title: Text(movie.title),
              ),
              body: Column(
                children: [
                  Text('Released in ${movie.year}'),
                  Text('Director: ${movie.directorname}'),
                  Text('Logline: ${movie.logline}'), 
                ],
              )  
            );  
        }
      },
    );      
  }
}