import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 163, 89),
        title: Text("REGISTRATION"),centerTitle: true,),
        body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                hintText: "Name:",
                border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "Age:",
                border: OutlineInputBorder(),
              ),
              ),
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "gender:",
                border: OutlineInputBorder(),
              ),
              ),
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "Address:",
                border: OutlineInputBorder(),
              ),
              ),
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "Phone:",
                border: OutlineInputBorder(),
              ),
              ),
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(
                hintText: "Email:",
                border: OutlineInputBorder(),
              ),
              ),

           ElevatedButton(onPressed: (){}, child: Text("SUBMIT"))
         ],
        ), 
      ),
    );
  }
}