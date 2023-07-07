import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuevo_musulman/data/new_dawa.dart';

var data;
var jsonResult;

class non_moslem extends StatefulWidget {
  const non_moslem({super.key});

  @override
  State<non_moslem> createState() => _non_moslemState();
}

class _non_moslemState extends State<non_moslem> {
  @override
  void initState() {
    // TODO: implement initState
    // mymethod().then((result) {
    //   print("result: $result");
    //   setState(() {});
    // });

    super.initState();
  }

  Future<dynamic> mymethod() async {
    data = await DefaultAssetBundle.of(context)
        .loadString("assets/text/Newdawafinal.json");

    jsonResult = await jsonDecode(data); //latest Dart
    mydata getdata=await mydata.fromJson(jsonResult[0]);

    print(getdata.topics.toString());

   // print(getdata.sectionName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () async {
              await mymethod();
              //print(jsonResult[1]);
            },
            child: Text('Print'),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'))
        ]),
      ),
    );
  }
}
