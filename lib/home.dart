import 'package:flutter/material.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyQuiz(operation: '+'),
                      ),
                  );
                }, child: child)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
