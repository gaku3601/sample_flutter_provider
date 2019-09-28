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
          _floatingButton1(),
          _FloatingButton2(),
        ],
      ),
    );
  }
}

Consumer _floatingButton1() {
  return Consumer<CnCounter>(
    builder: (_, bloc, __) {
      return FloatingActionButton(
        heroTag: "btn1",
        onPressed: bloc.increment1,
        child: const Icon(Icons.add),
      );
    },
  );
}

class _FloatingButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CnCounter>(
      builder: (_, bloc, __) {
        return FloatingActionButton(
          heroTag: "btn2",
          onPressed: bloc.increment2,
          child: const Icon(Icons.add),
        );
      },
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
          Expanded(
            child: StreamBuilder<String>(
              stream: counter.counter1,
              builder: (context, snapshot) {
                return Center(
                  child: Text(snapshot.data ?? '0'),
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<String>(
              initialData: counter.counter2.value,
              stream: counter.counter2,
              builder: (context, snapshot) {
                return Center(
                  child: Text(snapshot.data),
                );
              },
            ),
          ),
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
