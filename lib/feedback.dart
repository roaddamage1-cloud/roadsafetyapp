import 'package:flutter/material.dart';

class Feedbackpage extends StatelessWidget {
  const Feedbackpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("FEEDBACK"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "id:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "rating:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "review:",
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