import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_provider/blocs/firebase_bloc.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Next Page'),
        ),
        body: Text('aaaa'),
        floatingActionButton: _FloatingButton1());
  }
}

class _FloatingButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ボタンはカウンターの値の変更に反応する必要がないためlistenしないようにしておく
    final counter = Provider.of<FirebaseBloc>(context, listen: false);

    return FloatingActionButton(
      heroTag: "btn1",
      onPressed: counter.increment1,
      child: const Icon(Icons.add),
    );
  }
}
