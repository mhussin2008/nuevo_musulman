import 'dart:convert';

import 'package:cupertino_icons/cupertino_icons.dart';
import'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import '../data/new_dawa.dart';






class SimpleTreeView extends StatefulWidget {
  const SimpleTreeView({super.key});

  @override
  State<SimpleTreeView> createState() => _SimpleTreeViewState();
}

class _SimpleTreeViewState extends State<SimpleTreeView> {
  var selkey='docs';

  var data;
  var jsonResult;

  List<mydata> mydataList=<mydata>[];

  Future<dynamic> mymethod() async {
    data = await DefaultAssetBundle.of(context)
        .loadString("assets/text/Newdawafinal.json");

    jsonResult = await jsonDecode(data); //latest Dart
    print(jsonResult.length);
    jsonResult.forEach((v) async{
      //mydataList.add(v);
      mydata getdata=await mydata.fromJson(v);
      mydataList.add(getdata);

    });}




  void initState() {
    // TODO: implement initState
  // nodes.add(
  //     Node(
  //   label: 'documents',
  //   key: 'docs',
  //   expanded: true,
  //   icon: Icons.folder_open ,
  //       children: [
  //         Node(key: 'FirstDoc', label: 'FirstDocLabel',expanded: true,children: [
  //           Node(key: 'Second Doc', label: 'Second Doc Label')
  //         ])
  //       ]
  //
  // ));
      mymethod().then((value) {
        print(value);
        return null;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    TreeViewController TVC=TreeViewController(
      children: nodes,
      selectedKey: selkey
    );
    return

    TreeView(
        controller: TVC);



  }
}
