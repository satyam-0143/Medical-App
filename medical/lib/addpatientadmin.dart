import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:try1/common.dart';

class AddPatientAdmin extends StatefulWidget {
  AddPatientAdmin({Key? key}) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatientAdmin> {
  File? _image;
  final _picker = ImagePicker();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _causeController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _pickImage() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage = await _picker.pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      _image = File(pickedImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _image = File(pickedImage.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _submitForm() async {
    if (_userIdController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields and select an image.')),
      );
      return;
    }

    bool confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm add patient'),
          content: Text('Are you sure you want to add this patient?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );

    if (!confirm) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Patient added successfully')),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    final url = Uri.parse(addpatient);
    var request = http.MultipartRequest('POST', url);

    request.fields['P_id'] = _userIdController.text;
    request.fields['P_name'] = _nameController.text;
    request.fields['password'] = _passwordController.text;
    request.fields['P_gender'] = _genderController.text;
    request.fields['P_phno'] = _phoneController.text;
    request.fields['Diagnosis'] = _causeController.text;
    request.fields['P_age'] = _ageController.text;

    var imageFile = await http.MultipartFile.fromPath('img', _image!.path);
    request.files.add(imageFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var data = jsonDecode(responseData);

        if (data['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User registration successful.')),
          );
          _userIdController.clear();
          _nameController.clear();
          _passwordController.clear();
          _genderController.clear();
          _phoneController.clear();
          _causeController.clear();
          _ageController.clear();
          setState(() {
            _image = null;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Error occurred.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to connect to server.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan.shade50, // Background color
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Add Patient",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan.shade300, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.blue.shade100,
                          backgroundImage: _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Icon(Icons.person_add_alt_1_rounded, size: 50, color: Colors.white)
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField('User ID', _userIdController),
                        _buildTextField('Password', _passwordController, isPassword: true),
                        _buildTextField('Name', _nameController),
                        _buildTextField('Gender', _genderController),
                        _buildTextField('Age', _ageController),
                        _buildTextField('Phone No', _phoneController),
                        _buildTextField('Diagnosis', _causeController),
                        SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: 'Enter your $label',
            ),
          ),
        ],
      ),
    );
  }
}
