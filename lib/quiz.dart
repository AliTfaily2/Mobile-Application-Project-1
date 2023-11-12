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
      double wrongAnswer = random.nextInt(y) * 1.0;
      if(wrongAnswer != correctAnswer && !options.contains(wrongAnswer)){
        options.add(wrongAnswer);
      }else{
        i--;
      }
    }
    options.shuffle();
    resultText = '';
    startTimer();
  }
  void checkAnswer(double selectedAnswer){
    if(selectedAnswer == correctAnswer){
      setState(() {
        resultText = 'CORRECT!';
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
        content: const Text('You ran out of Lives. Do you want to play again?'),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              lifeCounter = 3;
              generateQuestion();
            });
            Navigator.pop(context);
          }, child: const Text('Restart'))
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
            Text('$num1 ${widget.operation} $num2 =  ', style: const TextStyle(fontSize: 24),),
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
            Text('Lives: $lifeCounter', style: TextStyle(fontSize: 16),),
            Text(resultText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
