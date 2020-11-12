import 'package:cloud_firestore/cloud_firestore.dart';

class AdminBloc {
  static AdminBloc _instance;

  static AdminBloc getInstance() {
    if (_instance == null) _instance = new AdminBloc();
    return _instance;
  }

  Query getOrdersList() {
    return FirebaseFirestore.instance
        .collection('applications')
        .orderBy('registeredOn', descending: true);
  }
}
