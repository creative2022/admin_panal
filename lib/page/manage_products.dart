import 'package:admin_panal/logic/controllers/firestore_methods.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher_string.dart';

class Manage_ProductsScreen extends StatefulWidget {
  const Manage_ProductsScreen({Key? key}) : super(key: key);

  @override
  State<Manage_ProductsScreen> createState() => Manage_ProductsScreenState();
}

class Manage_ProductsScreenState extends State<Manage_ProductsScreen> {
  final TextEditingController prodctNameController = TextEditingController();

  final controller = Get.put(FireStoreController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 30.0, left: 40.0),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('product').snapshots(),
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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DataTable(
                    columnSpacing: 8,
                    border: TableBorder.all(color: Colors.black, width: 1),
                    columns: const [
                      DataColumn(
                        label: Text('الرقم'),
                      ),
                      DataColumn(
                        label: Text('معرف النتج'),
                      ),
                      DataColumn(
                        label: Text('اسم المنتج'),
                      ),
                      DataColumn(
                        label: Text('وصف المنتج'),
                      ),
                      DataColumn(
                        label: Text('السعر'),
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
                              DataCell(Text("${i + 1}")),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['postId']
                                  .toString())),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['postname']
                                  .toString())),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['description']
                                  .toString())),
                              DataCell(Text(snapshot.data!.docs[i]
                                  .data()['price']
                                  .toString())),
                              DataCell(
                                  Container(
                                      width: 90,
                                      height: 70,
                                      child: Image.network(
                                        snapshot.data!.docs[i].data()['postUrl'],
                                        fit: BoxFit.fill,
                                      )), onTap: () async {
                                var url =snapshot.data!.docs[i].data()['postUrl'].toString();
                                if (await canLaunchUrlString(url)) {
                                  await launchUrlString(url);
                                } else {
                                  print('$url');
                                }
                              }),
                              DataCell(Row(
                                children: [
                                  const Icon(Icons.delete,
                                      color: Colors.red, size: 15),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      String id = snapshot
                                          .data!.docs[i].data()["postId"].toString();
                                      String name = snapshot
                                          .data!.docs[i].data()["postname"];
                                      controller.deleteProduct(
                                          context, id, name);
                                    },
                                    child: const Text("حذف المنتج"),
                                  ),
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
