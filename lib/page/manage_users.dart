import 'package:admin_panal/widgets/component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Manage_UserScreen extends StatefulWidget {
  const Manage_UserScreen({Key? key}) : super(key: key);

  @override
  State<Manage_UserScreen> createState() => _Manage_UserScreenState();
}

class _Manage_UserScreenState extends State<Manage_UserScreen> {
  List users = [];

  CollectionReference usersref = FirebaseFirestore.instance.collection('users');

  gerData() async {
    var val = await usersref.get();
    val.docs.forEach((element) {
      setState(() {
        users.add(element.data());
      });
    });
  }

  @override
  void initState() {
    gerData();
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
                    label: Text(' اللقب'),
                    size: ColumnSize.L,
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text('الإيميل'),
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text('رقم الهاتف'),
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
                    label: Text('كلمة المرور'),
                    numeric: true,
                  ),
                  DataColumn2(
                    size: ColumnSize.L,
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
                          DataCell(Text("${users[i]['firstname']}")),
                          DataCell(Text("${users[i]['lastname']}")),
                          DataCell(Text("${users[i]['email']}")),
                          DataCell(Text("${users[i]['phone']}")),
                          DataCell(Text("${users[i]['password']}")),
                          DataCell(Container(width: 70,height: 70,
                            child: Image.network("${users[i]['photoUrl']}",fit: BoxFit.fill,)),
                              onTap: () async {
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
                                  deleteConfirmation(context,
                                      text1: "", function: () {});
                                },
                                child: Text("حذف"),
                              ),
                            ],
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.block, color: Colors.red, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  blockConfirmation(context,
                                      text1: "", function: () {});
                                },
                                child: Text("حظر الحساب"),
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
