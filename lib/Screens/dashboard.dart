import 'package:flutter/material.dart';
import 'package:to_do_clicks/Colors/colors.dart';

class dashboard extends StatelessWidget {
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
      body: Center(
        child: Text('Statistics Screen'),
      ),
    );
  }
}
