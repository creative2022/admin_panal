import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Manage_AdsScreen extends StatefulWidget {
  Manage_AdsScreen({Key? key}) : super(key: key);

  @override
  State<Manage_AdsScreen> createState() => _Manage_AdsScreenState();
}

class _Manage_AdsScreenState extends State<Manage_AdsScreen> {
  CollectionReference usersref = FirebaseFirestore.instance.collection('ads');
  List ads = [];
  List users = [];
  getAds() async {
    var val = await usersref.get();
    val.docs.forEach((element) {
      setState(() {
        ads.add(element.data());
      });
    });
  }

  getUsers() async {
    var val = await usersref.get();
    val.docs.forEach((element) {
      setState(() {
        users.add(element.data());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAds();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(50),
            child: DataTable2(
                columnSpacing: 20,
                horizontalMargin: 20,
                minWidth: 5,
                columns: const [
                  DataColumn2(
                    label: Text('الرقم'),
                    size: ColumnSize.L,
                  ),
                   DataColumn2(
                    label: Text('معرف الحساب'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('عنوان الاعلان '),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('الوصف'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    size: ColumnSize.M,
                    label: Text('الصورة'),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(''),
                    numeric: true,
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text(''),
                    numeric: true,
                  ),
                ],
                rows: List<DataRow>.generate(
                    ads.length,
                    (i) => DataRow(cells: [
                          DataCell(Text("${i + 1}")),
                          DataCell(Text("${ads[i]['uid']}")),
                          DataCell(Text("${ads[i]['title']}")),
                          DataCell(Text("${ads[i]['desc']}")),
                          DataCell(
                              Container(
                                  width: 90,
                                  height: 70,
                                  child: Image.network(
                                    "${ads[i]['url']}",
                                    fit: BoxFit.fill,
                                  )), onTap: () async {
                            var url = "${ads[i]['url']}";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              print('$url');
                            }
                          }),
                          DataCell(Row(
                            children: [
                              Icon(Icons.check, color: Colors.red, size: 15),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    if ("${ads[i]['statues']}" == "0") {
                                      AwesomeDialog(
                                        context: context,
                                        width: 500,
                                        dialogType: DialogType.QUESTION,
                                        animType: AnimType.SCALE,
                                        title: ' رسالةتأكيد هل تريد نشر الإعلان',
                                        btnCancelOnPress: () {
                                          Get.back();
                                        },
                                        btnOkOnPress: () async {
                                          await FirebaseFirestore.instance
                                              .collection('ads')
                                              .doc("${ads[i]['uid']}")
                                              .update({
                                            'statues': "1",
                                          });
                                        },
                                      ).show();
                                    }
                                  },
                                  child: Text(" نشر الإعلان"),)
                                     
                            ],
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.block, color: Colors.red, size: 15),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    if ("${ads[i]['statues']}" == "0"||"${ads[i]['statues']}" == "1") {
                                      AwesomeDialog(
                                        context: context,
                                        width: 500,
                                        dialogType: DialogType.QUESTION,
                                        animType: AnimType.SCALE,
                                        title: ' رسالةتأكيد هل تريد نشر الإعلان',
                                        btnCancelOnPress: () {
                                          Get.back();
                                        },
                                        btnOkOnPress: () async {
                                          await FirebaseFirestore.instance
                                              .collection('ads')
                                              .doc("${ads[i]['uid']}")
                                              .update({
                                            'statues': "2",
                                          });
                                        },
                                      ).show();
                                    }
                                  },
                                  child: Text(" رفض الإعلان"),)
                                     
                            ],
                          )),
                        ]))),
          ),
        ),
      ),
    );
  }
}
