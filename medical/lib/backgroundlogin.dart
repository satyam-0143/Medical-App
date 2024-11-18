import 'package:flutter/material.dart';
import 'package:try1/adminlogin.dart';
import 'package:try1/main.dart';
import 'package:try1/page2.dart';
import 'doctor.dart';
import 'patient.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;
    final bool isWeb = screenSize.width > 600; // Use this to differentiate between web and mobile

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
        );
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer to push the logo up on the screen
              Spacer(flex: isWeb ? 2 : 1), // More space on web, less on phone

              // Logo
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                width: isWeb
                    ? screenSize.width * 0.3 // 30% of width on web
                    : screenSize.width * 0.5, // 50% of width on mobile
                height: isWeb
                    ? screenSize.height * 0.2 // 20% of height on web
                    : screenSize.height * 0.15, // 15% of height on mobile
              ),

              Spacer(flex: 1),

              // Main container for login buttons
              Card(
                margin: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: isWeb ? screenSize.width * 0.5 : screenSize.width * 0.9, // Responsive width
                  height: isWeb ? screenSize.height * 0.5 : screenSize.height * 0.45, // Responsive height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [Color(0xFF66D0D0), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Patient Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PatientLogin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Patient',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 30),
                            Image.asset(
                              'assets/docicon.png',
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Doctor Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Doctor',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 30),
                            Image.asset(
                              'assets/paticon.png',
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),

                      // Admin Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Are you admin?',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AdminLogin()),
                              );
                            },
                            child: Text(
                              'Admin',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Spacer(flex:1), // Add some space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
