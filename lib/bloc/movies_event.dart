part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {}

class FetchMoviesEvent extends MoviesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class FetchSportMoviesEvent extends MoviesEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

