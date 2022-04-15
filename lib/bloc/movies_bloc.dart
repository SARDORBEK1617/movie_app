import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movi_app/data/repository/movies_repo.dart';
import 'package:movi_app/model/movie.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;

  MoviesBloc(this.moviesRepository) : super(MoviesInitialState()) {
    on<FetchMoviesEvent>((event, emit) async {
      try {
        List<Articles> articles = await moviesRepository.getMovies();
        emit(MoviesLoadedState(articles));
      } catch (e) {
        emit(MoviesErrorState(e.toString()));
      }
    });
  }
}
