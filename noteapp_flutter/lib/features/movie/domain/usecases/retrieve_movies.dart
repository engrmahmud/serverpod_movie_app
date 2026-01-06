

import 'package:fpdart/fpdart.dart';
import 'package:noteapp_client/noteapp_client.dart';
import 'package:noteapp_flutter/core/error/failure.dart';
import 'package:noteapp_flutter/core/usecases/usecase.dart';
import 'package:noteapp_flutter/features/movie/domain/repositories/movie_repository.dart';

class RetrieveMovieUsecase implements Usecase<Movie, RetrieveMovieParams>{

  final MovieRepository movieRepository;


  const RetrieveMovieUsecase(this.movieRepository);

  @override
  Future<Either<Failure, Movie>> call(RetrieveMovieParams params) async {
    return await movieRepository.retrieve(params.id);
  }

}


class RetrieveMovieParams {
  final int id;

  const RetrieveMovieParams({required this.id});
}