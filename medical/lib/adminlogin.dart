import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try1/Forgotpasspt.dart';
import 'package:try1/common.dart';
import 'package:try1/patientlogin.dart';
import 'adminpage.dart';
import 'backgroundlogin.dart'; // Import the Patient2 page.

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    // Create a map containing username and password
    Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };

    // Encode the map to JSON
    String jsonBody = jsonEncode(data);

    try {
      final response = await http.post(
        Uri.parse(adminlogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        // Decode the response JSON
        Map<String, dynamic> responseData = json.decode(response.body);

        // Check login status from response
        if (responseData['status'] == 'success') {
          // Login successful, navigate to admin page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Adminpage()),
          );
        } else {
          // Login failed, show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Failed'),
                content: Text(responseData['message']),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
    }
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
                            SizedBox(height: 20), // Adjusted spacing
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
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
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => ForgotPasswordPage(), // Update if needed
                            //       ),
                            //     );
                            //   },
                            //   child: Text(
                            //     'Forgot Password?',
                            //     style: TextStyle(
                            //       color: Colors.blue,
                            //       fontSize: 16,
                            //       decoration: TextDecoration.underline,
                            //     ),
                            //   ),
                            // ),
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
