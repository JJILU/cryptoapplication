import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You need to learn more about cryptocurrency';
    } else if (resultScore <= 16) {
      resultText =
          'Your knowledge about cryptocurrency is average and can be improved';
    } else if (resultScore <= 24) {
      resultText =
          'Your knowledge about cryptocurrency is slightly advanced and can be improved';
    } else if (resultScore <= 32) {
      resultText = 'Your knowledge about cryptocurrency is highly advanced';
    } else {
      resultText = '';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            padding: EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Text(
              resultPhrase,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          ElevatedButton(

            onPressed: resetHandler,
            child: Text('Restart Quiz'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal),
            ),
          )
        ],
      ),
    );
  }
}
