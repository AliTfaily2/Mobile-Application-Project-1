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
        title: const Text('MyQuiz', style: TextStyle(fontSize: 27, color: Colors.lightGreenAccent,),),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            const Row(
              children: [
                SizedBox(width: 37,),
                Text('Choose an', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.black, backgroundColor: Colors.lightGreenAccent),),
                Text(' Operation:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.lightGreenAccent, backgroundColor: Colors.black),),
              ],
            ),
            const SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 125,child:
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> MyQuiz(operation: '+'),
                      ),
                  );
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent), child: Image.asset('assets/addition.png', width: 125, height: 125,),)),
                SizedBox(height: 125
                    ,child: ElevatedButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyQuiz(operation: '-',)));
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent), child: Image.asset('assets/subtraction.png', width: 125, height: 125,))
                )
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 125,child:
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> MyQuiz(operation: '/'),
                    ),
                  );
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent), child: Image.asset('assets/division.png', width: 125, height: 125,),
                )),
                SizedBox(height: 125,child:
                ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyQuiz(operation: 'x',)));
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,shadowColor: Colors.transparent), child: Image.asset('assets/multiplication.png', width: 125, height: 125,))
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
