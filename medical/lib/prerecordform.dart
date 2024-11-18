import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'dart:convert';

import 'package:try1/formdoc.dart';
import 'package:try1/sixminutewalk.dart';

class Prerecordform extends StatefulWidget {
  final String id;

  Prerecordform({required this.id});

  @override
  _PrerecordformState createState() => _PrerecordformState();
}

class _PrerecordformState extends State<Prerecordform> {
  final TextEditingController pbpController = TextEditingController();
  final TextEditingController phrController = TextEditingController();
  final TextEditingController pdysController = TextEditingController();
  final TextEditingController pfatController = TextEditingController();
  final TextEditingController spO2Controller = TextEditingController(); // Added SpO2 controller

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    pbpController.addListener(_checkIfFieldsAreFilled);
    phrController.addListener(_checkIfFieldsAreFilled);
    pdysController.addListener(_checkIfFieldsAreFilled);
    pfatController.addListener(_checkIfFieldsAreFilled);
    spO2Controller.addListener(_checkIfFieldsAreFilled);
  }

  @override
  void dispose() {
    pbpController.dispose();
    phrController.dispose();
    pdysController.dispose();
    pfatController.dispose();
    spO2Controller.dispose();
    super.dispose();
  }

  void _checkIfFieldsAreFilled() {
    setState(() {
      isButtonEnabled = pbpController.text.isNotEmpty &&
          phrController.text.isNotEmpty &&
          pdysController.text.isNotEmpty &&
          pfatController.text.isNotEmpty &&
          spO2Controller.text.isNotEmpty;
    });
  }

  // Helper method to build a row with a label and a text field
  Widget _buildTextFieldRow(String labelText, TextEditingController controller, [String? hintText]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText ?? 'Enter value',
            border: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Future<void> _saveValues(String url) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "P_id": widget.id,
        "pbp": pbpController.text,
        "phr": phrController.text,
        "pdys": pdysController.text,
        "pfat": pfatController.text,
        "pso2": spO2Controller.text, // Added SpO2 parameter
      }),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save data: ${result['message']}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data: ${response.reasonPhrase}')),
      );
    }
  }

  Future<void> _handleSubmit() async {
    await _saveValues(SMWT); // Save Pre Test Baseline
    await _saveValues(INTER6); // Save End Test
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Sixminute(id: widget.id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pre 6MWT',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Post Test Baseline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              _buildTextFieldRow('ABG:', pbpController),
              SizedBox(height: 20),
              _buildTextFieldRow('HR(per min):', phrController),
              SizedBox(height: 20),
              _buildTextFieldRow('SpO2(%RA):', spO2Controller), // Added SpO2 field
              SizedBox(height: 20),
              _buildTextFieldRow('No of Lapse Covered:', pdysController),
              SizedBox(height: 20),
              _buildTextFieldRow('Distance Covered(Metre):', pfatController),
              SizedBox(height: 45),
              Text(
                'Pre',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              _buildTextFieldRow('CAT SCORE:', TextEditingController()),
              SizedBox(height: 20),
              _buildTextFieldRow('HR(per min):', TextEditingController()),
              SizedBox(height: 20),
              _buildTextFieldRow('SpO2(%RA):', TextEditingController()),
              // SizedBox(height: 20),
              // _buildTextFieldRow('End Dyspnea:', TextEditingController()),
              // SizedBox(height: 20),
              // _buildTextFieldRow('End Distance Covered:', TextEditingController()),
              // SizedBox(height: 45),
              // _buildTextFieldRow('Stopped or pauses before 6 minute completed?', TextEditingController(), 'No/Yes, reason:'),
              // SizedBox(height: 45),
              // _buildTextFieldRow('Other symptoms at the end of test:', TextEditingController(), 'Angina, dizziness, hip, knee, calf pain, other:'),
              SizedBox(height: 45),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isButtonEnabled ? _handleSubmit : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled ? Colors.cyan : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
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
