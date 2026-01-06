


import 'package:flutter/foundation.dart';

@immutable
sealed class MovieRetrieveEvents {}

final class FetchMovieEvent extends MovieRetrieveEvents {
  
  final int id;

  FetchMovieEvent({required this.id});
}

