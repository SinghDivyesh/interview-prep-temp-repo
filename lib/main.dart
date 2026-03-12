import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school_outlined, size: 80, color: Colors.blueAccent),
              SizedBox(height: 20),
              Text(
                "Student Manager",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String passwowrd = passwordController.text.trim();
                    if (email.isEmpty || passwowrd.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter all the fields"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                    }
                    else{
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(email: email,)));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                  child: Text("Login",style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  final String email;

  HomeScreen({super.key, required this.email});
  final List<Map<String, String>> students = [
    {'name': 'Divyesh Singh', 'course': 'BCA', 'email': 'divyesh@gmail.com', 'city': 'Surat'},
    {'name': 'Rahul Sharma', 'course': 'MCA', 'email': 'rahul@gmail.com', 'city': 'Ahmedabad'},
    {'name': 'Priya Patel', 'course': 'BCA', 'email': 'priya@gmail.com', 'city': 'Vadodara'},
    {'name': 'Amit Shah', 'course': 'MBA', 'email': 'amit@gmail.com', 'city': 'Mumbai'},
    {'name': 'Sara Khan', 'course': 'BCA', 'email': 'sara@gmail.com', 'city': 'Surat'},
    {'name': 'Ravi Mehta', 'course': 'MCA', 'email': 'ravi@gmail.com', 'city': 'Rajkot'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:AppBar(title: Center(child: Text("Students")),backgroundColor: Colors.blueGrey,actions: [
        IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        }, icon: Icon(Icons.logout_outlined)),
      ],),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue[100],
            padding: EdgeInsets.all(16),
            child: Center(child: Text("Welcome $email",style: TextStyle(fontSize: 16,color: Colors.blue[900]),)),
          ),
          Expanded(child: ListView.builder(
            itemCount: students.length,
              itemBuilder: (context,index){
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
              elevation: 3,
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                    name:students[index]['name']!,
                    course:students[index]['course']!,
                    email:students[index]['email']!,
                    city:students[index]['city']!,
                  )
                  )
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    students[index]['name']![0],
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  students[index]['name']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  students[index]['course']!
                ),
                trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              ),
            );
          }))
        ],
      ),

    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name, course, email,city;
   DetailScreen({super.key,
     required this.name,
     required this.course,
     required this.email,
     required this.city
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Students Details",style: TextStyle(color: Colors.white),)),backgroundColor: Colors.blue,),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 20,),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue,
            child: Text(name[0],
            style: TextStyle(fontSize: 50,color: Colors.white),),
          ),
          SizedBox(height: 20,),
          Text(name,
          style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          inforow(Icons.school, "Course", course),
          inforow(Icons.email, "email", email),
          inforow(Icons.location_city, "city", city)
        ],
      ),),
    );
  }
}
Widget inforow(IconData icon,String label, String value){
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    padding:EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.blue[200]!),
    ),
    child: Row(
      children: [
        Icon(icon,color: Colors.blue,),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,style: TextStyle(color: Colors.grey,fontSize: 12)),
            Text(value,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
          ],
        )
      ],
    ),
  );

}
