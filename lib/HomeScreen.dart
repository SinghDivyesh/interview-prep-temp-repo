import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  final String name;
  final int age;
  final List<Map<String, String>> Students = [
    {'name': 'Divyesh', 'course': 'BCA', 'email': 'diveysh@gmail.com'},
    {'name': 'Rahul', 'course': 'MCA', 'email': 'rahul@gmail.com'},
    {'name': 'Priya', 'course': 'BCA', 'email': 'priya@gmail.com'},
    {'name': 'Amit', 'course': 'MBA', 'email': 'amit@gmail.com'},
    {'name': 'Sara', 'course': 'BCA', 'email': 'sara@gmail.com'},
  ];
  Homescreen({super.key, required this.name, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Fruits list of $name")),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: Students.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      name: Students[index]['name']!,
                      course: Students[index]['course']!,
                      email: Students[index]['email']!,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(
                  Students[index]["name"]![0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                Students[index]['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(Students[index]['course']!),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name, course, email;
  const DetailScreen({
    super.key,
    required this.name,
    required this.course,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name),backgroundColor: Colors.blueAccent,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(name[0],style: TextStyle(fontSize: 40,color: Colors.white),),
            ),
            SizedBox(height: 20,),
            Text(name,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(course,style: TextStyle(fontSize: 28,fontWeight:FontWeight.w500),),
            SizedBox(height: 10,),
            Text(email,style: TextStyle(fontSize: 28,fontWeight:FontWeight.w400),),
          ],
        ),
      ),
    );
  }
}
