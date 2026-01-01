


import 'package:flutter/foundation.dart';

@immutable
sealed class MovieListEvents {}

final class FetchMoviesEvent extends MovieListEvents {}

