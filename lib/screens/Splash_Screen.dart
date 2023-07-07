import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuevo_musulman/screens/route_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});
  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => route_screen()))

    );


    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Image.asset('assets/images/elmensajo.jpg'),
      )
       
    );
  }
}
