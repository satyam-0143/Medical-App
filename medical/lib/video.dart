import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'package:video_player/video_player.dart';
import 'doctorlogin.dart'; // Ensure this import is correct

class UploadVideo extends StatefulWidget {
  final String userId;

  UploadVideo({Key? key, required this.userId}) : super(key: key);

  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedVideo;
  late VideoPlayerController _videoPlayerController;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/placeholder_video.mp4');
  }

  Future<void> _pickVideo(BuildContext context) async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedVideo = pickedFile;
        _videoPlayerController = VideoPlayerController.file(File(_selectedVideo!.path));
        _videoPlayerController.initialize().then((_) {
          setState(() {});
        });
      });
    }
  }

  Future<void> _submitVideo(BuildContext context) async {
    if (_selectedVideo != null) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Upload'),
            content: Text('Do you want to upload this video?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('OK'),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        setState(() {
          _isUploading = true;
        });

        var request = http.MultipartRequest(
          'POST',
          Uri.parse(AddVideos),
        );

        request.files.add(
          await http.MultipartFile.fromPath(
            'uploaded_file',
            _selectedVideo!.path,
          ),
        );

        try {
          var streamedResponse = await request.send();
          var response = await http.Response.fromStream(streamedResponse);
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');

          if (mounted) {
            if (streamedResponse.statusCode == 200) {
              _showSnackBar('Video uploaded successfully');

              // Dispose video player and clear selected video
              _videoPlayerController.dispose();
              setState(() {
                _selectedVideo = null;
              });

              // Navigate to CustomCardView page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomCardView(userId: widget.userId),
                ),
              );
            } else {
              _showSnackBar('Failed to upload video: ${response.body}');
            }
          }
        } catch (e) {
          print('Error uploading video: $e');
          if (mounted) {
            _showSnackBar('Error uploading video: $e');
          }
        } finally {
          setState(() {
            _isUploading = false;
          });
        }
      }
    } else {
      _showSnackBar('Please select a video first.');
    }
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload video'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _pickVideo(context),
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: _selectedVideo != null
                    ? VideoPlayer(_videoPlayerController)
                    : Icon(
                  Icons.video_collection_outlined,
                  size: 60,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tap to select video',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            _isUploading
                ? CircularProgressIndicator()
                : GestureDetector(
              onTap: () => _submitVideo(context),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
