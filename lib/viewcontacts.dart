import 'package:flutter/material.dart';

class ViewContacts extends StatefulWidget {
  const ViewContacts({super.key});

  @override
  State<ViewContacts> createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  // 🔸 Static list of contact entries
  final List<Map<String, String>> _contacts = [
    {
      'contact': '9876543210',
      'department': 'Police Department',
      'place': 'Downtown',
      'email': 'police@city.gov',
    },
    {
      'contact': '9123456789',
      'department': 'Fire Department',
      'place': 'City Center',
      'email': 'firedept@city.gov',
    },
    {
      'contact': '9988776655',
      'department': 'Hospital',
      'place': 'Uptown',
      'email': 'hospital@city.gov',
    },
    {
      'contact': '9111223344',
      'department': 'PWD',
      'place': 'West End',
      'email': 'roaddamage@city.gov',
    },

  ];

  // 🔹 Filter and search
  String? _selectedDepartment;
  String _searchQuery = '';

  // 🔹 Filtered list logic
  List<Map<String, String>> get _filteredContacts {
    List<Map<String, String>> filtered = _contacts;

    if (_selectedDepartment != null && _selectedDepartment!.isNotEmpty) {
      filtered = filtered
          .where((c) =>
              c['department']!.toLowerCase() ==
              _selectedDepartment!.toLowerCase())
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((c) => c.values.any(
              (v) => v.toLowerCase().contains(_searchQuery.toLowerCase())))
          .toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CONTACT DIRECTORY"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔸 Filter & Search Section
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: _selectedDepartment,
                    hint: const Text("Filter by Department"),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                    ),
                    items: _contacts
                        .map((e) => e['department']!)
                        .toSet()
                        .map((dept) =>
                            DropdownMenuItem(value: dept, child: Text(dept)))
                        .toList(),
                    onChanged: (val) {
                      setState(() => _selectedDepartment = val);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: (val) => setState(() => _searchQuery = val),
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.deepOrange),
                  onPressed: () {
                    setState(() {
                      _selectedDepartment = null;
                      _searchQuery = '';
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🔸 Contact List Section
            Expanded(
              child: _filteredContacts.isEmpty
                  ? const Center(
                      child: Text(
                        "No contacts found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _filteredContacts.length,
                      itemBuilder: (context, index) {
                        final contact = _filteredContacts[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: const Icon(Icons.phone,
                                color: Colors.deepOrange),
                            title: Text(
                              contact['department']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Contact: ${contact['contact']}"),
                                  Text("Place: ${contact['place']}"),
                                  Text("E-mail: ${contact['email']}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
