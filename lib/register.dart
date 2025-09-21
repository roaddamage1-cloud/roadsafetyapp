import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("REGISTRATION"),
        centerTitle: true,
      ),
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

           ElevatedButton(onPressed: (){}, child: Text("Submit"))
         ],
        ), 
      ),
    );
  }
}