import 'package:admin_panal/logic/controllers/firestore_methods.dart';
import 'package:admin_panal/main.dart';
import 'package:admin_panal/routes/routes.dart';
import 'package:admin_panal/widgets/component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Manage_ProductsScreen extends StatefulWidget {
  const Manage_ProductsScreen({Key? key}) : super(key: key);

  @override
  State<Manage_ProductsScreen> createState() => _Manage_ProductsScreenState();
}

class _Manage_ProductsScreenState extends State<Manage_ProductsScreen> {
  final controller = Get.put(FireStoreController());
  List crafts = [];

  CollectionReference usersref =
      FirebaseFirestore.instance.collection('product');

  getData() async {
    var val = await usersref.get();
    val.docs.forEach((element) {
      setState(() {
        crafts.add(element.data());
      });
    });
  }
  @override
  void initState() {
    getData();
    super.initState();
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
                horizontalMargin: 5,
                minWidth: 5,
                columns: const [
                  DataColumn2(
                    label: Text('الرقم'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('معرف المنتج'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('اسم المنتج'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text('وصف المنتج'),
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text('السعر'),
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
                  DataColumn(
                    label: Text(''),
                    numeric: true,
                  ),
                ],
                rows: List<DataRow>.generate(
                    crafts.length,
                    (i) => DataRow(cells: [
                          DataCell(Text("${i + 1}")),
                          DataCell(Text("${crafts[i]['postId']}")),
                          DataCell(Text("${crafts[i]['postname']}")),
                          DataCell(Text("${crafts[i]['description']}")),
                          DataCell(Text("${crafts[i]['price']}")),
                          DataCell(
                              Container(
                                  width: 90,
                                  height: 70,
                                  child: Image.network(
                                    "${crafts[i]['postUrl']}",
                                    fit: BoxFit.fill,
                                  )), onTap: () async {
                            var url = "${crafts[i]['postUrl']}";
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              print('$url');
                            }
                          }),
                          DataCell(Row(children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            InkWell(
                              onTap: () {},
                              child: customText(context,
                                  text: 'تعديل',
                                  color: Colors.blueGrey,
                                  upperCase: false),
                            )
                          ])),
                          DataCell(Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.deleteProduct(
                                      context,
                                      "${crafts[i]['postId']}",
                                      "${crafts[i]['postname']}");
                                  setState(() {
                                    initState;
                                  });
                                },
                                child: Text("حذف المنتج"),
                              ),
                            ],
                          )),
                        ]))),
          ),
        ),
      ),
    );
  }
}
