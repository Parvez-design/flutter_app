import './quiz.dart';
import 'package:flutter/material.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
        {'text': 'Yellow', 'score': 2},
        {'text': 'Green', 'score': 4},
      ]
    },
    {
      'questionText': 'what\'s your favourite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 5},
        {'text': 'Dog', 'score': 3},
      ]
    },
    {
      'questionText': 'who\'s your Inspiration',
      'answers': [
        {'text': 'Virat Kohli', 'score': 5},
        {'text': 'Satya Nadella', 'score': 5},
        {'text': 'Sundar Pichai', 'score': 5},
        {'text': 'Tesla', 'score': 5},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex)
                : Result(_totalscore, _resetQuiz)));
  }
}
