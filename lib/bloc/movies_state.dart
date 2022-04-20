part of 'movies_bloc.dart';

@immutable
abstract class MoviesState extends Equatable {}

class MoviesInitialState extends MoviesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MoviesLoadingState extends MoviesState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MoviesLoadedState extends MoviesState {
  Movie results;

  MoviesLoadedState(this.results);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class MoviesErrorState extends MoviesState {
  String message;
  MoviesErrorState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => throw  MoviesErrorState(message);
}
