import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Manage_UserScreen extends StatefulWidget {
  Manage_UserScreen({Key? key}) : super(key: key);

  @override
  State<Manage_UserScreen>  createState() => _Manage_UserScreenState();
  
  
}

class _Manage_UserScreenState extends State<Manage_UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0,right: 30.0,left: 40.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where("type", isEqualTo: "user")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, i) => Material(
      
          child:  Directionality(
            textDirection: TextDirection.rtl,
              child: DataTable(
                columnSpacing: 8,
                border: TableBorder.all(color:Colors.black,width: 1),
                    columns: const [
                        DataColumn(
                        label: Text('الرقم'),
                      ),
                      DataColumn(
                        label: Text('معرف الحساب'),
                      ),
                      DataColumn(
                        label: Text('الإسم'),
                      ),
                      DataColumn(
                        label: Text('الإيميل'),
                      ),
                      DataColumn(
                        label: Text('كلمة المرور'),
                      ),
                      DataColumn(
                        label: Text('الصورة'),
                      ),
                      DataColumn(
                        label: Text(''),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        snapshot.data!.docs.length,
                        (i) => DataRow(cells: [
                           DataCell(Text("${i+1}")), 
                              DataCell(Text(
                                  snapshot.data!.docs[i].data()['uid'].toString())),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['name']
                                  .toString())),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['email']
                                  .toString())),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['password']
                                  .toString())),
                              DataCell(
                                  Container(
                                      width: 90,
                                      height: 70,
                                      child: Image.network(
                                        snapshot.data!.docs[i].data()['photoUrl'],
                                        fit: BoxFit.fill,
                                      )), onTap: () async {
                                var url =snapshot.data!.docs[i].data()['photoUrl'].toString();
                                if (await canLaunchUrlString(url)) {
                                  await launchUrlString(url);
                                } else {
                                  print('$url');
                                }
                              }),
                               DataCell(Row(
                              children: [
                                Icon(Icons.block, color: Colors.red, size: 15),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                    onTap: () {
                                      if ( snapshot.data!.docs[i].data()['blocked'].toString() == "yes") {
                                        AwesomeDialog(
                                          context: context,
                                          width: 500,
                                          dialogType: DialogType.QUESTION,
                                          animType: AnimType.SCALE,
                                          title: ' هل تريد إلغاء الحظر',
                                          desc:
                                              'إلغاء حظر المستخدم'+ snapshot.data!.docs[i].data()['name'].toString(),
                                          btnCancelOnPress: () {
                                            Get.back();
                                          },
                                          btnOkOnPress: () async {
                                            await FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(snapshot.data!.docs[i].data()['uid'].toString())
                                                .update({
                                              'blocked': "no",
                                            });
                                          },
                                        ).show();
                                      } else if (snapshot.data!.docs[i].data()['blocked'].toString() ==
                                          "no") {
                                        AwesomeDialog(
                                          context: context,
                                          width: 500,
                                          dialogType: DialogType.QUESTION,
                                          animType: AnimType.SCALE,
                                          title: ' هل تريد تأكيد الحظر',
                                          desc:
                                              'حظر المستخدم '+snapshot.data!.docs[i].data()['name'].toString(),
                                          btnCancelOnPress: () {
                                            Get.back();
                                          },
                                          btnOkOnPress: () async {
                                            await FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(snapshot.data!.docs[i].data()['uid'].toString())
                                                .update({
                                              'blocked': "yes",
                                            });
                                          },
                                        ).show();
                                      }
                                    },
                                    child: snapshot.data!.docs[i].data()['blocked'].toString() == "no"
                                        ? Text("حظر الحساب")
                                        : Text("إلغاء الحظر")),
                              ],
                            )),
                            ]))),
              ),
            ),
          );
        },
      ),
    );
  }
}
