// This file exists because the repository should NOT talk directly to the server. So we need another rule for how data is actually fetched. 3
// Data Source = lowest-level worker
// “Talk to the server and return raw data.”

import 'package:noteapp_client/noteapp_client.dart';
import 'package:noteapp_flutter/core/error/exceptions.dart';

abstract interface class MovieDatasources {
  Future<List<Movie>> list();
  Future<Movie> retrieve(int id);
}



class MovieDatasourcesImpl implements MovieDatasources{
  final Client client;
  // final SessionManager sessionManager;

  MovieDatasourcesImpl(this.client);

  @override
  Future<List<Movie>> list() async {
    
    try {
      return await client.movie.list();
    } catch (e) {

      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> retrieve(int id) async {
    try{
      final result = await client.movie.retrieve(id);
      if (result == null) {
        throw const ServerException('Movie not found');
      } else {
        return result;
      }
    }
    catch (e){
      throw ServerException(e.toString());
    
    }
  }

}


