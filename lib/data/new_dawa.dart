import 'package:flutter_treeview/flutter_treeview.dart';
List<Node> nodes=<Node>[];

class mydata {
  String? sectionName;
  String? sectionType;
  List<Topics>? topics;

  mydata({this.sectionName, this.sectionType, this.topics});

  mydata.fromJson(Map<String, dynamic> json) {
    sectionName = json['sectionName'];
    sectionType = json['sectionType'];
    List<Node> tempNodes=<Node>[];

    if (json['topics'] != null) {
      topics = <Topics>[];
      json['topics'].forEach((v) {
        //print('high loop');
        topics!.add(Topics.fromJson(v));
        tempNodes.add(Node(
            key: v['header'],
            label: v['header']
        ));
        //print('hello there');
      });

      nodes.add(Node(
          key: sectionName!,
          label:sectionName!,
          children: tempNodes

      ));

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionName'] = this.sectionName;
    data['sectionType'] = this.sectionType;
    if (this.topics != null) {
      data['topics'] = this.topics!.map((v) {
        //print('lower loop');
        return v.toJson();
      }).toList();
    }else {
      print('lower loop null');}
    return data;
  }
}

class Topics {
  String? header;
  List<NestedTopics>? nestedTopics;

  Topics({this.header, this.nestedTopics});

  Topics.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    //print('header');
    if (json['nestedTopics'] != null) {
      //print('nested topics start');
      //print(json['nestedTopics']);

      nestedTopics = <NestedTopics>[];
      json['nestedTopics'].forEach((v) {
        //print('from inside');
        nestedTopics!.add(NestedTopics.fromJson(v));
      });
    }else{print('null nestedTopics');}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    if (this.nestedTopics != null) {
      data['nestedTopics'] = this.nestedTopics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NestedTopics {
  String? title;
  String? body;
  String? header;
  List<NestedTopics2>? nestedTopics;

  NestedTopics({this.title, this.body, this.header, this.nestedTopics});

  NestedTopics.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    header = json['header'];
    if (json['nestedTopics'] != null) {
      nestedTopics = <NestedTopics2>[];
      json['nestedTopics'].forEach((v) {
        nestedTopics!.add( NestedTopics2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['header'] = this.header;
    if (this.nestedTopics != null) {
      data['nestedTopics'] = this.nestedTopics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NestedTopics2 {
  String? title;
  String? body;

  NestedTopics2({this.title, this.body});

  NestedTopics2.fromJson(Map<String, dynamic> json) {
    print('final ok');
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}





// class mydata {
//   String? sectionName;
//   String? sectionType;
//   List<Topics>? topics;
//
//   mydata({this.sectionName, this.sectionType, this.topics});
//
//   mydata.fromJson(Map<String, dynamic> json) {
//     sectionName = json['sectionName'];
//     sectionType = json['sectionType'];
//     if (json['topics'] != null) {
//       topics = <Topics>[];
//       json['topics'].forEach((v) {
//         print('high loop');
//         topics!.add(Topics.fromJson(v));
//         print('hello there');
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['sectionName'] = this.sectionName;
//     data['sectionType'] = this.sectionType;
//     if (this.topics != null) {
//       data['topics'] = this.topics!.map((v) {
//         print('lower loop');
//         return v.toJson();
//       }).toList();
//     }else {
//       print('lower loop null');}
//     return data;
//   }
// }
//
// class Topics {
//   String? header;
//   List<NestedTopics>? nestedTopics;
//
//   Topics({this.header, this.nestedTopics});
//
//   Topics.fromJson(Map<String, dynamic> json) {
//     header = json['header'];
//     print('header');
//     if (json['nestedTopics'] != null) {
//       print('nested topics start');
//       print(json['nestedTopics']);
//
//       nestedTopics = <NestedTopics>[];
//       json['nestedTopics'].forEach((v) {
//         print('from inside');
//         nestedTopics!.add(NestedTopics.fromJson(v));
//       });
//     }else{print('null nestedTopics');}
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['header'] = this.header;
//     if (this.nestedTopics != null) {
//       data['nestedTopics'] = this.nestedTopics!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class NestedTopics {
//   String? title;
//   String? body;
//   String? header;
//   List<NestedTopics2>? nestedTopics;
//
//   NestedTopics({this.title, this.body, this.header, this.nestedTopics});
//
//   NestedTopics.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     body = json['body'];
//     header = json['header'];
//     if (json['nestedTopics'] != null) {
//       nestedTopics = <NestedTopics2>[];
//       json['nestedTopics'].forEach((v) {
//         nestedTopics!.add( NestedTopics2.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['body'] = this.body;
//     data['header'] = this.header;
//     if (this.nestedTopics != null) {
//       data['nestedTopics'] = this.nestedTopics!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class NestedTopics2 {
//   String? title;
//   String? body;
//
//   NestedTopics2({this.title, this.body});
//
//   NestedTopics2.fromJson(Map<String, dynamic> json) {
//     print('final ok');
//     title = json['title'];
//     body = json['body'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['body'] = this.body;
//     return data;
//   }
// }