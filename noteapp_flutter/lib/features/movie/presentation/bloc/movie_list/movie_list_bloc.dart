


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_flutter/core/error/usecases/usecase.dart';
import 'package:noteapp_flutter/features/movie/domain/usecases/list_movies.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_list/movie_list_events.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_list/movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvents, MovieListState> {
  
  final ListMoviesUsecase listMovies;
  
  MovieListBloc(this.listMovies) : super(MovieListInitialState()) {
    on<MovieListEvents>((_, emit) => emit(MovieListLoadingState()));
    on<FetchMoviesEvent>(_onFetchMovie );


}

Future<void> _onFetchMovie(MovieListEvents event, Emitter<MovieListState> emit) async {
  final result = await listMovies(NoParams());

  result.fold(
    (failure) => emit(MovieListErrorState(failure.message)), 
    (movies) => emit(MovieListSuccessState(movies))
    
  );
}
}