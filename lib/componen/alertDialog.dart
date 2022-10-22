// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';

// class ShowDialog extends StatelessWidget {
//   final Function? onDelete;
//   ShowDialog({this.onDelete});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Text('Anda yakin ingin menghapus data?'),
//       actionsAlignment: MainAxisAlignment.spaceEvenly,
//       actions: [
//         RaisedButton(onPressed: {onDelete}, child: Text('Yes'), color: Colors.purple[200], shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
//         RaisedButton(onPressed: (){
//           Get.back();
//         }, child: Text('Cancel'), color: Colors.purple[200],  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
//       ],
//     );
//   }
// }