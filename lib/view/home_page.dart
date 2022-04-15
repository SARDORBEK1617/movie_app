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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          width: 400,
          height: 156,
          child: Image.network(
            "${HomePage.imageUrl}${articles[0].content}",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text("${articles[0].title}"),
            Text(articles.toString()),
          ],
        )
      ],
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
