// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", fit: BoxFit.cover,),
          SizedBox(height: 20,), // for spacing
          Text("Welcome", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(children: [
              TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Username",
                labelText: "Username",
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true, // hides the input password
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text("Login"),
              style: TextButton.styleFrom(),
              onPressed: () {
                print("Hi Codepur");
              },
              )
            ],),
          ),
        ],
      ),
    );
  }
}