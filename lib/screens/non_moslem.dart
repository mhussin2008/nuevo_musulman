import 'dart:convert';

import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
//import 'package:test_jsonwork/data/StorageClass.dart';
import '../data/new_dawa.dart';

List<Node<dynamic>> mynodes = <Node>[];

class non_moslem extends StatefulWidget {
  const non_moslem({super.key});

  @override
  State<non_moslem> createState() => _non_moslemState();
}

class _non_moslemState extends State<non_moslem> {
  var selkey = 'docs';

  @override
  void initState() {
    // TODO: implement initState
    //dataLoad().then((_) => print('done'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TreeViewController TVC =
    TreeViewController(children: mynodes, selectedKey: selkey);

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('encuentra la verdad'),

      ),
      body: Center(

        child: FutureBuilder(
          future: dataLoad(),
          builder: (ctx, snapshot) {
            return  (mynodes.isNotEmpty)? TreeView(
              controller: TVC
              ,shrinkWrap: true,):
            Container(height: double.infinity,width: double.infinity,color: Colors.cyan,);

          },

        ),

      ),

    );

  }

  Future<void> dataLoad() async {
    if (mynodes.isNotEmpty){return;}
    final String response =
    await rootBundle.loadString('assets/text/Newdawafinal.json');
    List<dynamic> data = await json.decode(response);
    List<mainHeader> myHeaders = <mainHeader>[];
    print(data.length);
    data.forEach((element) {
      myHeaders.add(mainHeader.fromJson(element));
    });

    //print(myHeaders[0].topics![0].nestedTopics![7].nestedTopicsB![2].title);
    myHeaders.forEach((element) {
      List<Node> tempNodes = <Node>[];
      List<Node> tempNodes2 = <Node>[];
      List<Node> tempNodes3 = <Node>[];


      if (element.sectionName != null) {
        element.topics!.forEach((subelement) {
          print(subelement.header);
          //tempNodes2.add(Node(key: 'ggg',label: 'gggg'));
          if(subelement.nestedTopics!.isNotEmpty) {
            subelement.nestedTopics!.forEach((subsubelement) {
              if(subsubelement.title != null ){

                tempNodes2.add(Node(
                    key: subsubelement.title!,
                    label: subsubelement.title!,
                    children: [Node(
                      key: subsubelement.body!,
                      label: subsubelement.body!,
                    )]));
              }
              else if(subsubelement.header != null) {

                for(int i=0;i<subsubelement.nestedTopicsB!.length;i++){
                  tempNodes3.add(Node(
                      key: subsubelement.nestedTopicsB![i].title!
                      ,label: subsubelement.nestedTopicsB![i].title! ,
                      children: [ Node(key: subsubelement.nestedTopicsB![i].body! ,
                          label: subsubelement.nestedTopicsB![i].body! )]));}

                tempNodes2.add(Node(
                    key: subsubelement.header!,
                    label: subsubelement.header!,
                    children: tempNodes3
                ));
              }
            });

            tempNodes.add(
                Node(key: subelement.header!, label: subelement.header!,children: tempNodes2));
            //tempNodes2.clear();
          }});
        print(tempNodes);
        mynodes
            .add(Node(key: element.sectionName!, label: element.sectionName!,children: tempNodes));
        //tempNodes.clear();
      }
    });


  }}
