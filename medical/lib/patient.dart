import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try1/Forgotpasspt.dart';
import 'package:try1/common.dart';
import 'package:try1/patientlogin.dart';
import 'backgroundlogin.dart'; // Import the Patient2 page.

class PatientLogin extends StatefulWidget {
  const PatientLogin({Key? key}) : super(key: key);

  @override
  State<PatientLogin> createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false; // State to manage password visibility

  Future<void> _login() async {
    if (usernameController.text.isEmpty) {
      // Show an alert dialog indicating that the username is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Username is empty'),
            content: const Text('Please enter your username.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Exit the function early since the username is empty
    }
    var url = Uri.parse(plogin);
    var data = {
      "P_id": usernameController.text,
      "password": passwordController.text,
    };

    var response = await http.post(
      url,
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );




    var responseData = jsonDecode(response.body);

    if (responseData['status'] == 'success') {
      String userId = usernameController.text;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userId', userId);

      // Navigate to the Patient2 page and pass the userId.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Patient2(userId: userId),
        ),
      );
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid user id or password'),
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

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/white.jpg'), // Logo image as background
          fit: BoxFit.cover,
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          // Navigate to FormDoc page when back button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()), // Adjust if needed
          );
          // Return false to prevent the current screen from popping
          return false;
        },
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Logo at the top
              Container(
                height: 150, // Adjust height as needed
                child: Image.asset('assets/logo.png', fit: BoxFit.contain), // Your logo image
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
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
                            TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'User Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                alignLabelWithHint: true,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey, // Customize the color of the icon
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.cyan[300],
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                minimumSize: Size(double.infinity, 48),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16, // Increased font size for better readability
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            // Forgot password text button
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(), // Update if needed
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
