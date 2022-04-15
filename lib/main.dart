import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movi_app/view/home_page.dart';

import 'bloc/movies_bloc.dart';
import 'data/repository/movies_repo.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          create: (_) => MoviesBloc(MoviesRepositoryImpl()), child: HomePage()),
    );
  }
}
