import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movi_app/bloc/movies_bloc.dart';
import 'package:provider/provider.dart';

import '../model/movie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

 // static const String imageUrl = "https://image.tmdb.org/t/p/w500";

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
              return buildUI(state.results);
            }
            if (state is MoviesErrorState) {
             // return buildError(state.message);
            }
            return Container(
              child: Text("Movie App"),
            );
          },
        ));
  }

  Widget buildUI(Movie results) {
    return ListView.builder(
        itemCount: results.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 2,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Color(0xffF8F8FF),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.redAccent,
                            ),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w200" +
                                  results.results![index].backdropPath!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              results.results![index].title!,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: Text(results.results![index].releaseDate!
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        });
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
