import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_provider/blocs/counter_bloc.dart';
import 'package:study_flutter_provider/next_page.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: _CounterText(),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _FloatingButton1(),
          _FloatingButton2(),
        ],
      ),
    );
  }
}

class _FloatingButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ボタンはカウンターの値の変更に反応する必要がないためlistenしないようにしておく
    final counter = Provider.of<CnCounter>(context, listen: false);

    return FloatingActionButton(
      heroTag: "btn1",
      onPressed: counter.increment1,
      child: const Icon(Icons.add),
    );
  }
}

class _FloatingButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ボタンはカウンターの値の変更に反応する必要がないためlistenしないようにしておく
    final counter = Provider.of<CnCounter>(context, listen: false);

    return FloatingActionButton(
      heroTag: "btn2",
      onPressed: counter.increment2,
      child: const Icon(Icons.add),
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CnCounter>(context);

    return Center(
      child: Column(
        children: <Widget>[
          Text(counter.counter1.toString()),
          Text(counter.counter2.toString()),
          RaisedButton(
            child: Text("Next Page"),
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NextPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
