import 'package:flutter/material.dart';
import 'package:to_do_clicks/Colors/colors.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle),
            SizedBox(width: 8),
            Column(
              children: [
                Text('To-Do Clicks'),
                Text('Task Tunes',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-vector/app-development-banner_33099-1720.jpg?w=826&t=st=1706116827~exp=1706117427~hmac=70c216d07399b1b4fc8cea9137e00575ff83864172e520d8062e99c765a00863"), // Replace with the actual path or network URL for the profile image
            ),
            SizedBox(height: 16),
            Text(
              'Parag Sharma',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Software Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            _buildInfoItem('Email', 'parag.example@example.com'),
            _buildInfoItem('Phone', '999 999 9999'),
            _buildInfoItem('Location', 'City, Country'),
            // Add more info items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label + ':',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
