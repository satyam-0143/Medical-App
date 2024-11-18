import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'common.dart';

class Adddoctor extends StatefulWidget {
  @override
  _AdddoctorState createState() => _AdddoctorState();
}

class _AdddoctorState extends State<Adddoctor> {
  File? _image;
  final _picker = ImagePicker();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera_alt, color: Colors.blueAccent),
                  title: Text('Take a photo'),
                  onTap: () async {
                    Navigator.pop(context);
                    final picker = ImagePicker();
                    final pickedImage = await picker.pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {
                        _image = File(pickedImage.path);
                      });
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image, color: Colors.blueAccent),
                  title: Text('Choose from gallery'),
                  onTap: () async {
                    Navigator.pop(context);
                    final picker = ImagePicker();
                    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {
                        _image = File(pickedImage.path);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _submitForm() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an image.')),
      );
      return;
    }

    final url = Uri.parse(AddDoctor);
    var request = http.MultipartRequest('POST', url);

    request.fields['D_id'] = _userIdController.text;
    request.fields['D_name'] = _nameController.text;
    request.fields['password'] = _passwordController.text;
    request.fields['D_dep'] = _designationController.text;
    request.fields['D_phno'] = _phoneController.text;

    var imageFile = await http.MultipartFile.fromPath('image', _image!.path);
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
          Navigator.pop(context);
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
    }
  }

  Widget _buildTextField(String labelText, TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Enter $labelText',
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Doctor",
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
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
              _buildTextField('User ID', _userIdController, false),
              _buildTextField('Password', _passwordController, true),
              _buildTextField('Name', _nameController, false),
              _buildTextField('Designation', _designationController, false),
              _buildTextField('Phone Number', _phoneController, false),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
