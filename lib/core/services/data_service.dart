import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';

abstract class DataService{

  Future <void> addData(String path, Map<String, dynamic> data,
  {String? documentId}
  );
  Future<Map<String, dynamic>> getData({required String path, required String documentId});

   Future<bool> checkIfDataExists({required String path, required String documentId});
}
   
    