import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:roadsafetyapp/login.dart';
import 'package:roadsafetyapp/register.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  // Controllers
  final TextEditingController incidentController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController replyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Dio instance
  final Dio dio = Dio();

  // Function to send data to backend
  Future<void> sendComplaint() async {
  // change this

    final Map<String, dynamic> data = {
      "Incident": incidentController.text,
      "Description": descriptionController.text,
      "Status": statusController.text,
      'loginid':lid
    };

    try {
     final response = await dio.post("$baseurl/complaint", data: data);
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Complaint submitted successfully")),
        );
        // Clear the fields after submission
        incidentController.clear();
        descriptionController.clear();
        statusController.clear();
        replyController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.statusMessage}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text('COMPLAINT'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: incidentController,
                decoration: const InputDecoration(
                  hintText: "Incident",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Please enter incident" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Please enter description" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: statusController,
                decoration: const InputDecoration(
                  hintText: "Status",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
             
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendComplaint();
                  }
                },
                child: const Text("SUBMIT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
