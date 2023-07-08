import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:nuevo_musulman/data/new_dawa.dart';

import 'SimpleTreeView.dart';

var data;
var jsonResult;
List<mydata> mydataList=<mydata>[];

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
    print(jsonResult.length);
    jsonResult.forEach((v) async{
      mydata getdata=await mydata.fromJson(jsonResult[0]);
      mydataList.add(getdata);
    });

    // var registry = JsonWidgetRegistry.instance;
    // registry.setValue('key', 'value');
    print('/////////');
    //print(getdata.topics.toString());

   // print(getdata.sectionName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprende sobre el Islam'),
      ),
      body: Center(
        child: SimpleTreeView()
        // Column(children: [
        //   ElevatedButton(
        //     onPressed: () async {
        //       await mymethod();
        //       //print(jsonResult[1]);
        //     },
        //     child: Text('Print'),
        //   ),
        //   SizedBox(
        //     height: 20,
        //   ),
        //   ElevatedButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       child: Text('Go back')),
        //   SizedBox(height: 10,),
        //   SimpleTreeView()
        // ]),
      ),
    );
  }
}
