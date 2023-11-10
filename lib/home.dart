import 'package:flutter/material.dart';
import 'quiz.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyQuiz', style: TextStyle(fontSize: 27),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            const Text('Choose one of the four operations:', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyQuiz(operation: '+'),
                      ),
                  );
                }, child: Image.asset('assets/addition.png', width: 100, height: 100,),),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyQuiz(operation: '-',)));
                }, child: Image.asset('assets/subtraction.png', width: 100, height: 100,))
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> MyQuiz(operation: 'x'),
                    ),
                  );
                }, child: Image.asset('assets/multiplication.png', width: 100, height: 100,),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyQuiz(operation: '/',)));
                }, child: Image.asset('assets/division.png', width: 100, height: 100,))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
