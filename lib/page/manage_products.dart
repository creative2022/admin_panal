import 'package:admin_panal/logic/controllers/firestore_methods.dart';
import 'package:admin_panal/utils/my_string.dart';
import 'package:admin_panal/widgets/component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
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

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  final controller = Get.put(FireStoreController());

  String? name;
  String? desc;
  String? price;

  final List crafts = [];

  CollectionReference productref =
      FirebaseFirestore.instance.collection('product');

  getData() async {
    var val = await productref.get();
    for (var element in val.docs) {
      setState(() {
        crafts.add(element.data());
      });
    }
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
            padding: const EdgeInsets.all(50),
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
                              SizedBox(
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
                              print(url);
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
                                  controller.deleteProduct(
                                      context,
                                      "${crafts[i]['postId']}",
                                      "${crafts[i]['postname']}");
                                  setState(() {
                                    initState;
                                  });
                                },
                                child: const Text("حذف المنتج"),
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
