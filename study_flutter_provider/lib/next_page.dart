import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_provider/blocs/counter_bloc.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CnCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Text(counter.counter1.toString()),
    );
  }
}
