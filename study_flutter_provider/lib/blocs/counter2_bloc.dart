import 'dart:async';

class Counter2Bloc {
  final _streamController = StreamController<String>();
  StreamController<String> get exCounter => _streamController;
  int _counter1 = 0;

  void increment1() {
    _counter1++;
    _streamController.sink.add(_counter1.toString());
  }

  void dispose() {
    _streamController.close();
  }
}
