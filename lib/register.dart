import 'package:flutter/material.dart';
import 'email.dart'; // Import the EmailScreen

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedRole = 'Enterpriser'; // Default role
  int _uploadedDocuments = 0; // Counter for uploaded documents

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with curved decoration and logo
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF09A7A7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/shark_logo.png', // Your logo path
                  height: 150,
                ),
              ),
            ),
            SizedBox(height: 20),

            // "Create Profile" heading
            Text(
              "Create Profile",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Role selection buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Enterpriser button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedRole = 'Enterpriser';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedRole == 'Enterpriser'
                            ? Color(0xFF09A7A7)
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Enterpriser',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Inverter button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedRole = 'Inverter';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedRole == 'Inverter'
                            ? Color(0xFF09A7A7)
                            : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Inverter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Form fields
            _buildTextField("Enter your name", "Nikhil"),
            _buildTextField("Enter your Email", "@gmail.com"),
            _buildTextField("Enter your City", "Rajkot"),
            _buildTextField("Enter your phone number", "123-456-7890"),

            // Optional social media fields
            _buildTextField("LinkedIn (Optional)", "URL"),
            _buildTextField("Website (Optional)", "URL"),
            _buildTextField("Instagram (Optional)", "URL"),

            // Document upload button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Document Upload",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle document upload here
                      setState(() {
                        _uploadedDocuments++; // Simulate document upload
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF09A7A7),
                    ),
                    child: Text('Upload Document'),
                  ),
                ],
              ),
            ),

            // Display uploaded documents count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Documents uploaded: $_uploadedDocuments",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Clear and Submit buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Clear all fields and reset document count
                      setState(() {
                        _uploadedDocuments = 0;
                      });
                    },
                    child: Text("Clear"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to EmailScreen on submit
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmailVerificationScreen(), // Navigate to EmailScreen
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF09A7A7),
                    ),
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper function to create text fields
  Widget _buildTextField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
