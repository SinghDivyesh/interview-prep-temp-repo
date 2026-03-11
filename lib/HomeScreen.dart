import 'package:flutter/material.dart';
class Homescreen extends StatelessWidget {
  final String name;
  final int age;
  const Homescreen({super.key, required this.name, required this.age});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("This is home Screen")),
            Text("the name is:$name and age is:$age"),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Go back"))
          ],
        ),
      ),

    );
  }
}
