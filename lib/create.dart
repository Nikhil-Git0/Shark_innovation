import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
        backgroundColor: Color(0xFF09A7A7),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 16),
              
              // Post Title
              Text('Post Title', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter post title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Post Invest OR Approach
              Text('Post Invest OR Approach', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Invest OR Approach',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Post Details
              Text('Post Details', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter post details',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Post Thumbnail
              Text('Post Thumbnail', style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  // Handle choose thumbnail
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('Choose post thumbnail')),
                ),
              ),
              SizedBox(height: 16),

              // Post Document
              Text('Post Document', style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  // Handle choose document
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('Choose post Document')),
                ),
              ),
              SizedBox(height: 16),

              // Post Video
              Text('Post Video', style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  // Handle choose video
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('Choose post video')),
                ),
              ),
              SizedBox(height: 32),

              // Upload Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle upload
                  },
                  child: Text('upload'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
