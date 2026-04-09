import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/core/services/database_services.dart';

class FireStoreServices implements DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getUserData(
      {required String path, required String uid}) async {
    var data = await firestore.collection(path).doc(uid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isExisits(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? queryParameters}) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = await firestore.collection(path);
      if (queryParameters != null) {
        if (queryParameters['limit'] != null) {
          var limit = queryParameters['limit'];
          data = data.limit(limit);
        }
        if (queryParameters['orderyBy'] != null) {
          var orderBy = queryParameters['orderyBy'];
          var isDescending = queryParameters['isDescending'];
          data = data.orderBy(orderBy, descending: isDescending);
        }
      }
      var snapshot = await data.get();
      return snapshot.docs.map((e) => e.data()).toList();
    }
  }
}
