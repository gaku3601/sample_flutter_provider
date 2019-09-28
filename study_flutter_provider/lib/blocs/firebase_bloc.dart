import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseBloc {
  CollectionReference repo = Firestore.instance.collection('test');
  final _statusController = BehaviorSubject<String>.seeded('pending');
  ValueObservable<String> get status => _statusController;

  Future<void> increment() async {
    _statusController.sink.add('processing');
    await repo.add({'counter': 0});
    _statusController.sink.add('complete');
  }

  void dispose() {
    _statusController.close();
  }
}
