import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditDataController extends GetxController{
   TextEditingController namaC = TextEditingController();
   TextEditingController nimC = TextEditingController();
   TextEditingController prodiC = TextEditingController();
   TextEditingController hpC = TextEditingController();
   TextEditingController fakultasC = TextEditingController();
   TextEditingController emailC = TextEditingController();
   TextEditingController periodeC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async{
    DocumentReference docRef = firestore.collection('users').doc(docID);
    return docRef.get();
  }

  void editData(String nama, String nim, String prodi, String fakultas, String noHp, String email,String periode, String docID) async{
    DocumentReference docData = firestore.collection('users').doc(docID);
    try{
      await docData.update({
        'nama' : nama,
        'nim' : nim
      });
      Get.defaultDialog(
        title: 'Berhasil',
        middleText: 'Berhasil mengubah data',
        onConfirm: (){
          namaC.clear();
          nimC.clear();
          prodiC.clear();
          fakultasC.clear();
          hpC.clear();
          emailC.clear();
          periodeC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: 'Ok'
      );
    } catch(e){
      print('eror');
    }
  }
  void deleteData(String docID) async{
    DocumentReference docRef = firestore.collection('users').doc(docID);
    try{
      await docRef.delete();
    } catch (e) {
      print(e);
      
    }
    
  }
}