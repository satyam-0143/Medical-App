import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:try1/patientlogin.dart';
import 'package:try1/bookedslotpt.dart';
import 'appointmentpt.dart';
import 'querypt.dart';
import 'ptprofile.dart';

class Navbar extends StatefulWidget {
  final String userId;
  final int totalScore;

  const Navbar({Key? key, required this.userId, required this.totalScore}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String? profileImageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    String url = NavPat;

    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'P_id': widget.userId}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        print('Response Data: $jsonData'); // Debugging line to check response data

        if (jsonData.containsKey('img')) {
          setState(() {
            profileImageUrl = '$PATPROIMG${jsonData['img']}';
            isLoading = false;
          });
          print('Profile Image URL: $profileImageUrl'); // Debugging line to check profile image URL
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('Failed to load profile data. Status code: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching profile data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Future<void> openWhatsApp() async {
  //   String phoneNumber = "918903705958";
  //   String message = "Hello from my Flutter app!";
  //   Uri uri = Uri.https('wa.me', '/$phoneNumber', {'text': message});
  //   String url = uri.toString();
  //   print('WhatsApp URL: $url'); // Debugging line to check URL
  //
  //   try {
  //     bool canLaunchUrl = await canLaunch(url);
  //     print('Can launch WhatsApp URL: $canLaunchUrl'); // Debugging line to check if URL can be launched
  //
  //     if (canLaunchUrl) {
  //       await launch(url);
  //     } else {
  //       print('Could not launch WhatsApp: $url');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Could not launch WhatsApp. Please check if WhatsApp is installed.')),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error launching WhatsApp: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Could not launch WhatsApp. Please check if WhatsApp is installed. Reason: $e')),
  //     );
  //   }
  // }
  //
  // Future<bool> checkWhatsAppInstalled() async {
  //   try {
  //     var packageInfo = await PackageInfo.fromPlatform();
  //     var whatsappPackage = packageInfo.packageName;
  //     return whatsappPackage.contains('whatsapp');
  //   } catch (e) {
  //     print('Error checking WhatsApp installation: $e');
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/919566780831');
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Patient2(userId: widget.userId)),
        );
        return false;
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.cyan.shade800, Colors.grey.shade100],
                    ),
                  ),
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.transparent,
                      backgroundImage: profileImageUrl != null
                          ? NetworkImage(profileImageUrl!)
                          : null,
                      child: profileImageUrl == null
                          ? Icon(Icons.person, size: 75, color: Colors.black)
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile(userId: widget.userId)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Text('Appointment Booking'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calenderview(userId: widget.userId)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.question_mark),
                  title: Text('Query Form'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Query(userId: widget.userId, totalScore: widget.totalScore)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_border),
                  title: Text('Booked Slots'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bookedslot(userId: widget.userId)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Message to Your Doctor'),
                  onTap:(()async{
                    launchUrl(whatsApp);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
