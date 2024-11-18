import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try1/common.dart';
import 'package:try1/querypt.dart';

class EnglishQuestion extends StatefulWidget {
  final String userId;

  const EnglishQuestion({
    required this.userId,
    Key?key,

}): super(key: key);


  @override
  _EnglishQuestionState createState() => _EnglishQuestionState();
}

class _EnglishQuestionState extends State<EnglishQuestion> {
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
    if (_selectedOptionQuestion1 == 'Most days a week') totalScore += 4;
    else if (_selectedOptionQuestion1 == 'Several days a week') totalScore += 3;
    else if (_selectedOptionQuestion1 == 'Only with respiratory infection') totalScore += 2;
    else if (_selectedOptionQuestion1 == 'Not at all') totalScore += 1;

    if (_selectedOptionQuestion2 == 'Most days a week') totalScore += 4;
    else if (_selectedOptionQuestion2 == 'Several days a week') totalScore += 3;
    else if (_selectedOptionQuestion2 == 'Only with respiratory infection') totalScore += 2;
    else if (_selectedOptionQuestion2 == 'Not at all') totalScore += 1;

    if (_selectedOptionQuestion3 == 'Most days a week') totalScore += 4;
    else if (_selectedOptionQuestion3 == 'Several days a week') totalScore += 3;
    else if (_selectedOptionQuestion3 == 'Only with respiratory infection') totalScore += 2;
    else if (_selectedOptionQuestion3 == 'Not at all') totalScore += 1;

    if (_selectedOptionQuestion4 == 'Most days a week') totalScore += 4;
    else if (_selectedOptionQuestion4 == 'Several days a week') totalScore += 3;
    else if (_selectedOptionQuestion4 == 'Only with respiratory infection') totalScore += 2;
    else if (_selectedOptionQuestion4 == 'Not at all') totalScore += 1;

    if (_selectedOptionQuestion5 == '3 or more attacks') totalScore += 3;
    else if (_selectedOptionQuestion5 == '1 or 2 attacks') totalScore += 2;
    else if (_selectedOptionQuestion5 == 'Not at all') totalScore += 1;

    if (_selectedOptionQuestion6 == 'No good days') totalScore += 4;
    else if (_selectedOptionQuestion6 == 'A few good days') totalScore += 3;
    else if (_selectedOptionQuestion6 == 'Most days are good') totalScore += 2;
    else if (_selectedOptionQuestion6 == 'Every day is good') totalScore += 1;


    if (_selectedOptionQuestion7 == 'Yes') totalScore += 2;
    else if (_selectedOptionQuestion7 == 'No') totalScore += 1;

    if (_selectedOptionQuestion8 == 'Cause me a lot of problems or are the most important physical problems I have') totalScore += 3;
    else if (_selectedOptionQuestion8 == 'Cause me a few problems') totalScore += 2;
    else if (_selectedOptionQuestion8 == 'Cause no problems') totalScore += 1;

    if (_selectedOptionQuestion9 == 'Walking up hills') totalScore += 1;
    else if (_selectedOptionQuestion9 == 'Walking up a flight of stairs') totalScore += 2;
    else if (_selectedOptionQuestion9 == 'Walking outside on the level ground') totalScore += 3;
    else if (_selectedOptionQuestion9 == 'Walking around the house') totalScore += 4;
    else if (_selectedOptionQuestion9 == 'Washing or dressing yourself') totalScore += 5;

    if (_selectedOptionQuestion10 == 'Coughing hurts') totalScore += 1;
    else if (_selectedOptionQuestion10 == 'Coughing makes me tired') totalScore += 2;
    else if (_selectedOptionQuestion10 == 'I am short of breathe when I talk') totalScore += 3;
    else if (_selectedOptionQuestion10== 'I am short of breathe when I bend over') totalScore += 4;
    else if (_selectedOptionQuestion10 == 'I get exhausted easily') totalScore += 5;

    if (_selectedOptionQuestion11 == 'my cough or breathing is embarrassing in public') totalScore += 1;
    else if (_selectedOptionQuestion11 == 'my respiratory problems are a nuisance to my family,friends,or neighbors') totalScore += 2;
    else if (_selectedOptionQuestion11 == 'I get afraid or panic when i cannot catch my breathe') totalScore += 3;
    else if (_selectedOptionQuestion11== 'I feel that i am not in control of my respiratory problems') totalScore += 4;
    else if (_selectedOptionQuestion11 == 'I have become frail or an invalid becuase of my respiratory problems') totalScore += 5;
    else if (_selectedOptionQuestion11 == 'Exercise is not safe for me') totalScore += 6;
    else if (_selectedOptionQuestion11 == 'Everything seems too much of an effort') totalScore += 7;


