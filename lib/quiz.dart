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
  double num1 = 0, num2 = 0, correctAnswer = 0;
  List<double> options = [];
  String resultText = '';
  int lifeCounter = 3;
  int countdown = 10;
  late Timer timer;
  String header = '';
  int x = 0;
  int y = 39;
  int count = 0;

  @override
  void initState(){
    super.initState();
    startTimer();
    generateQuestion();
  }
  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
  void won(){

    if(count == 10){
      showWonDialog();
      return;
    }
  }
  void generateQuestion(){
    resetTimer();
    timer.cancel();
    won();
    if(lifeCounter == 0){
      showRestartDialog();
      return;
    }


    switch(widget.operation){
      case '+':
        num1 = random.nextInt(19) + 1.0;
        num2 = random.nextInt(19) + 1.0;
        correctAnswer = num1 + num2;
        header = 'Addition';
        break;
      case '-':
        num1 = random.nextInt(19) + 1.0;
        num2 = random.nextInt(19) + 1.0;
        correctAnswer = num1 - num2;
        header = 'Subtraction';
        break;
      case 'x':
        num1 = random.nextInt(9) +1.0;
        num2 = random.nextInt(9) +1.0;
        y = 100;
        correctAnswer = num1 * num2;
        header = 'Multiplication';
      case '/':
        num1 = random.nextInt(9) + 1.0;
        num2 = random.nextInt(9) + 1.0;
        correctAnswer = num1 / num2;
        x = 1;
        header = 'Division';
        break;
    }
    options = [correctAnswer];
    for(int i=0; i < 3; i++){
      double wrongAnswer = 0;
      if(widget.operation == '/') {
        wrongAnswer = random.nextDouble() * 10.0;
      }else{
        wrongAnswer = random.nextInt(y) * 1.0;
      }
      if(!options.contains(wrongAnswer)){
        options.add(wrongAnswer);
      }else{
        i--;
      }
    }
    options.shuffle();
    startTimer();
    resultText = '';
  }
  void checkAnswer(double selectedAnswer){
    if(selectedAnswer == correctAnswer){
      setState(() {
        resultText = 'CORRECT!';
        count++;
      });
    }else{
      setState(() {
        resultText = 'INCORRECT!';
        lifeCounter--;
      });
    }
    generateQuestion();
  }
  void showRestartDialog(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Game Over'),
        content: const Text('You lost all your lives. Do you want to play again?'),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              lifeCounter = 3;
              count = 0;
              generateQuestion();
            });
            Navigator.of(context).pop();
          }, child: const Text('Restart')),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Go Home'),
          ),
        ],
      );
    });
  }
  void showWonDialog(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Congrats!'),
        content: const Text('You answered 10 questions correctly!!.Do you want to play again?'),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              lifeCounter = 3;
              count = 0;
              generateQuestion();
            });
            Navigator.of(context).pop();
          }, child: const Text('Restart')),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Go Home'),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyQuiz - $header'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('${num1.toInt()} ${widget.operation} ${num2.toInt()} =  ', style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 20,),
            Column(
              children: [
                ElevatedButton(onPressed:(){
                    timer.cancel();
                    checkAnswer(options[0]);
                  }, child: Text(options[0].toStringAsFixed(x)),),
                ElevatedButton(onPressed:(){
                  timer.cancel();
                  checkAnswer(options[1]);
                }, child: Text(options[1].toStringAsFixed(x))),
                ElevatedButton(onPressed:(){
                  timer.cancel();
                  checkAnswer(options[2]);
                }, child: Text(options[2].toStringAsFixed(x))),
                ElevatedButton(onPressed:(){
                  timer.cancel();
                  checkAnswer(options[3]);
                }, child: Text(options[3].toStringAsFixed(x)))
              ],
            ),
            const SizedBox(height: 20,),
            Text('Time left: $countdown seconds', style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 20,),
            Text('Lives: $lifeCounter', style: const TextStyle(fontSize: 16),),
            Text(resultText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
