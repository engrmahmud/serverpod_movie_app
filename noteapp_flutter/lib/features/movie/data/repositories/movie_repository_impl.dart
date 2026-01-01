// Why this file specifically comes next 2
// Reason 1: Clean Architecture flow

// Clean Architecture goes in this order:

// Define rules (Domain)

// Create workers that follow those rules (Data)

// Later connect UI


// Reason 3: It connects Domain to Data . This class is the bridge between:

//Domain expectations & Actual data fetching

// Without this file:

// Use cases cannot work

// BLoC cannot work

// UI cannot get data



import 'package:fpdart/fpdart.dart';
import 'package:noteapp_client/noteapp_client.dart';
import 'package:noteapp_flutter/core/error/exceptions.dart';
import 'package:noteapp_flutter/core/error/failure.dart';
import 'package:noteapp_flutter/features/movie/data/datasources/movie_datasources.dart';
import 'package:noteapp_flutter/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository{

  final MovieDatasources datasources;

  MovieRepositoryImpl(this.datasources);

  @override
  Future<Either<Failure, List<Movie>>> list() async {
    try {
      return right(await datasources.list());
    }  on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> retrieve(int id) async {
    try {
      return right(await datasources.retrieve(id));
    }  on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

}