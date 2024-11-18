import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:try1/common.dart';

class ViewPatient extends StatefulWidget {
  @override
  _ViewPatientState createState() => _ViewPatientState();
}

class _ViewPatientState extends State<ViewPatient> {
  late TextEditingController _searchController;
  late List<Map<String, String>> patients = [];
  late List<Map<String, String>> filteredPatients = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _fetchPatients();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredPatients = patients.where((patient) =>
      patient['P_name']!.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          patient['P_id']!.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          patient['P_gender']!.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          patient['P_phno']!.toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
    });
  }

  Future<void> _fetchPatients() async {
    try {
      final response = await http.get(Uri.parse(PLIST));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          patients = jsonData.cast<Map<String, dynamic>>().map((json) {
            return {
              'P_id': json['P_id'].toString(),
              'P_name': json['P_name'].toString(),
              'P_gender': json['P_gender'].toString(),
              'P_phno': json['P_phno'].toString(),
            };
          }).toList();
          filteredPatients = List.from(patients);
        });
      } else {
        throw Exception('Failed to load patients: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching patients: $e');
    }
  }

  Future<void> _deletePatient(String patientId) async {
    try {
      final response = await http.post(
        Uri.parse(deletept), // Replace with your delete API endpoint
        body: {'userId': patientId}, // Adjust according to your API's requirements
      );

      if (response.statusCode == 200) {
        setState(() {
          // Remove the deleted patient from the lists
          patients.removeWhere((patient) => patient['P_id'] == patientId);
          filteredPatients.removeWhere((patient) => patient['P_id'] == patientId);
        });
      } else {
        throw Exception('Failed to delete patient: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting patient: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var patient in filteredPatients)
                      _buildPatientCard(
                        id: patient['P_id']!,
                        name: patient['P_name']!,
                        gender: patient['P_gender']!,
                        phno: patient['P_phno']!,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard({
    required String id,
    required String name,
    required String gender,
    required String phno,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle onTap event if needed
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: $name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('ID: $id'),
                      Text('Gender: $gender'),
                      Text('Phone: $phno'),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Confirm deletion
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Patient'),
                        content: Text('Are you sure you want to delete this patient?'),
                        actions: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                          TextButton(
                            child: Text('Delete'),
                            onPressed: () {
                              _deletePatient(id); // Call the delete function
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
