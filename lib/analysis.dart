import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF09A7A7),
        title: Text('Analysist'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular Chart Representation (Placeholder)
            Center(
              child: Container(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 0.6,
                      strokeWidth: 12,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF09A7A7),
                      ),
                    ),
                    Text(
                      '60%',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            // Project Details Heading
            Text(
              'Project Details',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF09A7A7),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Project Details Description
            Text(
              "L'Oréal has set itself the mission of offering all women and men worldwide the best of cosmetics innovation in terms of quality, efficacy and safety. Here's a look at the Group's latest stories.",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 30),
            // Project Specification Heading
            Text(
              'Project Specification:',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF09A7A7),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Usage Title
            Text(
              'Usage',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // Usage Details
            Text(
              'Voice encoding, music streaming and MP3 decoding',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 20),
            // Project Specification Description
            Text(
              "L'Oréal has set itself the mission of offering all women and men worldwide the best of cosmetics innovation in terms of quality, efficacy and safety. Here's a look at the Group's latest stories.",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 30),
            // Invest Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add the action for the button here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF09A7A7),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Invest',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

