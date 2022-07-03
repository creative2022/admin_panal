import 'package:admin_panal/widgets/component.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class Manage_UserScreen extends StatelessWidget {
  const Manage_UserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.all(200),
            child: DataTable2( columnSpacing: 5,
        horizontalMargin: 5,
        minWidth: 5,
        columns: const [
          DataColumn2(
            label: Text('معرف الحساب'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('الإسم'),
            size: ColumnSize.L,
          ),
          DataColumn2(label: Text('اللقب'), size: ColumnSize.M),
          DataColumn2(
            size: ColumnSize.M,
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
            10,
            (index) => DataRow(cells: [
                  DataCell(Text('A')),
                  DataCell(Text('B')),
                  DataCell(Text('C')),
                  DataCell(Text('D')),
                  DataCell(Text('E')),
                  DataCell(Text('F')),
                  DataCell(Text("G")),
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

