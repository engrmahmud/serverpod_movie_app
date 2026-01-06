


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_client/noteapp_client.dart';
import 'package:noteapp_flutter/features/movie/domain/usecases/list_movies.dart';
import 'package:noteapp_flutter/features/movie/domain/usecases/retrieve_movies.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_retrieve/movie_retrieve_events.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_retrieve/movie_retrieve_state.dart';

class MovieRetrieveBloc extends Bloc<MovieRetrieveEvents, MovieRetrieveState> {
  
  final RetrieveMovieUsecase retrieveMovie;
  
  MovieRetrieveBloc(ListMoviesUsecase listMoviesUsecase, {required this.retrieveMovie}) : super(MovieRetrieveInitialState()) {
    on<MovieRetrieveEvents>((_, emit) => emit(MovieRetrieveLoadingState()));
    on<FetchMovieEvent>(_onFetchMovie );


}

Future<void> _onFetchMovie(FetchMovieEvent event, Emitter<MovieRetrieveState> emit) async {
  final result = await retrieveMovie(RetrieveMovieParams(id: event.id));

  result.fold(
    (failure) => emit(MovieRetrieveErrorState(failure.message)), 

    (movie) => emit(MovieRetrieveSuccessState(movie)),
    
  ); 

}
}