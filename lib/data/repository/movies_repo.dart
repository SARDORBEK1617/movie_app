import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../model/movie.dart';

abstract class MoviesRepository{
  Future<List<Articles>>getMovies();
}

class MoviesRepositoryImpl implements MoviesRepository{

  @override
  Future<List<Articles> >getMovies()async{
    var response = await http.get(Uri.parse('https://newsapi.org/v2/everything?'
        'q=tesla&from=2022-03-12&sortBy=publishedAt&'
        'apiKey=7c4fde365a14427291a87754b38bbc30'));

    if(response.statusCode==200){
      var data = json.decode(response.body);
      List<Articles> articles=Autogenerated.fromJson(data).articles!;
      return articles;
    }
    else{
      throw Exception();
    }
  }
}