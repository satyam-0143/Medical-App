import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'package:try1/querypt.dart';

class TamilQuestion extends StatefulWidget {
  final String userId;

  const TamilQuestion({
    required this.userId,
    Key?key,

  }): super(key: key);


  @override
  _TamilQuestionState createState() => _TamilQuestionState();
}

class _TamilQuestionState extends State<TamilQuestion> {

  int firstTimeScore = 0;
  int secondTimeScore = 0;



  String? _selectedOptionQuestion1;
  String? _selectedOptionQuestion2;
  String? _selectedOptionQuestion3;
  String? _selectedOptionQuestion4;
  String? _selectedOptionQuestion5;
  String? _selectedOptionQuestion6;
  String? _selectedOptionQuestion7;
  String? _selectedOptionQuestion8;
  String? _selectedOptionQuestion9;
  String? _selectedOptionQuestion10;
  String? _selectedOptionQuestion11;
  String? _selectedOptionQuestion12;
  String? _selectedOptionQuestion13;
  String? _selectedOptionQuestion14;


  // Method to calculate the total score
  int _calculateTotalScore() {
    int totalScore = 0;

    // Add scores for each question based on selected options
    // Assigning arbitrary scores for demonstration
    if (_selectedOptionQuestion1 == 'வாரத்தில் பெரும்பாலான நாட்கள்') totalScore += 4;
    else if (_selectedOptionQuestion1 == 'வாரத்தில் பல நாட்கள்') totalScore += 3;
    else if (_selectedOptionQuestion1 == 'சுவாச நோய்த்தொற்றுடன் மட்டுமே') totalScore += 2;
    else if (_selectedOptionQuestion1 == 'எப்போதும் இல்லை') totalScore += 1;

    if (_selectedOptionQuestion2 == 'வாரத்தில் பெரும்பாலான நாட்கள்') totalScore += 4;
    else if (_selectedOptionQuestion2 == 'வாரத்தில் பல நாட்கள்') totalScore += 3;
    else if (_selectedOptionQuestion2 == 'சுவாச நோய்த்தொற்றுடன் மட்டுமே') totalScore += 2;
    else if (_selectedOptionQuestion2 == 'எப்போதும் இல்லை') totalScore += 1;

    if (_selectedOptionQuestion3 == 'வாரத்தில் பெரும்பாலான நாட்கள்') totalScore += 4;
    else if (_selectedOptionQuestion3 == 'வாரத்தில் பல நாட்கள்') totalScore += 3;
    else if (_selectedOptionQuestion3 == 'சுவாச நோய்த்தொற்றுடன் மட்டுமே') totalScore += 2;
    else if (_selectedOptionQuestion3 == 'எப்போதும் இல்லை') totalScore += 1;

    if (_selectedOptionQuestion4 == 'வாரத்தில் பெரும்பாலான நாட்கள்') totalScore += 4;
    else if (_selectedOptionQuestion4 == 'வாரத்தில் பல நாட்கள்') totalScore += 3;
    else if (_selectedOptionQuestion4 == 'சுவாச நோய்த்தொற்றுடன் மட்டுமே') totalScore += 2;
    else if (_selectedOptionQuestion4 == 'எப்போதும் இல்லை') totalScore += 1;

    if (_selectedOptionQuestion5 == '3 அல்லது அதற்கு மேற்பட்ட தாக்குதல்கள்') totalScore += 3;
    else if (_selectedOptionQuestion5 == '1 அல்லது 2 தாக்குதல்கள்') totalScore += 2;
    else if (_selectedOptionQuestion5 == 'எப்போதும் இல்லை') totalScore += 1;

    if (_selectedOptionQuestion6 == 'நல்ல நாட்கள் இல்லை') totalScore += 4;
    else if (_selectedOptionQuestion6 == 'சில நல்ல நாட்கள்') totalScore += 3;
    else if (_selectedOptionQuestion6 == 'பெரும்பாலான நாட்கள் நன்றாக இருக்கும்') totalScore += 2;
    else if (_selectedOptionQuestion6 == 'ஒவ்வொரு நாளும் நல்ல நாளே') totalScore += 1;


    if (_selectedOptionQuestion7 == 'ஆம்') totalScore += 2;
    else if (_selectedOptionQuestion7 == 'இல்லை') totalScore += 1;

    if (_selectedOptionQuestion8 == 'எனக்கு நிறைய பிரச்சினைகளை ஏற்படுத்துகின்றன அல்லது எனக்கு இருக்கும் மிக முக்கியமான உடல் பிரச்சினைகள்') totalScore += 3;
    else if (_selectedOptionQuestion8 == 'எனக்கு சில பிரச்சனைகளை ஏற்படுத்தும்') totalScore += 2;
    else if (_selectedOptionQuestion8 == 'எந்த பிரச்சனையும் இல்லை') totalScore += 1;

    if (_selectedOptionQuestion9 == 'மலைகளில் நடைபயிற்சி') totalScore += 1;
    else if (_selectedOptionQuestion9 == 'படிக்கட்டுகளில் ஏறி நடப்பது') totalScore += 2;
    else if (_selectedOptionQuestion9 == 'சமதளத்தில் வெளியில் நடப்பது') totalScore += 3;
    else if (_selectedOptionQuestion9 == 'வீட்டைச் சுற்றி நடப்பது') totalScore += 4;
    else if (_selectedOptionQuestion9 == 'நீங்களே கழுவுதல் அல்லது ஆடை அணிதல்') totalScore += 5;

    if (_selectedOptionQuestion10 == 'இருமல் வலிக்கிறது') totalScore += 1;
    else if (_selectedOptionQuestion10 == 'இருமல் என்னை சோர்வடையச் செய்கிறது') totalScore += 2;
    else if (_selectedOptionQuestion10 == 'பேசும் போது மூச்சு திணறுகிறது') totalScore += 3;
    else if (_selectedOptionQuestion10== 'நான் குனியும் போது எனக்கு மூச்சுத் திணறல்') totalScore += 4;
    else if (_selectedOptionQuestion10 == 'நான் எளிதில் சோர்வடைகிறேன்') totalScore += 5;

    if (_selectedOptionQuestion11 == 'என் இருமல் அல்லது சுவாசம் பொதுவில் சங்கடமாக இருக்கிறது') totalScore += 1;
    else if (_selectedOptionQuestion11 == 'எனது சுவாச பிரச்சனைகள் எனது குடும்பத்தினர், நண்பர்கள் அல்லது அண்டை வீட்டாருக்கு தொந்தரவாக உள்ளது') totalScore += 2;
    else if (_selectedOptionQuestion11 == 'மூச்சு விட முடியாத போது நான் பயப்படுகிறேன் அல்லது பீதி அடைகிறேன்') totalScore += 3;
    else if (_selectedOptionQuestion11== 'என் சுவாச பிரச்சனைகளை நான் கட்டுப்படுத்தவில்லை என்று உணர்கிறேன்') totalScore += 4;
    else if (_selectedOptionQuestion11 == 'என் சுவாச பிரச்சனைகளால் நான் பலவீனமாகிவிட்டேன் அல்லது செல்லாதவனாக மாறிவிட்டேன்') totalScore += 5;
    else if (_selectedOptionQuestion11 == 'உடற்பயிற்சி எனக்கு பாதுகாப்பானது அல்ல') totalScore += 6;
    else if (_selectedOptionQuestion11 == 'எல்லாமே அதிக முயற்சியாகத் தெரிகிறது') totalScore += 7;


    if (_selectedOptionQuestion12 == 'நான் துவைக்க அல்லது ஆடை அணிவதற்கு நீண்ட நேரம் எடுத்துக்கொள்கிறேன்') totalScore += 8;
    else if (_selectedOptionQuestion12 == 'என்னால் குளிக்கவோ அல்லது குளிக்கவோ முடியாது அல்லது நான் செய்ய நீண்ட நேரம் எடுக்கும்') totalScore += 7;
    else if (_selectedOptionQuestion12 == 'நான் மற்றவர்களை விட மெதுவாக நடக்கிறேன், அல்லது ஓய்வெடுக்க நிறுத்துகிறேன்') totalScore += 6;
    else if (_selectedOptionQuestion12== 'வீட்டு வேலைகள் போன்ற வேலைகள் நீண்ட நேரம் எடுக்கும், அல்லது நான் ஓய்வெடுக்க நிறுத்த வேண்டும்') totalScore += 5;
    else if (_selectedOptionQuestion12 == 'நான் ஒரு படிக்கட்டு ஏறி நடந்தால், நான் நிறுத்த வேண்டும் அல்லது வேகத்தைக் குறைக்க வேண்டும்') totalScore += 4;
    else if (_selectedOptionQuestion12 == 'நான் அவசரப்பட்டால் அல்லது வேகமாக நடந்தால், நான் மெதுவாக செல்ல வேண்டும் அல்லது நிறுத்த வேண்டும்') totalScore += 3;
    else if (_selectedOptionQuestion12 == 'என் சுவாசம் மலைகளில் நடப்பது, படிக்கட்டுகளில் பொருட்களை எடுத்துச் செல்வது, திருமணம், நடனம், கிண்ணம் அல்லது கோல்ஃப் விளையாடுவது போன்ற சிறிய தோட்டக்கலை போன்றவற்றைச் செய்வதை கடினமாக்குகிறது.') totalScore += 2;
    else if (_selectedOptionQuestion12 == 'கனமான தோட்டம் அல்லது மண்வெட்டி பனியை எடுத்துச் செல்வது, ஓடுவது அல்லது சுறுசுறுப்பாக நடப்பது, டென்னிஸ் விளையாடுவது அல்லது நீந்துவது போன்ற விஷயங்களைச் செய்வதை என் சுவாசம் கடினமாக்குகிறது.') totalScore += 1;



    if (_selectedOptionQuestion13 == 'என்னால் விளையாட்டு விளையாடவோ மற்ற உடல் செயல்பாடுகளையோ செய்ய முடியாது') totalScore += 1;
    else if (_selectedOptionQuestion13 == 'பொழுதுபோக்கு அல்லது பொழுதுபோக்கிற்காக என்னால் வெளியே செல்ல முடியாது') totalScore += 2;
    else if (_selectedOptionQuestion13 == 'நான் ஷாப்பிங் செய்ய வீட்டை விட்டு வெளியே செல்ல முடியாது') totalScore += 3;
    else if (_selectedOptionQuestion13== 'என்னால் வீட்டு வேலைகளைச் செய்ய முடியாது') totalScore += 4;
    else if (_selectedOptionQuestion13 == 'நான் என் படுக்கை அல்லது நாற்காலியில் இருந்து வெகுதூரம் நகர முடியாது') totalScore += 5;




    if (_selectedOptionQuestion14 == 'நான் செய்ய விரும்பும் எதையும் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கவில்லை') totalScore += 1;
    else if (_selectedOptionQuestion14 == 'நான் செய்ய விரும்பும் ஒன்று அல்லது இரண்டு விஷயங்களைச் செய்வதிலிருந்து அவை என்னைத் தடுக்கவில்லை') totalScore += 2;
    else if (_selectedOptionQuestion14 == 'நான் செய்ய விரும்பும் பெரும்பாலான விஷயங்களைச் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கிறார்கள்') totalScore += 3;
    else if (_selectedOptionQuestion14 == 'நான் செய்ய விரும்பும் அனைத்தையும் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கிறார்கள்') totalScore += 4;



    return totalScore;
  }

