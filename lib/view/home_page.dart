import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movi_app/bloc/movies_bloc.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const String imageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoviesBloc? moviesBloc;

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(FetchMoviesEvent());
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie app"),
        ),
        body: BlocConsumer<MoviesBloc, MoviesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MoviesInitialState) {
              return buildLoading();
            }
            if (state is MoviesLoadingState) {
              return buildLoading();
            }

            if (state is MoviesLoadedState) {
              return buildUI(state.author);
            }
            if (state is MoviesErrorState) {
              return buildError(state.message);
            }
            return Container(
              child: Text("Movie App"),
            );
          },
        ));
  }

  Widget buildUI(List<Articles> articles) {
    return Card(elevation: 12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Image.network(
              "${articles[0].urlToImage}",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${articles[0].author}"),
              SizedBox(height: 10,),
              Text("${articles[0].publishedAt}"),
             // Text(articles.toString()),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildError(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
