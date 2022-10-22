
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/componen/database_services.dart';
import 'package:my_app/componen/itemCard.dart';
import 'package:my_app/controller/editData.dart';
import 'package:my_app/screen/detailpage.dart';
import 'package:my_app/screen/profilepage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EditDataController eDC = EditDataController();
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionUser = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text("Data Mahasiswa"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Get.to(ProfilePage());
        },
        child: Text('Add Data',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16)),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shadowColor: Colors.purpleAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          fixedSize: Size(130, 40),
        ),
      ),
      body: Container(
          margin: EdgeInsets.all(8),
          child: StreamBuilder<QuerySnapshot>(
            stream: users,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(DetailPage(), arguments: snapshot.data!.docs[index].id);
                    },
                    child: ItemCard(
                        data.docs[index]['nama'],
                        data.docs[index]['nim'].toString(),
                        data.docs[index]['prodi'],
                        data.docs[index]['fakultas'],
                        snapshot.data!.docs[index].id,
                        onDelete: (){
                           eDC.deleteData(snapshot.data!.docs[index].id);
                        },
                      
                    ),
                  );
                },
              );
            },
          )

          ///
          // child: ListView(
          //   children: [
          //     Container(
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(17),
          //             topRight: Radius.circular(17)),
          //         color: Colors.grey[400],
          //       ),
          //       height: 50,
          //       child: Text(
          //         'Data Mahasiswa',
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ),
          // StreamBuilder(
          //   stream: doc.snapshots(),
          //   builder: (_, snaphot){
          //     if(snaphot.hasData){
          //       return Column(
          //         children: snaphot.data.doc.map({})
          //       )
          //     }else{

          //     }
          //   },
          // )

          ),
    );
  }
}
