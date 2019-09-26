import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseBloc with ChangeNotifier {
  CollectionReference repo = Firestore.instance.collection('test');
  String _status = 'pending';
  String get status => _status;

  Future<void> increment1() async {
    _status = 'processing';
    notifyListeners();
    var data = await repo.add({'counter': 0});
    _status = data.documentID;
    notifyListeners();
  }
}
