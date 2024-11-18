import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/appointmentpt.dart';
import 'package:try1/common.dart';
import 'package:try1/patientlogin.dart';

class Request extends StatelessWidget {
  final String userId;
  final String selectedDate;

  const Request({Key? key, required this.userId, required this.selectedDate}) : super(key: key);

  Future<void> sendData(BuildContext context, String pid, String name) async {
    DateTime dateTime = DateTime.parse(selectedDate);
    String dateString = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    final url = Uri.parse(Booking);
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'pid': pid,
      'name': name,
      'date': dateString,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Request sent successfully')),
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Patient2(userId: userId)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit data. Status Code: ${response.statusCode}')),
        );
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit data. Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = '';

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Calenderview(userId: userId),
          ),
        );        return false; // Prevent the default behavior
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Request Page',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan.shade300, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1.0],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'PID',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                controller: TextEditingController(text: userId),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  sendData(context, userId, name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF66D0D0),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
