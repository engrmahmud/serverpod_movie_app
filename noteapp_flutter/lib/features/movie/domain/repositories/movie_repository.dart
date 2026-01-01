// That file said: “Anyone who wants to provide movies MUST do these two things.” 1


import 'package:noteapp_client/noteapp_client.dart';
import 'package:fpdart/fpdart.dart';
import 'package:noteapp_flutter/core/error/failure.dart';

abstract interface class MovieRepository {

  Future<Either<Failure,  List<Movie>>> list();
  Future<Either<Failure,  Movie>> retrieve(int id);
}

// We started from this file because this file defines what the app needs, not how it works. Clean Architecture always starts from “need”, not “implementation”.

// What this file represents (very simply)

// This file answers two critical questions:

// What data does the app need?

// What can go wrong when getting that data?