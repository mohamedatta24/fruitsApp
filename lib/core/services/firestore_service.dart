import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fruits_app/core/services/database_services.dart';

class FirestoreService implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }
}
