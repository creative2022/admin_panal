import 'package:flutter/material.dart';

class ReprtsScreen extends StatelessWidget {
  const ReprtsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget analyticWidget(name) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 192, 210, 224),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Total $name",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("3"),
                  Icon(Icons.show_chart),
                ],
              )
            ]),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              analyticWidget("users"),
              analyticWidget("prodect"),
              analyticWidget("ads"),
            ],
          ),
        ],
      ),
    );
  }
}
