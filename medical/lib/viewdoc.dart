import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'common.dart';

class ViewDoctor extends StatefulWidget {
  const ViewDoctor({Key? key}) : super(key: key);

  @override
  _ViewDoctorState createState() => _ViewDoctorState();
}

class _ViewDoctorState extends State<ViewDoctor> {
  List<Map<String, dynamic>> allDoctors = [];
  List<Map<String, dynamic>> displayedDoctors = [];
  String searchString = '';

  @override
  void initState() {
    super.initState();
    fetchAllDoctorsFromDatabase();
  }

  void fetchAllDoctorsFromDatabase() async {
    try {
      var response = await http.post(
        Uri.parse(Viewdr), // Your API endpoint to get doctor list
      );

      if (response.statusCode == 200) {
        // Directly decode the response as a list
        List<dynamic> doctorsList = json.decode(response.body);

        List<Map<String, dynamic>> details = [];
        for (var doctor in doctorsList) {
          details.add({
            'D_id': doctor['D_id'].toString(), // Convert to String
            'D_name': doctor['D_name'],
            // Add D_dep if you want to display it as well
            'D_dep': doctor['D_dep'],
          });
        }

        setState(() {
          allDoctors = details;
          displayedDoctors = allDoctors.reversed.take(6).toList(); // Get the last 6 doctors
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }


  void deleteDoctor(String doctorUserId) async {
    try {
      var response = await http.post(
        Uri.parse(deletedr), // Your API endpoint to delete doctor
        body: {
          'userId': doctorUserId, // Ensure userId is passed as a string
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['status'] == 'success') {
          setState(() {
            allDoctors.removeWhere(
                    (doctor) => doctor['D_id'] == doctorUserId);
            displayedDoctors = allDoctors
                .where((doctor) =>
            doctor['D_name'].toLowerCase().contains(searchString) ||
                doctor['D_id'].toString().contains(searchString))
                .toList();
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Doctor deleted successfully.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete doctor.')),
          );
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Doctor List',
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
        body: Column(
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              height: 70,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                    displayedDoctors = allDoctors
                        .where((doctor) =>
                    doctor['D_name']
                        .toLowerCase()
                        .contains(searchString) ||
                        doctor['D_id'].toString().contains(searchString))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            // Doctor list
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: List.generate(
                      displayedDoctors.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            // Optionally navigate to doctor details page
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    '${displayedDoctors[index]['D_id']}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        displayedDoctors[index]['D_name'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          deleteDoctor(displayedDoctors[index]['D_id']);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}