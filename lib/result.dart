import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;
  final Function resetHandler;

  Result(this.resultscore, this.resetHandler);
  String get resultphrase {
    String resultText;
    if (resultscore <= 8) {
      resultText = 'You are Strange';
    } else if (resultscore > 6 && resultscore < 12) {
      resultText = 'You are Pretty Likeable';
    } else {
      resultText = 'You are Innocent and Awesome';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultphrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
