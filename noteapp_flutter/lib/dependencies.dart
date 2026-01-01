

import 'package:get_it/get_it.dart';
import 'package:noteapp_client/noteapp_client.dart';
import 'package:noteapp_flutter/features/movie/data/datasources/movie_datasources.dart';
import 'package:noteapp_flutter/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:noteapp_flutter/features/movie/domain/repositories/movie_repository.dart';
import 'package:noteapp_flutter/features/movie/domain/usecases/list_movies.dart';
import 'package:noteapp_flutter/features/movie/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {




  serviceLocator.registerLazySingleton<Client>(
    () => Client("http://localhost:8080")..connectivityMonitor = FlutterConnectivityMonitor(),
  );

  
  _initMovie();
}


  void _initMovie() {

    //DataSource
    serviceLocator.registerFactory<MovieDatasources>(
      () => MovieDatasourcesImpl(
        serviceLocator<Client>()
        )
    );


    //repository
    serviceLocator.registerFactory<MovieRepository>(
      () => MovieRepositoryImpl(
        serviceLocator<MovieDatasources>()
        )
    );

    //Usecase
    serviceLocator.registerFactory<ListMoviesUsecase>(
      () => ListMoviesUsecase(
        serviceLocator<MovieRepository>()
      )
    );

    //Bloc
    serviceLocator.registerLazySingleton(
      () => MovieListBloc( 
        serviceLocator<ListMoviesUsecase>()));
  }


