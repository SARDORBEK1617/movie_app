import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/api_response.dart';
import '../model/movie.dart';
import '../view_model/movies_list_vm.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const String imageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<MoviesListViewModel>(context, listen: false)
        .fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<MoviesListViewModel>(builder: (context, data, child) {
      if (data.response.status == Status.LOADING) {
        return const CircularProgressIndicator();
      }
      if (data.response.status == Status.COMPLETED) {
        return ListView.builder(
            itemCount: data.movies.length,
            itemBuilder: (BuildContext context, int index) {
              return movieItem(data.movies[index]);
            });
      }
      if (data.response.status == Status.ERROR) {
        return Center(child: Text(data.response.message ?? "ERROR"));
      }
      if (data.response.status == Status.INITIAl) {
        return const Center(child: Text("INITIAL"));
      }
      return Container();
    }));
  }

  Widget movieItem(Autogenerated articles) {
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
            "${HomePage.imageUrl}${articles.articles}",
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(articles.status!),
            Text(articles.toString()),
          ],
        )
      ],
    );
  }
}