    if (_selectedOptionQuestion12 == 'I take a long time to get washed or dressed') totalScore += 8;
    else if (_selectedOptionQuestion12 == 'I cannot take a bath or shower or i take a long time to do') totalScore += 7;
    else if (_selectedOptionQuestion12 == 'I walk slower than other people,or i stop to rest') totalScore += 6;
    else if (_selectedOptionQuestion12== 'Jobs such as house chores take a long time,or i have to stop to rest') totalScore += 5;
    else if (_selectedOptionQuestion12 == 'If i walk up one flight of stairs,I have to stop or slow down') totalScore += 4;
    else if (_selectedOptionQuestion12 == 'if i hurry or walk fast,i have to go slowly or stop') totalScore += 3;
    else if (_selectedOptionQuestion12 == 'My breathing makes it difficult to do things such as walk up hills,carry things up stairs,do light gardening such as wedding,dance,bowl,or play golf') totalScore += 2;
    else if (_selectedOptionQuestion12 == 'My breathing makes it difficult to do things such as carry heavy loading garden or shovel snow,jog or walk briskly,play tennis or swim') totalScore += 1;



    if (_selectedOptionQuestion13 == 'I cannot play sports or do other physical activities') totalScore += 1;
    else if (_selectedOptionQuestion13 == 'I cannot go out for entertainment or recreation') totalScore += 2;
    else if (_selectedOptionQuestion13 == 'I cannot go out of the house to do shopping') totalScore += 3;
    else if (_selectedOptionQuestion13== 'I cannot do household chores') totalScore += 4;
    else if (_selectedOptionQuestion13 == 'I cannot move far from my bed or chair') totalScore += 5;




