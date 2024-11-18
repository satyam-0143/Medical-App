import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'common.dart'; // Import your common file for base URL access

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  PageController _pageController = PageController();
  String _status = 'Pending'; // Default status
  List<dynamic> pendingAppointments = [];
  List<dynamic> approvedAppointments = [];

  // Method to fetch appointments based on the selected status
  Future<void> fetchAppointments() async {
    try {
      // Fetch Pending appointments
      final pendingResponse = await http.post(
        Uri.parse(Pendingstatus),
        headers: {'Content-Type': 'application/json'},
      );
      if (pendingResponse.statusCode == 200) {
        setState(() {
          pendingAppointments = jsonDecode(pendingResponse.body);
        });
      } else {
        print('Failed to load pending appointments: ${pendingResponse.statusCode}');
      }

      // Fetch Approved appointments
      final approvedResponse = await http.post(
        Uri.parse(Approvedstatus),
        headers: {'Content-Type': 'application/json'},
      );
      if (approvedResponse.statusCode == 200) {
        setState(() {
          approvedAppointments = jsonDecode(approvedResponse.body);
        });
      } else {
        print('Failed to load approved appointments: ${approvedResponse.statusCode}');
      }
    } catch (e) {
      print('Error fetching appointments: $e');
    }
  }

  // Method to accept an appointment
  Future<void> acceptAppointment(String pid) async {
    final url = Acceptappointment;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'pid': pid}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'success') {
          fetchAppointments(); // Refresh appointments list if the status update is successful
        } else {
          print('Failed to update appointment: ${responseData['message']}');
        }
      } else {
        print('Failed to update appointment: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating appointment: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Appointment Booking',
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
      body: Column(
        children: [
          _buildStatusButtons(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _status = index == 0 ? 'Pending' : 'Approved';
                });
              },
              children: [
                // Pending Page
                _buildAppointmentsList(pendingAppointments),
                // Approved Page
                _buildAppointmentsList(approvedAppointments),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build status buttons
  Widget _buildStatusButtons() {
    return Row(
      children: [
        // Pending button
        Expanded(
          child: StatusButton(
            text: 'Pending',
            isSelected: _status == 'Pending',
            onTap: () {
              _pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        // Approved button
        Expanded(
          child: StatusButton(
            text: 'Approved',
            isSelected: _status == 'Approved',
            onTap: () {
              _pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }

  // Method to build appointments list
  Widget _buildAppointmentsList(List<dynamic> appointments) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          elevation: 3,
          child: ListTile(
            title: Text('Name: ${appointment['name']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PID: ${appointment['pid']}'),
                Text('Date: ${appointment['date']}'),
                Text('Status: ${appointment['status']}'),
              ],
            ),
            trailing: appointment['status'] == 'pending'
                ? ElevatedButton(
              onPressed: () {
                // Show AlertDialog for confirmation
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirm Appointment'),
                      content: Text(
                        'Are you sure you want to accept this appointment?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            acceptAppointment(appointment['pid']);
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Accept'),
            )
                : null,
          ),
        );
      },
    );
  }
}

class StatusButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? (text == 'Pending' ? Colors.red : Colors.green) : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
