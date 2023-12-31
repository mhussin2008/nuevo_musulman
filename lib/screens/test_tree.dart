import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import '../data/new_dawa.dart';

List<Node> mytreenodes=<Node>[];

class test_tree extends StatefulWidget {
  const test_tree({super.key});

  @override
  State<test_tree> createState() => _test_treeState();
}

class _test_treeState extends State<test_tree> {

  @override
  Widget build(BuildContext context) {
    TreeViewController myTVC = TreeViewController(
      selectedKey: 'Header',
       children:  mytreenodes
    );

    return  Scaffold(
      appBar: AppBar(
        title: Text('Aprende sobre el Islam'),
      ),
      body: FutureBuilder(
        future: buildTree(),
        //initialData: ,
        builder:(context,snapshot){
          return Center(
              child: mytreenodes.isNotEmpty? TreeView(controller: myTVC,
              ):Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.cyan,
              )
          );

        } ));
       }





  Future<List<Node>> buildTree() async {
    if(mytreenodes.isNotEmpty){return <Node>[];}
    try {
      var data = await DefaultAssetBundle.of(context)
          .loadString("assets/text/Newdawafinal.json");

      final dynamic parsedJson = await json.decode(data);

      print(parsedJson);
      mytreenodes.addAll(toTreeNodes(parsedJson));
      //customNodes.addAll(iterable)
      return mytreenodes  ;
    } on FormatException catch (e) {
      return [Node(key: '$e',label: 'error $e')];
    }
  }

  List<Node> toTreeNodes(dynamic parsedJson) {
    if (parsedJson is Map<String, dynamic>) {
      return parsedJson.keys
          .map((k) => Node( key: '$k',
                   label: '$k:', children: toTreeNodes(parsedJson[k]),),)
          .toList();
    }
    if (parsedJson is List<dynamic>) {
      return parsedJson
          .asMap()
          .map((i, dynamic element) => MapEntry(i,
               Node(key: '$i',label: '[$i]:'  , children: toTreeNodes(element))
      )
      ).values.toList();
    }
    return [Node(key: '',label: parsedJson.toString())];
  }

}
