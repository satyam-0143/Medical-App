import 'package:flutter/material.dart';
import 'package:try1/backgroundlogin.dart';
import 'package:try1/whatsapp_page.dart';
import 'page3.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/logo.png',
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 70),
            Text(
              'Pulmonologist are specially trained \n '
                  'in diseases and conditions of the \n'
                  'chest, particularly pneumonia,\n'
                  'asthma and chest infections ',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Spacer(), // This will push the button to the bottom
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xff1976d2),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    icon: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add a little space at the bottom
          ],
        ),
      ),
    );
  }
}
