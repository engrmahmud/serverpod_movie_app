



import 'package:noteapp_client/noteapp_client.dart';

@immutable
sealed class MovieRetrieveState {
  const MovieRetrieveState();
}

class MovieRetrieveInitialState extends MovieRetrieveState {
}


class MovieRetrieveLoadingState extends MovieRetrieveState {

}

class MovieRetrieveErrorState extends MovieRetrieveState {
  final String message;

  const MovieRetrieveErrorState(this.message);
}

class MovieRetrieveSuccessState extends MovieRetrieveState {
  final Movie movie;

  const MovieRetrieveSuccessState(this.movie);
}