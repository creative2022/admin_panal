import 'package:admin_panal/logic/controllers/firestore_methods.dart';
import 'package:admin_panal/utils/my_string.dart';
import 'package:admin_panal/widgets/component.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Manage_CreativeScreen extends StatefulWidget {
  const Manage_CreativeScreen({Key? key}) : super(key: key);

  @override
  State<Manage_CreativeScreen> createState() => _Manage_CreativeScreenState();
}

class _Manage_CreativeScreenState extends State<Manage_CreativeScreen> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  String? name;
  String? gender;
  String? address;
  final controller = Get.put(FireStoreController());
  List users = [];

  CollectionReference usersref = FirebaseFirestore.instance.collection('users');

  getUsers() async {
    var val = await usersref.where("type", isEqualTo: "creative").get();
    val.docs.forEach((element) {
      setState(() {
        users.add(element.data());
      });
    });
  }

  @override
  void initState() {
    super.initState();
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
                    label: Text('الإسم'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text(' الجنس'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text('رقم الهاتف'),
                  ),
                  DataColumn2(
                    size: ColumnSize.M,
                    label: Text('العنوان'),
                    numeric: true,
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
                    users.length,
                    (i) => DataRow(cells: [
                          DataCell(Text("${i + 1}")),
                          DataCell(Text("${users[i]['uid']}")),
                          DataCell(Text("${users[i]['name']}")),
                          DataCell(Text("${users[i]['gender']}")),
                          DataCell(Text("${users[i]['phone']}")),
                          DataCell(Text("${users[i]['address']}")),
                          DataCell(
                              Container(
                                  width: 90,
                                  height: 70,
                                  child: Image.network(
                                    "${users[i]['photoUrl']}",
                                    fit: BoxFit.fill,
                                  )), onTap: () async {
                            var url = "${users[i]['photoUrl']}";
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
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            title: const Text(
                                                'تحديث بيانات الحرفي'),
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
                                                            "${users[i]['name']}",
                                                        obscureText: false,
                                                        validator: (Value) {
                                                          if (Value.toString()
                                                                  .length <=
                                                              3) {
                                                            return "يجب أن لا يقل الأسم عن 3 أحرف";
                                                          } else if (RegExp(
                                                                  validationName)
                                                              .hasMatch(
                                                                  Value)) {
                                                            return 'يجب أن لايحتوي الأسم على رقم او رمز';
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        prefixIcon: const Icon(
                                                            Icons.description),
                                                        suffixIcon: Text(""),
                                                        hintText: " الاسم ",
                                                        keyboardType:
                                                            TextInputType.text),
                                                    AuthTextFromField(
                                                        onsave: (value) {
                                                          gender = value;
                                                        },
                                                        val:
                                                            "${users[i]['gender']}",
                                                        obscureText: false,
                                                        validator: (Value) {
                                                          if (Value.length >
                                                              5) {
                                                            return "  لايمكن ان يكون الجنس اكبر من 5 أحرف";
                                                          }
                                                          if (Value.length <=
                                                              1) {
                                                            return "  لايمكن ان يكون الجنس اصغر من 3 أحرف";
                                                          }
                                                          return null;
                                                        },
                                                        prefixIcon: const Icon(
                                                          Icons.male,
                                                        ),
                                                        suffixIcon:
                                                            const Text(""),
                                                        hintText: "الجنس",
                                                        keyboardType:
                                                            TextInputType.text),
                                                    AuthTextFromField(
                                                        onsave: (value) {
                                                          address = value;
                                                        },
                                                        val:
                                                            "${users[i]['address']}",
                                                        obscureText: false,
                                                        validator: (Value) {
                                                          if (Value.length ==
                                                              0) {
                                                            return 'الرجاء إدخال العنوان  ';
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        prefixIcon: Icon(
                                                          Icons.location_city,
                                                        ),
                                                        suffixIcon: Text(""),
                                                        hintText: "العنوان",
                                                        keyboardType:
                                                            TextInputType
                                                                .number),
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
                                                                  'users')
                                                              .doc(
                                                                  "${users[i]['uid']}")
                                                              .update({
                                                            'name': name,
                                                            'gender': gender,
                                                            'address': address,
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
                                              )
                                            ]));
                              },
                              child: customText(context,
                                  text: 'تعديل',
                                  color: Colors.blueGrey,
                                  upperCase: false),
                            )
                          ])),
                          DataCell(Row(
                            children: [
                              Icon(Icons.block, color: Colors.red, size: 15),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    if ("${users[i]['blocked']}" == "yes") {
                                      AwesomeDialog(
                                        context: context,
                                        width: 500,
                                        dialogType: DialogType.QUESTION,
                                        animType: AnimType.SCALE,
                                        title: ' هل تريد إلغاء الحظر',
                                        desc:
                                            'إلغاء حظر المستخدم ${users[i]['name']}',
                                        btnCancelOnPress: () {
                                          Get.back();
                                        },
                                        btnOkOnPress: () async {
                                          await FirebaseFirestore.instance
                                              .collection('users')
                                              .doc("${users[i]['uid']}")
                                              .update({
                                            'blocked': "no",
                                          });
                                        },
                                      ).show();
                                    } else if ("${users[i]['blocked']}" ==
                                        "no") {
                                      AwesomeDialog(
                                        context: context,
                                        width: 500,
                                        dialogType: DialogType.QUESTION,
                                        animType: AnimType.SCALE,
                                        title: ' هل تريد تأكيد الحظر',
                                        desc:
                                            'حظر المستخدم ${users[i]['name']}',
                                        btnCancelOnPress: () {
                                          Get.back();
                                        },
                                        btnOkOnPress: () async {
                                          await FirebaseFirestore.instance
                                              .collection('users')
                                              .doc("${users[i]['uid']}")
                                              .update({
                                            'blocked': "yes",
                                          });
                                        },
                                      ).show();
                                    }
                                  },
                                  child: "${users[i]['blocked']}" == "no"
                                      ? Text("حظر الحساب")
                                      : Text("إلغاء الحظر")),
                            ],
                          )),
                        ]))),
          ),
        ),
      ),
    );
  }
}
