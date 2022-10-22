import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_app/controller/editData.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  
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
  
  EditDataController eDC = EditDataController();
  

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
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(17))),
                      height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Edit Data Mahasiswa',
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
                            controller: eDC.namaC,
                            decoration:
                                InputDecoration(labelText: 'Nama Lengkap'),
                          ),
                          TextField(
                            controller: eDC.nimC,
                            decoration: InputDecoration(labelText: 'NIM'),
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
                            decoration: InputDecoration(labelText: 'Prodi'),
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
                            decoration: InputDecoration(labelText: 'Fakultas'),
                          ),
                          TextField(
                            controller: eDC.hpC,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flag_circle),
                                prefixText: '+62 ',
                                labelText: 'Nomor Handphone'),
                          ),
                          TextField(
                            controller: eDC.emailC,
                            decoration:
                                InputDecoration(labelText: 'Alamat Email'),
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
                            decoration: InputDecoration(labelText: 'Periode'),
                          ),
                          
                          ElevatedButton(
                            onPressed: () {
                             eDC.editData(eDC.namaC.text, eDC.nimC.text, eDC.prodiC.text, eDC.fakultasC.text, eDC.hpC.text, eDC.emailC.text, eDC.periodeC.text, Get.arguments);
                            Get.back();
                            },
                            child: Text('Edit'),
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
          );
            }
            return Center(child: CircularProgressIndicator());
          },
          
        ),
      ),
    );
  }
}