import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'dart:convert';
import 'package:try1/postrecordform.dart';
import 'package:try1/prerecordform.dart';

class Sixminute extends StatefulWidget {
  final String id;

  const Sixminute({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  _SixminuteState createState() => _SixminuteState();
}

class _SixminuteState extends State<Sixminute> {
  String? preRecordPfat;
  String? preRecordPso2;
  String? preRecordPbp; // Added for pbp
  String? postRecordEfat;
  String? postRecordEso2;
  String? postRecordEbp; // Added for ebp

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.parse(Fetch_data5);
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
            preRecordPfat = scores['pfat'];
            preRecordPso2 = scores['pso2'];
            preRecordPbp = scores['pbp']; // Added for pbp
            postRecordEfat = scores['efat'];
            postRecordEso2 = scores['eso2'];
            postRecordEbp = scores['ebp']; // Added for ebp
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Form',
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
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Prerecordform(id: widget.id)),
                    );
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
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Postrecordform(id: widget.id, onSaveSuccess: fetchData)),
                    );
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
            SizedBox(height: 100),
            if (preRecordPfat != null && preRecordPso2 != null && preRecordPbp != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
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
                      'Pre-Record Details:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    _buildDetailRow('ABG:', preRecordPbp), // Added for pbp
                    _buildDetailRow('Distance Covered(m):', preRecordPfat),
                    _buildDetailRow('SPO2(%RA):', preRecordPso2),

                  ],
                ),
              ),
            SizedBox(height: 70),
            if (postRecordEfat != null && postRecordEso2 != null && postRecordEbp != null)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
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
                      'Post-Record Details:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    _buildDetailRow('ABG:', postRecordEbp),
                    _buildDetailRow('Distance Covered(m):', postRecordEfat),
                    _buildDetailRow('SPO2(%RA):', postRecordEso2),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Text(
          value ?? 'N/A',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
