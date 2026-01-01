import 'package:fpdart/fpdart.dart';
import 'package:noteapp_flutter/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params); 

}

class NoParams {}