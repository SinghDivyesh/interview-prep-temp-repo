import 'package:flutter/material.dart';
import 'package:interview_practice/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
   bool obscuretext = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Screen")),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome back!!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                labelText: "Enter Your email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordcontroller,
              obscureText: obscuretext,
              decoration: InputDecoration(
                  labelText: "Enter Your password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password_outlined),
                suffixIcon: GestureDetector( onTap: (){
                  setState(() {
                    obscuretext = false;
                  });
                },  child: Icon(Icons.remove_red_eye_outlined))
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              String email = emailcontroller.text;
              String pass = passwordcontroller.text;
              if (email.isEmpty||pass.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter all details")));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Welcome $email")));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen(name: "Divyesh", age: 22)));
              }
            }, child: Text("Login"),),

          ],
        ),
      ),
    );
  }
  void Dispose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
