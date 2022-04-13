part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable{}

class FetchNewsEvent extends NewsEvent{
  final double angle;

  FetchNewsEvent(this.angle);

  @override

  List<Object?> get props => [angle];

}

class FetchSporNewsEvent extends NewsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}