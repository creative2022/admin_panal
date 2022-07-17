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
                          DataCell(Row(children: [
                            const Icon(
                              Icons.edit,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title:
                                              const Text('تحديث بيانات المنتج'),
                                          content: Form(
                                            key: formstate,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AuthTextFromField(
                                                      onsave: (value) {
                                                        name = value;
                                                      },
                                                      val:
                                                          "${crafts[i]['postname']}",
                                                      obscureText: false,
                                                      validator: (Value) {
                                                        if (Value.toString()
                                                                .length <=
                                                            1) {
                                                          return "يجب أن لا يقل الأسم عن حرف";
                                                        } else if (RegExp(
                                                                validationName)
                                                            .hasMatch(Value)) {
                                                          return 'يجب أن لايحتوي الأسم على رقم او رمز';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      prefixIcon:
                                                         const Icon(Icons.edit_note),
                                                      suffixIcon: Text(""),
                                                      hintText: " أسم المنتج",
                                                      keyboardType:
                                                          TextInputType.text),
                                                  AuthTextFromField(
                                                      onsave: (value) {
                                                        desc = value;
                                                      },
                                                      val:
                                                          "${crafts[i]['description']}",
                                                      // controller:
                                                      //     productDescriptionController,
                                                      obscureText: false,
                                                      validator: (Value) {
                                                        if (Value.length > 50) {
                                                          return " الوصف لايمكن ان يكون اكبر من 50 حرف";
                                                        }
                                                        if (Value.length <= 1) {
                                                          return "الوصف  لايمكن ان يكون اصغر من حرف";
                                                        }
                                                        return null;
                                                      },
                                                      prefixIcon:const Icon(
                                                          Icons.description),
                                                      suffixIcon:const Text(""),
                                                      hintText: "وصف النتج ",
                                                      keyboardType:
                                                          TextInputType.text),
                                                  AuthTextFromField(
                                                      onsave: (value) {
                                                        price = value;
                                                      },
                                                      val:
                                                          "${crafts[i]['price']}",
                                                      // controller:
                                                      //     productPriceController,
                                                      obscureText: false,
                                                      validator: (Value) {
                                                        if (Value.length == 0) {
                                                          return 'الرجاء إدخال السعر  ';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      prefixIcon: Icon(
                                                          Icons.price_check),
                                                      suffixIcon: Text(""),
                                                      hintText: "السعر ",
                                                      keyboardType:
                                                          TextInputType.number),
                                                ]),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () async {
                                                if (formstate.currentState!
                                                    .validate()) {
                                                  {
                                                    try {
                                                      formstate.currentState!
                                                          .save();
                                                      if (formstate
                                                          .currentState!
                                                          .validate()) {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'product')
                                                            .doc(
                                                                "${crafts[i]['postId']}")
                                                            .update({
                                                          'postname': name,
                                                          'description': desc,
                                                          'price': price,
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    } catch (e) {
                                                      print(e);
                                                    }
                                                  }
                                                } else {
                                                  return null;
                                                }
                                              },
                                              child: const Text('تحديث'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('رجوع'),
                                            ),
                                          ],
                                        ));
                              },
                              child: customText(context,
                                  text: 'تعديل',
                                  color: Colors.blueGrey,
                                  upperCase: false),
                            )
                          ])),
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
