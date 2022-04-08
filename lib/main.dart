import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movi_app/view/second_page.dart';
import 'package:movi_app/view_model/movies_list_vm.dart';
import 'package:provider/provider.dart';

import 'bloc/news_bloc.dart';
import 'data/repository/news_repo.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MoviesListViewModel()),
      ],
      child:  MaterialApp(
        home: BlocProvider(
            create: (_) => NewsBloc(NewsRepositoryImpl()), child: SecondPage()
        ),
      ),
    );
  }
}