  // Method to display an alert dialog with the total score
  Future<void> _submitScore(String type) async {
    int totalScore = _calculateTotalScore();
    String url = English; // Replace with your actual URL

    Map<String, dynamic> data = {
      "P_id": widget.userId,
      if (type == 'pre') "first_time_score": totalScore,
      if (type == 'post') "second_time_score": totalScore,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        String message = jsonResponse['message'];
        if (mounted) {
          _showTotalScoreAlert(totalScore, message);
          _navigateToGraphPage(totalScore);
        }
      } else {
        throw Exception('Failed to save data');
      }
    } catch (e) {
      if (mounted) {
        _showErrorAlert(e.toString());
      }
    }
  }

  void _navigateToGraphPage(int totalScore) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Query(userId: widget.userId, totalScore: totalScore),
      ),
          (Route<dynamic> route) => false, // Remove all previous routes
    );
  }



  void _showTotalScoreAlert(int totalScore, String message) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Total Score'),
            content: Text('Your total score is $totalScore\n$message'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showErrorAlert(String error) {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('St George Questionnaire'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "1) எனக்கு இருமல்",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('வாரத்தில் பெரும்பாலான நாட்கள்'),
                  value: 'வாரத்தில் பெரும்பாலான நாட்கள்',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('வாரத்தில் பல நாட்கள்'),
                  value: 'வாரத்தில் பல நாட்கள்',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('சுவாச நோய்த்தொற்றுடன் மட்டுமே'),
                  value: 'சுவாச நோய்த்தொற்றுடன் மட்டுமே',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எப்போதும் இல்லை'),
                  value: 'எப்போதும் இல்லை',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "2) நான் கபத்தை வளர்க்கிறேன்",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('வாரத்தில் பெரும்பாலான நாட்கள்'),
                  value: 'வாரத்தில் பெரும்பாலான நாட்கள்',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('வாரத்தில் பல நாட்கள்'),
                  value: 'வாரத்தில் பல நாட்கள்',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('சுவாச நோய்த்தொற்றுடன் மட்டுமே'),
                  value: 'சுவாச நோய்த்தொற்றுடன் மட்டுமே',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எப்போதும் இல்லை'),
                  value: 'எப்போதும் இல்லை',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "3) எனக்கு மூச்சுத் திணறல் உள்ளது",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('வாரத்தில் பெரும்பாலான நாட்கள்'),
                  value: 'வாரத்தில் பெரும்பாலான நாட்கள்',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('வாரத்தில் பல நாட்கள்'),
                  value: 'வாரத்தில் பல நாட்கள்',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('சுவாச நோய்த்தொற்றுடன் மட்டுமே'),
                  value: 'சுவாச நோய்த்தொற்றுடன் மட்டுமே',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எப்போதும் இல்லை'),
                  value: 'எப்போதும் இல்லை',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "4) எனக்கு மூச்சுத்திணறல் தாக்குதல்கள் உள்ளன",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('வாரத்தில் பெரும்பாலான நாட்கள்'),
                  value: 'வாரத்தில் பெரும்பாலான நாட்கள்',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('வாரத்தில் பல நாட்கள்'),
                  value: 'வாரத்தில் பல நாட்கள்',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('சுவாச நோய்த்தொற்றுடன் மட்டுமே'),
                  value: 'சுவாச நோய்த்தொற்றுடன் மட்டுமே',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எப்போதும் இல்லை'),
                  value: 'எப்போதும் இல்லை',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "5) கடந்த ஆண்டில் உங்களுக்கு எத்தனை நெஞ்சு வலி ஏற்பட்டது?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('3 அல்லது அதற்கு மேற்பட்ட தாக்குதல்கள்'),
                  value: '3 அல்லது அதற்கு மேற்பட்ட தாக்குதல்கள்',
                  groupValue: _selectedOptionQuestion5,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion5 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('1 அல்லது 2 தாக்குதல்கள்'),
                  value: '1 அல்லது 2 தாக்குதல்கள்',
                  groupValue: _selectedOptionQuestion5,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion5 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எப்போதும் இல்லை'),
                  value: 'எப்போதும் இல்லை',
                  groupValue: _selectedOptionQuestion5,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion5 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "6) உங்களுக்கு எவ்வளவு அடிக்கடி நல்ல நாட்கள் உள்ளன (சில சுவாச பிரச்சினைகள் உள்ளன)?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('நல்ல நாட்கள் இல்லை'),
                  value: 'நல்ல நாட்கள் இல்லை',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('சில நல்ல நாட்கள்'),
                  value: 'சில நல்ல நாட்கள்',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('பெரும்பாலான நாட்கள் நன்றாக இருக்கும்'),
                  value: 'பெரும்பாலான நாட்கள் நன்றாக இருக்கும்',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('ஒவ்வொரு நாளும் நல்ல நாளே'),
                  value: 'ஒவ்வொரு நாளும் நல்ல நாளே',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "7) உங்களுக்கு மூச்சுத்திணறல் இருந்தால், நீங்கள் காலையில் எழுந்தவுடன் மோசமாக இருக்கிறதா?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('ஆம்'),
                  value: 'ஆம்',
                  groupValue: _selectedOptionQuestion7,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion7 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('இல்லை'),
                  value: 'இல்லை',
                  groupValue: _selectedOptionQuestion7,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion7 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "8) உங்கள் சுவாசப் பிரச்சினைகளை எவ்வாறு விவரிக்க முடியும்?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('எனக்கு நிறைய பிரச்சினைகளை ஏற்படுத்துகின்றன அல்லது எனக்கு இருக்கும் மிக முக்கியமான உடல் பிரச்சினைகள்'),
                  value: 'எனக்கு நிறைய பிரச்சினைகளை ஏற்படுத்துகின்றன அல்லது எனக்கு இருக்கும் மிக முக்கியமான உடல் பிரச்சினைகள்',
                  groupValue: _selectedOptionQuestion8,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion8 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எனக்கு சில பிரச்சனைகளை ஏற்படுத்தும்'),
                  value: 'எனக்கு சில பிரச்சனைகளை ஏற்படுத்தும்',
                  groupValue: _selectedOptionQuestion8,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion8 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எந்த பிரச்சனையும் இல்லை'),
                  value: 'எந்த பிரச்சனையும் இல்லை',
                  groupValue: _selectedOptionQuestion8,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion8 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "9) எந்த நடவடிக்கைகள் பொதுவாக உங்களுக்கு மூச்சுத் திணறலை ஏற்படுத்துகின்றன என்பது பற்றிய கேள்வி. ஒவ்வொரு கூற்றுக்கும், இந்த நாட்களில் உங்களுக்கு எது பொருந்தும் என்று எனக்குக் கூறுங்கள்.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Column(
              children: [
                RadioListTile(
                  title: Text('மலைகளில் நடைபயிற்சி'),
                  value: 'மலைகளில் நடைபயிற்சி',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('படிக்கட்டுகளில் ஏறி நடப்பது'),
                  value: 'படிக்கட்டுகளில் ஏறி நடப்பது',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('சமதளத்தில் வெளியில் நடப்பது'),
                  value: 'சமதளத்தில் வெளியில் நடப்பது',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('வீட்டைச் சுற்றி நடப்பது'),
                  value: 'வீட்டைச் சுற்றி நடப்பது',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நீங்களே கழுவுதல் அல்லது ஆடை அணிதல'),
                  value: 'நீங்களே கழுவுதல் அல்லது ஆடை அணிதல',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),



            Text(
              "10) உங்கள் இருமல் மற்றும் மூச்சுத் திணறல் பற்றி மேலும் சில கேள்விகள். ஒவ்வொரு அறிக்கைக்கும், இந்த நாட்களில் உங்களுக்கு எது பொருந்தும் என்பதைச் சொல்லுங்கள்.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('இருமல் வலிக்கிறது'),
                  value: 'இருமல் வலிக்கிறது',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('இருமல் என்னை சோர்வடையச் செய்கிறது'),
                  value: 'இருமல் என்னை சோர்வடையச் செய்கிறது',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('பேசும் போது மூச்சு திணறுகிறது'),
                  value: 'பேசும் போது மூச்சு திணறுகிறது',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் குனியும் போது எனக்கு மூச்சுத் திணறல்'),
                  value: 'நான் குனியும் போது எனக்கு மூச்சுத் திணறல்',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் எளிதில் சோர்வடைகிறேன்'),
                  value: 'நான் எளிதில் சோர்வடைகிறேன்',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "11) உங்கள் மார்பு பிரச்சனை உங்கள் மீது ஏற்படுத்தக்கூடிய பிற விளைவுகள் பற்றிய கேள்விகள். ஒவ்வொரு அறிக்கைக்கும், இந்த நாட்களில் உங்களுக்கு எது பொருந்தும் என்பதை தயவுசெய்து சொல்லுங்கள்",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('என் இருமல் அல்லது சுவாசம் பொதுவில் சங்கடமாக இருக்கிறது'),
                  value: 'என் இருமல் அல்லது சுவாசம் பொதுவில் சங்கடமாக இருக்கிறது',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எனது சுவாச பிரச்சனைகள் எனது குடும்பத்தினர், நண்பர்கள் அல்லது அண்டை வீட்டாருக்கு தொந்தரவாக உள்ளது'),
                  value: 'எனது சுவாச பிரச்சனைகள் எனது குடும்பத்தினர், நண்பர்கள் அல்லது அண்டை வீட்டாருக்கு தொந்தரவாக உள்ளது',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('மூச்சு விட முடியாத போது நான் பயப்படுகிறேன் அல்லது பீதி அடைகிறேன்'),
                  value: 'மூச்சு விட முடியாத போது நான் பயப்படுகிறேன் அல்லது பீதி அடைகிறேன்',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('என் சுவாச பிரச்சனைகளை நான் கட்டுப்படுத்தவில்லை என்று உணர்கிறேன்'),
                  value: 'என் சுவாச பிரச்சனைகளை நான் கட்டுப்படுத்தவில்லை என்று உணர்கிறேன்',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('என் சுவாச பிரச்சனைகளால் நான் பலவீனமாகிவிட்டேன் அல்லது செல்லாதவனாக மாறிவிட்டேன்'),
                  value: 'என் சுவாச பிரச்சனைகளால் நான் பலவீனமாகிவிட்டேன் அல்லது செல்லாதவனாக மாறிவிட்டேன்',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('உடற்பயிற்சி எனக்கு பாதுகாப்பானது அல்ல'),
                  value: 'உடற்பயிற்சி எனக்கு பாதுகாப்பானது அல்ல',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('எல்லாமே அதிக முயற்சியாகத் தெரிகிறது'),
                  value: 'எல்லாமே அதிக முயற்சியாகத் தெரிகிறது',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "12) உங்கள் சுவாச பிரச்சனைகளால் உங்கள் செயல்பாடுகள் எவ்வாறு பாதிக்கப்படலாம் என்பது பற்றிய கேள்விகள் இவை. ஒவ்வொரு அறிக்கைக்கும், உங்கள் சுவாசத்தின் காரணமாக எந்த பொம்மை உங்களுக்குப் பொருந்தும் என்பதைச் சொல்லுங்கள்",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('நான் துவைக்க அல்லது ஆடை அணிவதற்கு நீண்ட நேரம் எடுத்துக்கொள்கிறேன்'),
                  value: 'நான் துவைக்க அல்லது ஆடை அணிவதற்கு நீண்ட நேரம் எடுத்துக்கொள்கிறேன்',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('என்னால் குளிக்கவோ அல்லது குளிக்கவோ முடியாது அல்லது நான் செய்ய நீண்ட நேரம் எடுக்கும்'),
                  value: 'என்னால் குளிக்கவோ அல்லது குளிக்கவோ முடியாது அல்லது நான் செய்ய நீண்ட நேரம் எடுக்கும்',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் மற்றவர்களை விட மெதுவாக நடக்கிறேன், அல்லது ஓய்வெடுக்க நிறுத்துகிறேன்'),
                  value: 'நான் மற்றவர்களை விட மெதுவாக நடக்கிறேன், அல்லது ஓய்வெடுக்க நிறுத்துகிறேன்',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('வீட்டு வேலைகள் போன்ற வேலைகள் நீண்ட நேரம் எடுக்கும், அல்லது நான் ஓய்வெடுக்க நிறுத்த வேண்டும்'),
                  value: 'வீட்டு வேலைகள் போன்ற வேலைகள் நீண்ட நேரம் எடுக்கும், அல்லது நான் ஓய்வெடுக்க நிறுத்த வேண்டும்',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் ஒரு படிக்கட்டு ஏறி நடந்தால், நான் நிறுத்த வேண்டும் அல்லது வேகத்தைக் குறைக்க வேண்டும்'),
                  value: 'நான் ஒரு படிக்கட்டு ஏறி நடந்தால், நான் நிறுத்த வேண்டும் அல்லது வேகத்தைக் குறைக்க வேண்டும்',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் அவசரப்பட்டால் அல்லது வேகமாக நடந்தால், நான் மெதுவாக செல்ல வேண்டும் அல்லது நிறுத்த வேண்டும்'),
                  value: 'நான் அவசரப்பட்டால் அல்லது வேகமாக நடந்தால், நான் மெதுவாக செல்ல வேண்டும் அல்லது நிறுத்த வேண்டும்',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('என் சுவாசம் மலைகளில் நடப்பது, படிக்கட்டுகளில் பொருட்களை எடுத்துச் செல்வது, திருமணம், நடனம், கிண்ணம் அல்லது கோல்ஃப் விளையாடுவது போன்ற சிறிய தோட்டக்கலை போன்றவற்றைச் செய்வதை கடினமாக்குகிறது.'),
                  value: 'என் சுவாசம் மலைகளில் நடப்பது, படிக்கட்டுகளில் பொருட்களை எடுத்துச் செல்வது, திருமணம், நடனம், கிண்ணம் அல்லது கோல்ஃப் விளையாடுவது போன்ற சிறிய தோட்டக்கலை போன்றவற்றைச் செய்வதை கடினமாக்குகிறது.',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('கனமான தோட்டம் அல்லது மண்வெட்டி பனியை எடுத்துச் செல்வது, ஓடுவது அல்லது சுறுசுறுப்பாக நடப்பது, டென்னிஸ் விளையாடுவது அல்லது நீந்துவது போன்ற விஷயங்களைச் செய்வதை என் சுவாசம் கடினமாக்குகிறது.'),
                  value: 'கனமான தோட்டம் அல்லது மண்வெட்டி பனியை எடுத்துச் செல்வது, ஓடுவது அல்லது சுறுசுறுப்பாக நடப்பது, டென்னிஸ் விளையாடுவது அல்லது நீந்துவது போன்ற விஷயங்களைச் செய்வதை என் சுவாசம் கடினமாக்குகிறது.',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "13) உங்கள் மார்பு பொதுவாக உங்கள் அன்றாட வாழ்க்கையை எவ்வாறு பாதிக்கிறது என்பதை நாங்கள் அறிய விரும்புகிறோம். ஒவ்வொரு அறிக்கைக்கும் உங்கள் சுவாசத்தின் காரணமாக எது உங்களுக்குப் பொருந்தும் என்பதைச் சொல்லுங்கள்",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('என்னால் விளையாட்டு விளையாடவோ மற்ற உடல் செயல்பாடுகளையோ செய்ய முடியாது'),
                  value: 'என்னால் விளையாட்டு விளையாடவோ மற்ற உடல் செயல்பாடுகளையோ செய்ய முடியாது',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('பொழுதுபோக்கு அல்லது பொழுதுபோக்கிற்காக என்னால் வெளியே செல்ல முடியாது'),
                  value: 'பொழுதுபோக்கு அல்லது பொழுதுபோக்கிற்காக என்னால் வெளியே செல்ல முடியாது',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் ஷாப்பிங் செய்ய வீட்டை விட்டு வெளியே செல்ல முடியாது'),
                  value: 'நான் ஷாப்பிங் செய்ய வீட்டை விட்டு வெளியே செல்ல முடியாது',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('என்னால் வீட்டு வேலைகளைச் செய்ய முடியாது'),
                  value: 'என்னால் வீட்டு வேலைகளைச் செய்ய முடியாது',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் என் படுக்கை அல்லது நாற்காலியில் இருந்து வெகுதூரம் நகர முடியாது'),
                  value: 'நான் என் படுக்கை அல்லது நாற்காலியில் இருந்து வெகுதூரம் நகர முடியாது',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13 = value as String?;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "14) உங்கள் சுவாச பிரச்சனைகள் உங்களை எவ்வாறு பாதிக்கிறது?தயவுசெய்து ஒரு பதிலைத் தேர்ந்தெடுக்கவும்",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('நான் செய்ய விரும்பும் எதையும் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கவில்லை'),
                  value: 'நான் செய்ய விரும்பும் எதையும் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கவில்லை',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் செய்ய விரும்பும் ஒன்று அல்லது இரண்டு விஷயங்களைச் செய்வதிலிருந்து அவை என்னைத் தடுக்கவில்லை'),
                  value: 'நான் செய்ய விரும்பும் ஒன்று அல்லது இரண்டு விஷயங்களைச் செய்வதிலிருந்து அவை என்னைத் தடுக்கவில்லை',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் செய்ய விரும்பும் பெரும்பாலான விஷயங்களைச் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கிறார்கள்'),
                  value: 'நான் செய்ய விரும்பும் பெரும்பாலான விஷயங்களைச் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கிறார்கள்',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('நான் செய்ய விரும்பும் அனைத்தையும் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கிறார்கள்'),
                  value: 'நான் செய்ய விரும்பும் அனைத்தையும் செய்வதிலிருந்து அவர்கள் என்னைத் தடுக்கிறார்கள்',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ElevatedButton(
              onPressed: () {
                _submitScore('pre');
              },
              child: Text('Submit (Pre)'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                _submitScore('post');
              },
              child: Text('Submit (Post)'),
            ),
          ],
        ),
      ),
    );
  }
}