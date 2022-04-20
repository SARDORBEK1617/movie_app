
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/movie.dart';

abstract class MoviesRepository {
  Future<Movie> getMovies();
}

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<Movie> getMovies() async {
    var response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=e3fa1c8a95987b4b6cab472aef78df75&language=ru-US&page=2"),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Movie genreIds = Movie.fromJson(data);
      return genreIds;
    } else {
      throw Exception();
    }
  }
}