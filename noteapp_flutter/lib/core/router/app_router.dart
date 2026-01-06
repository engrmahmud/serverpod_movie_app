

import 'package:go_router/go_router.dart';
import 'package:noteapp_flutter/features/movie/presentation/pages/movie_detail_page.dart';
import 'package:noteapp_flutter/features/movie/presentation/pages/movie_list_page.dart';

class Approuter {

   static GoRouter router = GoRouter(
    initialLocation: MovieListPage.route(), 
    routes: [
   
    GoRoute(
      path: MovieListPage.route(), 
      builder: (context, _) => const MovieListPage(),
    ),
    GoRoute(
      path: MovieDetailPage.route(), 
      builder: (context, state) => MovieDetailPage(
        movieId: int.parse(state.pathParameters['id'] ?? '0',)
      ),
    ), 
    
   ],
 );
}