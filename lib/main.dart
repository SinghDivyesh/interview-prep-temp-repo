import 'package:flutter/material.dart';
import 'package:interview_practice/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Counter Screen", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pressed the counter button",style: TextStyle(fontSize: 28),),
            SizedBox(height: 10,),
            Text("$count",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    count= count+1;
                  });
                }, child: Icon(Icons.plus_one_rounded),),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    count= count-1;
                  });
                }, child: Icon(Icons.exposure_minus_1))
              ],

            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen( name: "Divyesh", age: 22,)));
            }, child: Text("Move to home Screen"))
          ],
        ),

      ),
    );
  }
}
