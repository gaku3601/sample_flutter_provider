import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseBloc with ChangeNotifier {
  CollectionReference repo = Firestore.instance.collection('test');

  Future<void> increment1() async {
    await repo.add({'counter': 0});

    notifyListeners();
  }
}
