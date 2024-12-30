import 'package:flutter/material.dart';
import 'profile.dart'; // Import the profile screen
import 'analysis.dart'; // Import the Analysis page

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Color(0xFF09A7A7), // Set background to teal
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Trending Ideas"),
            Tab(text: "Startups"),
          ],
          labelColor: Colors.white, // Tab text color when selected
          unselectedLabelColor: Colors.grey, // Tab text color when unselected
          indicatorColor: Color(0xFF09A7A7), // Indicator color (same as theme)
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // First tab: Trending Ideas
          ListView.builder(
            itemCount: 3, // Number of items for trending ideas
            itemBuilder: (context, index) {
              return IdeaCard(); // Your trending idea card
            },
          ),

          // Second tab: Startups
          ListView.builder(
            itemCount: 3, // Number of items for startups
            itemBuilder: (context, index) {
              return StartupCard(); // Your startup card
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Navigate to ProfileScreen when Profile button is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
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
        backgroundColor: Color(0xFF09A7A7), // Set background to teal
      ),
    );
  }
}

// No changes to the Trending Ideas card
class IdeaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username and Details
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Details"),

            // Approve and Reject buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF09A7A7),
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Approve"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Reject"),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Feedback input field
            TextField(
              decoration: InputDecoration(
                hintText: "Feedback",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Updated layout for the Startups card based on your provided design
class StartupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username and Details for startups
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: Icon(Icons.business, color: Colors.white),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Details about startup..."),
                  ],
                ),
              ],
            ),
            SizedBox(height: 100),

            // Explore More Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the AnalysisPage when the button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnalysisPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF09A7A7),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 40), // Full-width button
              ),
              child: Text("Explore More"),
            ),
          ],
        ),
      ),
    );
  }
}
