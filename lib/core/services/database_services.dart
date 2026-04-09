abstract class DataBaseServices {
  Future<void> addData({ required String path, required Map<String, dynamic> data ,  String? documentId });
  Future<Map<String , dynamic>> getUserData({required String path, required String uid});
  Future<dynamic> getData({required String path , String? documentId , Map<String , dynamic>? queryParameters});
  Future<bool> isExisits({required String path , required String documentId});
}