    if (_selectedOptionQuestion14 == 'They do not stop me from doing anything i would like to do') totalScore += 1;
    else if (_selectedOptionQuestion14 == 'They do not stop me from doing one or two things i would like to do') totalScore += 2;
    else if (_selectedOptionQuestion14 == 'They stop me from doing most of the things i would like to do') totalScore += 3;
    else if (_selectedOptionQuestion14 == 'They stop me from doing everything i would like to do') totalScore += 4;



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
              "1) I cough",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Most days a week'),
                  value: 'Most days a week',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Several days a week'),
                  value: 'Several days a week',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Only with respiratory infection'),
                  value: 'Only with respiratory infection',
                  groupValue: _selectedOptionQuestion1,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion1 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Not at all'),
                  value: 'Not at all',
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
              "2) I bring up phlegm",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Most days a week'),
                  value: 'Most days a week',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Several days a week'),
                  value: 'Several days a week',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Only with respiratory infection'),
                  value: 'Only with respiratory infection',
                  groupValue: _selectedOptionQuestion2,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion2 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Not at all'),
                  value: 'Not at all',
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
              "3) I have shortness of breath",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Most days a week'),
                  value: 'Most days a week',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Several days a week'),
                  value: 'Several days a week',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Only with respiratory infection'),
                  value: 'Only with respiratory infection',
                  groupValue: _selectedOptionQuestion3,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion3 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Not at all'),
                  value: 'Not at all',
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
              "4) I have attacks of wheezing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Most days a week'),
                  value: 'Most days a week',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Several days a week'),
                  value: 'Several days a week',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Only with respiratory infection'),
                  value: 'Only with respiratory infection',
                  groupValue: _selectedOptionQuestion4,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion4 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Not at all'),
                  value: 'Not at all',
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
              "5) How many attacks of chest trouble did you have during last year?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('3 or more attacks'),
                  value: '3 or more attacks',
                  groupValue: _selectedOptionQuestion5,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion5 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('1 or 2 attacks'),
                  value: '1 or 2 attacks',
                  groupValue: _selectedOptionQuestion5,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion5 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Not at all'),
                  value: 'Not at all',
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
              "6) How often do you have good days (few with respiratory problems)?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('No good days'),
                  value: 'No good days',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('A few good days'),
                  value: 'A few good days',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Most days are good'),
                  value: 'Most days are good',
                  groupValue: _selectedOptionQuestion6,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion6 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Every day is good'),
                  value: 'Every day is good',
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
              "7) If you have a wheeze, is it worse when you get up in the morning?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Yes'),
                  value: 'Yes',
                  groupValue: _selectedOptionQuestion7,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion7 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('No'),
                  value: 'No',
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
              "8) How could you describe your respiratory problems?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Cause me a lot of problems or are the most important physical problems I have'),
                  value: 'Cause me a lot of problems or are the most important physical problems I have',
                  groupValue: _selectedOptionQuestion8,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion8 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Cause me a few problems'),
                  value: 'Cause me a few problems',
                  groupValue: _selectedOptionQuestion8,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion8 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Cause no problems'),
                  value: 'Cause no problems',
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
              "9) Question about what activities usually make you feel breathless. For each statement, please tell me which applies to you these days.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Column(
              children: [
                RadioListTile(
                  title: Text('Washing or dressing yourself'),
                  value: 'Washing or dressing yourself',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Walking around the house'),
                  value: 'Walking around the house',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Walking outside on the level ground'),
                  value: 'Walking outside on the level ground',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Walking up a flight of stairs'),
                  value: 'Walking up a flight of stairs',
                  groupValue: _selectedOptionQuestion9,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion9 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Walking up hills'),
                  value: 'Walking up hills',
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
              "10) Some more questions about your cough and breathlessness. For each statement, please tell me which applies to you these days.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('Coughing hurts'),
                  value: 'Coughing hurts',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Coughing makes me tired'),
                  value: 'Coughing makes me tired',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I am short of breathe when I talk'),
                  value: 'I am short of breathe when I talk',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I am short of breathe when I bend over'),
                  value: 'I am short of breathe when I bend over',
                  groupValue: _selectedOptionQuestion10,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion10 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I get exhausted easily'),
                  value: 'I get exhausted easily',
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
              "11) Questions about other effects that your chest trouble may have on you. For each statement, please tell me which applies you these days",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('my cough or breathing is embarrasing in public'),
                  value: 'my cough or breathing is embarrasing in public',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('my respiratory problems are a nuisance to my family,friends,or neighbors'),
                  value: 'my respiratory problems are a nuisance to my family,friends,or neighbors',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I get afraid or panic when i cannot catch my breathe'),
                  value: 'I get afraid or panic when i cannot catch my breathe',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I have become frail or an invalid becuase of my respiratory problems'),
                  value: 'I have become frail or an invalid becuase of my respiratory problems',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I have become frail or an invalid becuase of my respiratory problems'),
                  value: 'I have become frail or an invalid becuase of my respiratory problems',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Exercise is not safe for me'),
                  value: 'Exercise is not safe for me',
                  groupValue: _selectedOptionQuestion11,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion11 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Everything seems too much of an effort'),
                  value: 'Everything seems too much of an effort',
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
              "12) These are questions about how your activities might be affected by your respiratory problems. For each statement, please tell me which applies toy you because of your breathing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('I take a long time to get washed or dressed'),
                  value: 'I take a long time to get washed or dressed',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I cannot take a bath or shower or i take a long time to do'),
                  value: 'I cannot take a bath or shower or i take a long time to do',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I walk slower than other people,or i stop to rest'),
                  value: 'I walk slower than other people,or i stop to rest',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Jobs such as house chores take a long time,or i have to stop to rest'),
                  value: 'Jobs such as house chores take a long time,or i have to stop to rest',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('If i walk up one flight of stairs,I have to stop or slow down'),
                  value: 'If i walk up one flight of stairs,I have to stop or slow down',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('if i hurry or walk fast,i have to go slowly or stop'),
                  value: 'if i hurry or walk fast,i have to go slowly or stop',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('My breathing makes it difficult to do things such as walk up hills,carry things up stairs,do light gardening such as wedding,dance,bowl,or play golf'),
                  value: 'My breathing makes it difficult to do things such as walk up hills,carry things up stairs,do light gardening such as wedding,dance,bowl,or play golf',
                  groupValue: _selectedOptionQuestion12,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion12 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('My breathing makes it difficult to do things such as carry heavy loadig garden or shovel snow,jog or walk briskly,play tennis or swim'),
                  value: 'My breathing makes it difficult to do things such as carry heavy loadig garden or shovel snow,jog or walk briskly,play tennis or swim',
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
              "13) We should like to know how your chest usually effects your daily life. For each statement please tell me which applies to you because of your breathing",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('I cannot play sports or do other physical activities'),
                  value: 'I cannot play sports or do other physical activities',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I cannot go out for entertainment or recreation'),
                  value: 'I cannot go out for entertainment or recreation',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I cannot go out of the house to do shopping'),
                  value: 'I cannot go out of the house to do shopping',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13= value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I cannot do household chores'),
                  value: 'I cannot do household chores',
                  groupValue: _selectedOptionQuestion13,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion13 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('I cannot move far from my bed or chair'),
                  value: 'I cannot move far from my bed or chair',
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
              "14)how do your respiratory problems affects you?Please pick one response",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text('They do not stop me from doing anything i would like to do'),
                  value: 'They do not stop me from doing anything i would like to do',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('They do not stop me from doing one or two things i would like to do'),
                  value: 'They do not stop me from doing one or two things i would like to do',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('They stop me from doing most of the things i would like to do'),
                  value: 'They stop me from doing most of the things i would like to do',
                  groupValue: _selectedOptionQuestion14,
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionQuestion14 = value as String?;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('They stop me from doing everything i would like to do'),
                  value: 'They stop me from doing everything i would like to do',
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