import 'package:noteapp_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MovieEndpoint extends Endpoint {
  Future<List<Movie>> list(Session session) async {
    return await Movie.db.find(session);
  }

  Future<Movie?> retrieve(Session session, int id) async {
    return await Movie.db.findById(session, id);
  }

  Future<Movie> create(Session session, Movie movie) async {
    return await Movie.db.insertRow(session, movie);
  }
}


