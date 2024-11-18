import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'dart:convert';
import 'package:try1/formdoc.dart';
// import 'package:try1/prepulmonaryform.dart';
import 'package:try1/postpulmonaryform.dart';
import 'package:try1/prepulmonaryfunction.dart';

class Pulmonary extends StatefulWidget {
  final String id;

  const Pulmonary({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  _PulmonaryState createState() => _PulmonaryState();
}

class _PulmonaryState extends State<Pulmonary> {
  String? apr;
  String? aprfvc;
  String? aprfev1;
  String? aprfef;
  String? bpr;
  String? bprfvc;
  String? bprfev1;
  String? bprfef;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.parse(Feth_data6);
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'P_id': widget.id}),
    );

    if (response.statusCode == 200) {
      try {
        var responseData = jsonDecode(response.body);

        if (responseData.containsKey('status') && responseData['status'] == 'success') {
          var scores = responseData['data'];
          setState(() {
            apr = scores['apr'];
            aprfvc = scores['aprfvc'];
            aprfev1 = scores['aprfev1'];
            aprfef = scores['aprfef'];
            bpr = scores['bpr'];
            bprfvc = scores['bprfvc'];
            bprfev1 = scores['bprfev1'];
            bprfef = scores['bprfef'];
          });
        } else {
          print('Error: ${responseData['message']}');
        }
      } catch (e) {
        print('Error: ${e.toString()}');
      }
    } else {
      print('Error: HTTP ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PFT Data',
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Prepulmonaryform(id: widget.id)),
                    );
                    if (result == true) {
                      fetchData();
                    }
                  },
                  child: Text(
                    'PRE RECORD',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    minimumSize: Size(270, 50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Postpulmonaryform(id: widget.id)),
                    );
                    if (result == true) {
                      fetchData();
                    }
                  },
                  child: Text(
                    'POST RECORD',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    minimumSize: Size(270, 50),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70),
            _buildRecordContainer(
              title: 'Pre-Record Details',
              details: {
                'FEV1/FVC': apr,
                'FVC': aprfvc,
                'FEV1': aprfev1,
                'FEV 25-75': aprfef,
              },
            ),
            SizedBox(height: 30),
            _buildRecordContainer(
              title: 'Post-Record Details',
              details: {
                'FEV1/FVC': bpr,
                'FVC': bprfvc,
                'FEV1': bprfev1,
                'FEV 25-75': bprfef,
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordContainer({
    required String title,
    required Map<String, String?> details,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [Colors.cyan.shade300, Colors.grey.shade200],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          ...details.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Text(
                    '${entry.key}:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    entry.value ?? 'N/A',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
