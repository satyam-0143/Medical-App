import 'package:flutter/material.dart';
import 'backgroundlogin.dart';


class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: hello(),
//     );
//   }
// }
//
//
// class hello extends StatelessWidget {
//   const hello({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.topCenter,
              child:
              Image.asset('assets/page4.png',
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(height: 70),

            Text(
              'Pulmonologist are specially trained \n '
                  'in diseases and conditions of the \n'
                  ' chest,particularly pneumonia,\n'
                  '  asthama and chest infections ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 100,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child:CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff1976d2),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:  (context) =>  Login()),
                          );
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    )
                )
              ],
            ),

          ],
        ),
      ),
    )
    );

  }
}
