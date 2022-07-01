import 'package:admin_panal/widgets/component.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class Manage_UserScreen extends StatelessWidget {
  const Manage_UserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding:  EdgeInsets.all(250),
            child: datatable(),
          ),
        ),
      ),
    );
  }
}

class datatable extends StatelessWidget {
  const datatable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        columnSpacing: 10,
        horizontalMargin: 20,
        minWidth: 20,
        columns: const [
          DataColumn2(
            label: Text('Id'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('FirstName'),
            size: ColumnSize.L,
          ),
          DataColumn2(label: Text('LastName'), size: ColumnSize.M),
          DataColumn2(
            size: ColumnSize.L,
            label: Text('Email'),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Text('PhoneNumber'),
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Text('Password'),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            label: Text('Photo'),
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
          DataColumn(
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
                          text: 'Edit',
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
                        child: Text("Delete"),
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
                        child: Text("Block"),
                      ),
                    ],
                  )),
                ])));
  }
}
