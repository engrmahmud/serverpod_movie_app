


import 'package:fpdart/fpdart.dart';
import 'package:noteapp_client/noteapp_client.dart';
import 'package:noteapp_flutter/core/error/failure.dart';
import 'package:noteapp_flutter/core/usecases/usecase.dart';
import 'package:noteapp_flutter/features/movie/domain/repositories/movie_repository.dart';

class ListMoviesUsecase implements Usecase<List<Movie>, NoParams>{

  final MovieRepository movieRepository;


  const ListMoviesUsecase(this.movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await movieRepository.list();
  }
  

   
}