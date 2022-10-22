import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
class Databaseservices extends GetxController{
  final CollectionReference collectionUser = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getdData()async{
    return collectionUser.get();
  }


  // Future<void> deleteUser(String userID, String nama, String nim) async{
  //   return await collectionUser.doc(userID).delete();
  // }
}