import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CnCounter {
  final _valueController1 = StreamController<String>();
  Stream<String> get counter1 => _valueController1.stream;

  int _counter1 = 0;

  final _countController = BehaviorSubject<String>.seeded('0');
  ValueObservable<String> get counter2 => _countController;
  int _counter2 = 0;

  void increment1() {
    _counter1++;
    _valueController1.sink.add(_counter1.toString());
  }

  void increment2() {
    _counter2++;
    _countController.sink.add(_counter2.toString());
  }

  void dispose() {
    _valueController1.close();
    _countController.close();
  }
}
