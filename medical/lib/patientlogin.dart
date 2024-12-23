import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/appointmentpt.dart';
import 'package:try1/bookedslotpt.dart';
import 'package:try1/common.dart';
import 'package:try1/patient.dart';
import 'package:try1/ptprofile.dart';
import 'package:try1/pushnotification.dart';
import 'package:try1/videoplayer.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';
import 'package:try1/navbarpatient.dart';

import 'backgroundlogin.dart';

void main() {
  runApp(MyApp());
}

class Patient2 extends StatefulWidget {
  final String userId;

  const Patient2({Key? key, required this.userId}) : super(key: key);

  @override
  _Patient2State createState() => _Patient2State();
}

class _Patient2State extends State<Patient2> {
  int _currentIndex = 0;
  late Future<List<String>> _videos;
  int get totalScore => 0; // Set a default value for totalScore
  List<String> notifications = [];
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _videos = fetchVideoUrls();
    fetchNotifications();
  }

  Future<List<String>> fetchVideoUrls() async {
    final response = await http.post(Uri.parse(Displayvideo));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> videosJson = data['videos'];
      List<String> videoUrls = videosJson.map((video) => video['url'] as String).toList();
      return videoUrls;
    } else {
      throw Exception('Failed to load videos');
    }
  }

  void fetchNotifications() async {
    setState(() {
      notifications = [
        "Your appointment has been approved.",
        "Your prescription is ready for pickup.",
        "New exercise video has been added.",
      ];
    });
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() {
        _currentIndex = 0;
        _pageController.jumpToPage(0);
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          drawer: Navbar(userId: widget.userId, totalScore: totalScore),
          appBar: _currentIndex == 0
              ? AppBar(
            title: Text(' ${widget.userId}'),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, semanticLabel: 'menu'),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),

          )
              : null,
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              _buildHomePage(),
              Profile(userId: widget.userId),
              Calenderview(userId: widget.userId),
              bookedslot(userId: widget.userId),
              WillPopScope(
                onWillPop: () async {
                  setState(() {
                    _currentIndex = 0;
                    _pageController.jumpToPage(0);
                  });
                  return false;
                },
                child: PatientLogin(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: Colors.black),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month, color: Colors.black),
                label: 'Appointment Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border, color: Colors.black),
                label: 'Appointment Status',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout, color: Colors.black),
                label: 'Logout',
              ),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.blue,
            onTap: (index) {
              if (index == 4) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                );
              } else {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.jumpToPage(index);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 160,
            width: 300,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.cyan.shade800, Colors.grey.shade200],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SAVEETHA HOSPITAL',
                          style: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Provide treatment with specialized health sciences and medical equipments.',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/hospital.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Exercise Videos',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoListScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0),
          Container(
            height: 300,
            child: FutureBuilder<List<String>>(
              future: _videos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No videos found'));
                } else {
                  return PageView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return VideoPlayerItem(videoUrl: snapshot.data![index]);
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 0),
          GestureDetector(
            onVerticalDragUpdate: (details) {
              // Handle vertical drag update if needed.
            },
            child: Container(
              height: 160,
              width: 300,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.cyan.shade800, Colors.grey.shade200],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ABOUT',
                              style: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Home-based pulmonary rehabilitation helps patients avoid repeated hospital visits. With the app, patients can track their progress, contact doctors for live sessions, access video demonstrations of rehab exercises, and enhance their quality of life.',
                              style: TextStyle(fontSize: 15.0, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/hospital.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



















class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {
        _isPlaying = true; // Automatically start playing after initialization
      });
      _controller.play(); // Start playing the video
    }).catchError((error) {
      // Handle initialization error
      print('Error initializing video player: $error');
    });

    // Listen for video playback state changes
    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return hours > 0
        ? '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}'
        : '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Fixed container height
      width: double.infinity, // Full width
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Video Player
          GestureDetector(
            onTap: () {
              setState(() {
                _isPlaying = !_isPlaying;
                if (_isPlaying) {
                  _controller.play();
                } else {
                  _controller.pause();
                }
              });
            },
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    // Set video player to cover entire container
                    width: double.infinity,
                    height: double.infinity,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // Play Icon Overlay
          if (!_isPlaying)
            Center(
              child: Icon(
                Icons.play_arrow,
                size: 50,
                color: Colors.black,
              ),
            ),
          // Video Progress Slider
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Slider(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  value: _controller.value.position.inSeconds.toDouble(),
                  min: 0,
                  max: _controller.value.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _controller.seekTo(Duration(seconds: value.toInt()));
                    });
                  },
                ),
                // Display current time and total duration
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(_controller.value.position),
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        _formatDuration(_controller.value.duration),
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
