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
