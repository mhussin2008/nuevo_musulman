import 'package:flutter/material.dart';

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
                ElevatedButton(onPressed: (){},
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
