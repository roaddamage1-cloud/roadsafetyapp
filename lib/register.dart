import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:roadsafetyapp/login.dart';



String baseurl='http://192.168.1.58:5000';
  final dio=Dio();


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

   // API object

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loading = false;
  

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerStudent() async {
    if (!_formKey.currentState!.validate()) return;

    // setState(() => _loading = true);

    final Map<String, dynamic> data = {
      "Username": _usernameController.text.trim(),
      "Password": _passwordController.text.trim(),
      "Name": _nameController.text.trim(),
      "Age": _ageController.text.trim(),
      "Gender": _genderController.text.trim(),
      "Address": _addressController.text.trim(),
      "Phone": _phoneController.text.trim(),
      "Email": _emailController.text.trim(),
     
    };
    print('***************************');
    print(data);

    try {
      print('data is:');
      final response = await dio.post("$baseurl/UserReg_api/", data: data);
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
          MaterialPageRoute(builder: (context) => Loginscreen()),
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
    } finally {
      setState(() => _loading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTRATION"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _field(_nameController, "Name", Icons.person),
                  _field(_ageController, "Age", Icons.cake,
                      type: TextInputType.number),
                  _field(_genderController, "Gender", Icons.wc),
                  _field(_addressController, "Address", Icons.home),
                  _field(_phoneController, "Phone", Icons.phone,
                      type: TextInputType.phone),
                  _field(_emailController, "Email", Icons.email,
                      type: TextInputType.emailAddress),
                  _field(_usernameController, "Username", Icons.person),
                  _field(_passwordController, "Password", Icons.lock,
                      isPassword: true),
                  const SizedBox(height: 30),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _registerStudent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "SUBMIT",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType type = TextInputType.text,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: type,
        validator: (value) =>
            value!.isEmpty ? "Please enter $label" : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.green),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
