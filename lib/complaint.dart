import 'package:flutter/material.dart';

class Complaint extends StatelessWidget {
  const Complaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("COMPLAINT"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "ID:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "INCIDENT:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "DESCRIPTION:",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "STATUS:",
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