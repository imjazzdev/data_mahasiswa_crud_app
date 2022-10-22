import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firestore = FirebaseFirestore.instance.collection('users');

  TextEditingController namecontroller = TextEditingController();
  TextEditingController nimcontroller = TextEditingController();
  TextEditingController hpcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  final List<String> itemProdiList = [
    'Teknik Informatika',
    'Teknik Elektro',
    'Teknik Mesin'
  ];
  final itemFakultasList = ['Ilmu Komputer', 'Hukum', 'Ekonomi'];
  final itemSemesterList = [
    'Semester Ganjil - 2019',
    'Semester Genap - 2019',
    'Semester Ganjil - 2018',
    'Semester Genap - 2018',
    'Semester Ganjil - 2017',
    'Semester Genap - 2017'
  ];
  String selectedProdi = "";
  String? selectedFakultas = "";
  String? selectedSemester = "";
  
  
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedProdi = itemProdiList[0];
    selectedFakultas = itemFakultasList[0];
    selectedSemester = itemSemesterList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                        color: Colors.purple,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(17),
                            topRight: Radius.circular(17))),
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Input Data Mahasiswa',
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
                          controller: namecontroller,
                          decoration:
                              InputDecoration(labelText: 'Nama Lengkap', fillColor: Colors.purple),
                        ),
                        TextField(
                          controller: nimcontroller,
                          decoration: InputDecoration(labelText: 'NIM', fillColor: Colors.purple),
                        ),
                        DropdownButtonFormField(
                          value: selectedProdi,
                          items: itemProdiList
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedProdi = val as String;
                            });
                          },
                          decoration: InputDecoration(labelText: 'Prodi', fillColor: Colors.purple),
                        ),
                        DropdownButtonFormField(
                          value: selectedFakultas,
                          items: itemFakultasList
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedFakultas = val as String;
                            });
                          },
                          decoration: InputDecoration(labelText: 'Fakultas', fillColor: Colors.purple),
                        ),
                        TextField(
                          controller: hpcontroller,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.flag_circle),
                              prefixText: '+62 ',
                              labelText: 'Nomor Handphone', fillColor: Colors.purple),
                        ),
                        TextField(
                          controller: emailcontroller,
                          decoration:
                              InputDecoration(labelText: 'Alamat Email', fillColor: Colors.purple),
                        ),
                        DropdownButtonFormField(
                          value: selectedSemester,
                          items: itemSemesterList
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedSemester = val as String;
                            });
                          },
                          decoration: InputDecoration(labelText: 'Periode', fillColor: Colors.purple),
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
                        ElevatedButton(
                          onPressed: () {
                            
                            firestore.add({
                              'nama': namecontroller.text,
                              'nim': int.tryParse(nimcontroller.text) ?? 0,
                              'prodi': selectedProdi,
                              'fakultas': selectedFakultas,
                              'noHp': hpcontroller.text,
                              'email': emailcontroller.text,
                              'periode': selectedSemester,
                            });

                            namecontroller.text = '';
                            nimcontroller.text = '';
                            selectedProdi = itemProdiList[0];
                            selectedFakultas = itemFakultasList[0];
                            hpcontroller.text = '';
                            emailcontroller.text = '';
                            selectedSemester = itemSemesterList[0];

                          Get.back();
                          },
                          child: Text('Simpan'),
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.purple.shade400),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Future createUser({required String nama}) async{
  //   final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
  // }
}

