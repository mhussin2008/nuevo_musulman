import 'package:flutter/material.dart';
import 'package:nuevo_musulman/screens/non_moslem.dart';

class route_screen extends StatelessWidget {
   route_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
            child: Text('El mensaje Eterno')),),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => non_moslem()));

                },
                    child: Text('encuentra la verdad')),
                Expanded(child: Image.asset('assets/images/fa_man_yashrah.jpg')),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){},
                    child: Text('Nuevo musulmán')),
                Expanded(child: Image.asset('assets/images/alhamdo_lellah.jpg')),
                SizedBox(height: 20,)

              ],
            ),
          )) ,
    );
  }
}
