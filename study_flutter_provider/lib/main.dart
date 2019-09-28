import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_provider/blocs/counter2_bloc.dart';
import 'package:study_flutter_provider/blocs/counter_bloc.dart';
import 'package:study_flutter_provider/blocs/firebase_bloc.dart';
import 'package:study_flutter_provider/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CnCounter>(
          builder: (_) => CnCounter(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<FirebaseBloc>(
          builder: (_) => FirebaseBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Counter(),
      ),
    );
  }
}
