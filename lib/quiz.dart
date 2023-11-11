import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MyQuiz extends StatefulWidget {
  final String operation;
  const MyQuiz({required this.operation,super.key});

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  Random random = Random();
  int num1 = 0, num2 = 0, correctAnswer = 0;
  List<int> options = [];
  String resultText = '';
  int lifeCounter = 3;
  int countdown = 10;
  late Timer timer;

  @override
  void initState(){
    super.initState();
    startTimer();
    generateQuestion();
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(countdown > 0){
          countdown--;
        }
        else{
          lifeCounter--;
          generateQuestion();
        }
      });
    });
  }
  void resetTimer(){
    setState(() {
      countdown = 10;
    });
  }
  void generateQuestion(){
    resetTimer();
    timer.cancel();
    if(lifeCounter == 0){
      showRestartDialog();
      return;
    }
    num1 = random.nextInt(10);
    num2 = random.nextInt(10);

    switch(widget.operation){
      case '+':
        correctAnswer = num1 + num2;
        break;
      case '-':
        correctAnswer = num1 - num2;
        break;
      case 'x':
        correctAnswer = num1 * num2;
      case '/':
        num2 = random.nextInt(9)+1;
        correctAnswer = num1 ~/ num2;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
