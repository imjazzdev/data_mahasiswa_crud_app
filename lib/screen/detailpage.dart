
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/editData.dart';

class DetailPage extends StatelessWidget {
  EditDataController eDC = EditDataController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: eDC.getData(Get.arguments),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              var data = snapshot.data!.data() as Map<String, dynamic>;
              eDC.namaC.text = data['nama'];
              eDC.nimC.text = data['nim'].toString();
              eDC.prodiC.text = data['prodi'];
              eDC.fakultasC.text = data['fakultas'];
              eDC.hpC.text = data['noHp'];
              eDC.emailC.text = data['email'];
              eDC.periodeC.text = data['periode'];
              
              return ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17))),
                      height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Detail Data Mahasiswa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          
                                      Container(
                                        height: 180,
                                        width: 180,
                                        margin: EdgeInsets.only(top: 15),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(width: 5)),
                                        child: Icon(Icons.person, size: 150,)
                                      ),
                          TextField(
                            readOnly: true,
                            controller: eDC.namaC,
                            decoration:
                                InputDecoration(labelText: 'Nama Lengkap', fillColor: Colors.purple),
                          ),
                          TextField(
                            readOnly: true,
                            controller: eDC.nimC,
                            decoration: InputDecoration(labelText: 'NIM', fillColor: Colors.purple),
                          ),
                          TextField(
                            readOnly: true,
                            controller: eDC.prodiC,
                            decoration:
                                InputDecoration(labelText: 'Prodi', fillColor: Colors.purple),
                          ),
                          TextField(
                            readOnly: true,
                            controller: eDC.fakultasC,
                            decoration: InputDecoration(labelText: 'Fakultas', fillColor: Colors.purple),
                          ),
                          
                          TextField(
                            controller: eDC.hpC,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flag_circle),
                                prefixText: '+62 ',
                                labelText: 'Nomor Handphone', fillColor: Colors.purple),
                          ),
                          TextField(
                            readOnly: true,
                            controller: eDC.emailC,
                            decoration:
                                InputDecoration(labelText: 'Alamat Email', fillColor: Colors.purple),
                          ),
                          TextField(
                            readOnly: true,
                            controller: eDC.periodeC,
                            decoration:
                                InputDecoration(labelText: 'Periode', fillColor: Colors.purple),
                          ),
                          // GestureDetector(
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     child: Text(
                          //       'Simpan',
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     ),
                          //     height: 35,
                          //     width: 180,
                          //     decoration: BoxDecoration(
                          //         color: Colors.grey[400],
                          //         borderRadius: BorderRadius.circular(19)),
                          //   ),
                          // ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
            }
            return Center(child: CircularProgressIndicator());
          },
          
        ),
      ),
      
    );
  }
}

