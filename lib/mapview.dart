import 'package:flutter/material.dart';

class Mapview extends StatefulWidget {
  const Mapview({super.key});

  @override
  _MapviewState createState() => _MapviewState();
}

class _MapviewState extends State<Mapview> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _incidentController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void dispose() {
    _timeController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    _incidentController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      _dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      _timeController.text = "$hour:$minute";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapview"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Date"),
              _buildDateField(),

              const SizedBox(height: 20),

              _buildLabel("Time"),
              _buildTimeField(),

              const SizedBox(height: 20),

              _buildLabel("Location"),
              _buildTextField(
                controller: _locationController,
                hint: "Enter location",
                icon: Icons.location_on,
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Please enter location' : null,
              ),

              const SizedBox(height: 20),

              _buildLabel("Incident"),
              _buildTextField(
                controller: _incidentController,
                hint: "Describe the incident",
                icon: Icons.report_problem,
                maxLines: 4,
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Please describe the incident' : null,
              ),

              const SizedBox(height: 20),

              _buildLabel("Status"),
              _buildTextField(
                controller: _statusController,
                hint: "Enter status",
                icon: Icons.info_outline,
                validator: (val) =>
                    val == null || val.trim().isEmpty ? 'Please enter status' : null,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add submit logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data submitted successfully!"),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                  ),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, color: Colors.redAccent) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
    );
  }

  Widget _buildDateField() {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      validator: (val) => val == null || val.isEmpty ? 'Please select date' : null,
      decoration: InputDecoration(
        hintText: "Select date",
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.redAccent),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
      onTap: () => _selectDate(context),
    );
  }

  Widget _buildTimeField() {
    return TextFormField(
      controller: _timeController,
      readOnly: true,
      validator: (val) => val == null || val.isEmpty ? 'Please select time' : null,
      decoration: InputDecoration(
        hintText: "Select time",
        prefixIcon: const Icon(Icons.access_time, color: Colors.redAccent),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
      onTap: () => _selectTime(context),
    );
  }
}
