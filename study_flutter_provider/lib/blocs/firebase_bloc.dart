import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseBloc {
  CollectionReference repo = Firestore.instance.collection('test');
  final _statusController = BehaviorSubject<String>.seeded('pending');
  ValueObservable<String> get status => _statusController;
  final _listController = BehaviorSubject<List<TestData>>.seeded([]);
  ValueObservable<List<TestData>> get listValue => _listController;

  FirebaseBloc() {
    this.getStream();
  }

  Future<void> increment() async {
    _statusController.sink.add('processing');
    await repo.add({'counter': 0});
    _statusController.sink.add('complete');
  }

  List<TestData> list = List<TestData>();
  void getStream() {
    repo.snapshots().listen((snap) {
      snap.documents.forEach((item) {
        list = list.where((x) => x.id != item.documentID).toList();
        list.add(TestData(
            id: item.documentID, content: item.data['counter'].toString()));
      });
      _listController.sink.add(list);
    });
  }

  void dispose() {
    _statusController.close();
    _listController.close();
  }
}

class TestData {
  final String id;
  final String content;
  TestData({this.id, this.content});
}
