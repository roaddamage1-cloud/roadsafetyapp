import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(4, 60, 141, 20),
        title: Text("ALERT"),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "ID:",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "TIME:",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "PLACE:",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "INCIDENT:",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "PHONE NUMBER:",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10,),


            ],
          ) ,),
    );
  }
}
