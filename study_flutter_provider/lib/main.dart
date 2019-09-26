import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_provider/blocs/counter_bloc.dart';
import 'package:study_flutter_provider/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CnCounter>(
      builder: (_) => CnCounter(),
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
