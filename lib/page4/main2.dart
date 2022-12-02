import 'package:flutter/material.dart';

import '../page3/home_page.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(Survey());
}

class Survey extends StatefulWidget {
  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _questions = const [
    {
      'questionText':
          'How much,if at all,have you read about cryptocurrency such as Bitcoin or Ethereum?',
      'answers': [
        {'text': 'A lot', 'score': 8},
        {'text': 'Some', 'score': 6},
        {'text': 'Not much', 'score': 4},
        {'text': 'Just hearing about it now in this survey', 'score': 2}
      ],
    },
    {
      'questionText':
          'How likely are you to invest in cryptocurrency next year?',
      'answers': [
        {'text': 'Extremely likely', 'score': 8},
        {'text': 'Very Likely', 'score': 6},
        {'text': 'Somewhat likely', 'score': 4},
        {'text': 'Not at all likely', 'score': 2}
      ],
    },
    {
      'questionText':
          'In your own opinion,which one is more risky investing in the stock market or cryptocurrency?',
      'answers': [
        {'text': 'Stock market', 'score': 2},
        {'text': 'Cryptocurrency', 'score': 8},
        {'text': 'Both are equally risky', 'score': 2}
      ],
    },
    {
      'questionText':
          'In your own opinion,which one is more profitable investing in the stock market or cryptocurrency?',
      'answers': [
        {'text': 'Stock market', 'score': 8},
        {'text': 'Cryptocurrency', 'score': 8},
        {'text': 'Both are equally profitable', 'score': 8}
      ],
    },
    {
      'questionText':
          'In 5 years do you think cryptocurrency will be worth more or less than today?',
      'answers': [
        {'text': 'Significantly more', 'score': 8},
        {'text': 'Somewhat more', 'score': 6},
        {'text': 'About the same', 'score': 4},
        {'text': 'Significantly less', 'score': 2}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  //reset method

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex); //prints to console
    if (_questionIndex < _questions.length) {
      print('hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text('Cryptocurrency Survey'),
          elevation: 3,
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
