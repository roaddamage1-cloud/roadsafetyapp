import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:roadsafetyapp/homescreen.dart';
import 'package:roadsafetyapp/login.dart';
import 'dart:convert';

import 'package:roadsafetyapp/register.dart';

class Feedbackpage extends StatefulWidget {
  const Feedbackpage({super.key});

  @override
  State<Feedbackpage> createState() => _FeedbackpageState();
}

class _FeedbackpageState extends State<Feedbackpage> {
  double rating = 0.0;        // ⭐ rating value
  final TextEditingController reviewController = TextEditingController();
  

  // 🔥 Function to send feedback to backend
  Future<void> submitFeedback() async {
    // backend endpoint

    final body = {
      // "USERID": lid,
      "Rating": rating,
      "Review": reviewController.text,
    };

    
   try {
      print('data is:');
      final response = await dio.post("$baseurl/feedback/$lid/", data: body);
      print(response);

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("✅ Registration successful!"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
        
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("❌ Error: ${response.statusMessage}"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on DioError catch (e) {
      final message = e.response?.data.toString() ?? e.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("⚠️ Failed: $message"),
          backgroundColor: Colors.red,
        ),
      );
    } 
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: const Text(
          "FEEDBACK",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Rating", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),

                // ⭐⭐⭐⭐⭐ Star Rating
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (value) {
                    setState(() => rating = value);
                  },
                ),

                const SizedBox(height: 20),

                const Text("Review",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),

                TextFormField(
                  controller: reviewController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Write your review here...",
                    filled: true,
                    fillColor: Colors.grey[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: submitFeedback, // 🔥 Submit function called here
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.shade900,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
