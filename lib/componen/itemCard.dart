
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/componen/alertDialog.dart';
import 'package:my_app/controller/editData.dart';
import 'package:my_app/screen/detailpage.dart';
import 'package:my_app/screen/editPage.dart';
import 'package:my_app/screen/profilepage.dart';

class ItemCard extends StatelessWidget {
  EditDataController eDC = EditDataController();
  String nama;
  String nim;
  String prodi;
  String fakultas;
  String documentIDargument;
  // final Function? onUpdate;
  Function? onDelete;
  ItemCard(this.nama, this.nim, this.prodi, this.fakultas, this.documentIDargument,{this.onDelete});


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 90,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.purple[100]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 7,),
                Text(nim,  style: TextStyle(fontSize: 16)),
                SizedBox(height: 7,),
                Text('$prodi - $fakultas', style: TextStyle(fontSize: 14),)
              ],
            ),
          ),
          Positioned(
            top: 18,
            right: 20,
            child: Container(
              child: Row(
                children: [
                  
                    Container(
                        height: 45,
                        width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: IconButton(
                      onPressed: (){
                        Get.to(EditPage(), arguments: documentIDargument);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: IconButton(                    
                      onPressed: (){     
                        // eDC.deleteData(documentIDargument);             
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text('Anda yakin ingin menghapus data?'),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                        RaisedButton(onPressed: (){
                          eDC.deleteData(documentIDargument);  
                          Get.back();
                        }, child: Text('Yes'), color: Colors.purple[200], shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        RaisedButton(onPressed: (){
                          Get.back();
                        }, child: Text('Cancel'), color: Colors.purple[200],  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                      ],
                    );;
                        }
                      );
                    }, icon: Icon(Icons.delete), iconSize: 30,)
                  )
                ],
              ),
            ),
          )
        ],
    );
  }
}

// class ShowDialog extends StatelessWidget {
//   EditDataController eDC = EditDataController();
//   final String? docId;
//   ShowDialog({this.docId});
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
