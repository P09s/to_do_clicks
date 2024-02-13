import 'package:flutter/material.dart';
import 'package:to_do_clicks/Colors/colors.dart';

class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Task> myProgressTasks = [
    Task(title: 'Task 1', description: 'Description for Task 1'),
    Task(title: 'Task 2', description: 'Description for Task 2'),
    // Add more tasks as needed
  ];

  List<Task> projectsTasks = [
    Task(
        title: 'Project Task 1', description: 'Description for Project Task 1'),
    Task(
        title: 'Project Task 2', description: 'Description for Project Task 2'),
    // Add more tasks as needed
  ];

  List<Task> pendingTasks = [
    Task(
        title: 'Pending Task 1', description: 'Description for Pending Task 1'),
    Task(
        title: 'Pending Task 2', description: 'Description for Pending Task 2'),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Hello,',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                SizedBox(width: 4),
                Text(
                  'User',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Have a nice day!',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColumn("My Tasks", 0),
              _buildColumn("Projects", 1),
              _buildColumn("Pending", 2),
            ],
          ),
          SizedBox(height: 16),
          _buildTaskList(),
        ],
      ),
    );
  }

  Widget _buildColumn(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: _selectedIndex == index
                  ? Colors.black.withOpacity(0.1)
                  : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: _selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: _selectedIndex == index ? Colors.black : Colors.grey,
              ),
            ),
            Container(
              height: 2,
              width: 30,
              color:
                  _selectedIndex == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    List<Task> selectedTasks = [];

    switch (_selectedIndex) {
      case 0:
        selectedTasks = myProgressTasks;
        break;
      case 1:
        selectedTasks = projectsTasks;
        break;
      case 2:
        selectedTasks = pendingTasks;
        break;
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: _selectedIndex == 0 ? 5 : 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: selectedTasks.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(selectedTasks[index].title),
                      subtitle: Text(selectedTasks[index].description),
                    ),
                    Divider(), // Add a divider between tasks
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
