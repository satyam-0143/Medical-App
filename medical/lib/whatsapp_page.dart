import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/918903705958');
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Navigation'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: GestureDetector(
          onTap:(()async{
            launchUrl(whatsApp);
          }),
          child: Image.asset(
            'assets/whats.jpg',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}