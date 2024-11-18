import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'common.dart'; // Your file where URLs or common variables are defined

class DoctorForgotPasswordPage extends StatefulWidget {
  @override
  _DoctorForgotPasswordPageState createState() => _DoctorForgotPasswordPageState();
}

class _DoctorForgotPasswordPageState extends State<DoctorForgotPasswordPage> {
  TextEditingController doctorIdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  Future<void> resetPassword() async {
    var url = Uri.parse(Forgotpassdr); // Your API URL here
    var data = {
      "D_id": doctorIdController.text,
      "D_phno": phoneController.text,
      "new_password": newPasswordController.text,
    };

    var response = await http.post(
      url,
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    var responseData = jsonDecode(response.body);

    if (responseData['status'] == 'success') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Password reset successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context); // Go back to the login page
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid Doctor ID or Phone Number'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Forgot Password'),
      ),
      body: Center(
        child: SingleChildScrollView(  // Added SingleChildScrollView
          child: Container(
            width: 300.0,
            height: 450.0,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [Colors.cyan.shade300, Colors.grey.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: doctorIdController,
                    decoration: InputDecoration(
                      labelText: 'Doctor ID',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: newPasswordController,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: resetPassword,
                    child: Text('Reset Password'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ), // Button color
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
