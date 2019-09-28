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
        body: _Text1(),
        floatingActionButton: _FloatingButton1());
  }
}

class _FloatingButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ボタンはカウンターの値の変更に反応する必要がないためlistenしないようにしておく
    final counter = Provider.of<FirebaseBloc>(context);

    return FloatingActionButton(
      heroTag: "btn1",
      onPressed: counter.increment,
      child: const Icon(Icons.add),
    );
  }
}

class _Text1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebase = Provider.of<FirebaseBloc>(context);
    return Column(
      children: <Widget>[
        StreamBuilder<String>(
          initialData: firebase.status.value,
          stream: firebase.status,
          builder: (context, snapshot) {
            return Text(snapshot.data);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Text(index.toString());
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
