



import 'package:noteapp_client/noteapp_client.dart';

@immutable
sealed class MovieListState {
  const MovieListState();
}

class MovieListInitialState extends MovieListState {
}


class MovieListLoadingState extends MovieListState {

}

class MovieListErrorState extends MovieListState {
  final String message;

  const MovieListErrorState(this.message);
}

class MovieListSuccessState extends MovieListState {
  final List<Movie> movies;

  const MovieListSuccessState(this.movies);
}