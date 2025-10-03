import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor:Colors.deepOrange,
        title: Text("REPORT"),
        centerTitle: true,
      ),
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
                hintText: "INCIDENT:",
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
                hintText: "PHONE NUMBER:",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: "DESCRIPTION:",
                border: OutlineInputBorder()
              ),
            ),

            ElevatedButton(onPressed: (){}, child: Text("SUBMIT"))
          ],
        ) ,
      ),

    );
  }
}