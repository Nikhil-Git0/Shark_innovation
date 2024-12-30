import 'package:flutter/material.dart';
import 'create.dart'; // Import the create page here

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1; // Set default to Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF09A7A7),
        foregroundColor: Colors.white,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile picture
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey),
            ),
            SizedBox(height: 10),
            // Username, Role, About Self
            Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Role',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'About Self',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            // Project icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildProjectIcon()),
            ),
            SizedBox(height: 20),
            // My Projects Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My Project's",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // Project details
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Details',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  // Delete Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle delete action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white, // background color
                    ),
                    child: Text('Delete'),
                  ),
                  SizedBox(height: 30),
                  // Feedback Section
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'All Feedback is visible here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Use the current index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
          if (index == 0) {
            // Navigate to home screen if necessary
            Navigator.pop(context); // Example: Go back to the previous screen
          } else if (index == 2) {
            // Navigate to the create page when the Create button is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: "Create",
          ),
        ],
        selectedItemColor: Colors.white, // Selected icon color
        unselectedItemColor: Colors.grey, // Unselected icon color
        backgroundColor: Color(0xFF09A7A7), // Set background to white
      ),
    );
  }
}

// Widget to build project icon
Widget _buildProjectIcon() {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Color(0xFF09A7A7),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
