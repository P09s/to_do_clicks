import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_clicks/Colors/colors.dart';

class Task {
  final String title;
  final String description;
  final DateTime date;

  Task({
    required this.title,
    required this.description,
    required this.date,
  });
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDate;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    tasks = getTasksForDate(_selectedDate);
  }

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
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildCalendar(),
            SizedBox(height: 20),
            Text(
              'Tasks for ${DateFormat('MMMM dd, yyyy').format(_selectedDate)}:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: _buildTaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _selectedDate = _selectedDate.subtract(Duration(days: 7));
              tasks = getTasksForDate(_selectedDate);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        Text(
          DateFormat('MMMM yyyy').format(_selectedDate),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _selectedDate = _selectedDate.add(Duration(days: 7));
              tasks = getTasksForDate(_selectedDate);
            });
          },
          icon: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    List<Widget> rows = [];

    for (int i = 0; i < 5; i++) {
      List<Widget> days = [];

      for (int j = 0; j < 7; j++) {
        DateTime day = _selectedDate
            .subtract(Duration(days: _selectedDate.weekday - 1))
            .add(Duration(days: (i * 7) + j));

        days.add(
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = day;
                  tasks = getTasksForDate(_selectedDate);
                });
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: isSameDay(day, _selectedDate) ? Colors.black : null,
                ),
                child: Text(
                  DateFormat('d').format(day),
                  style: TextStyle(
                    fontWeight:
                        isSameDay(day, _selectedDate) ? FontWeight.bold : null,
                    color: isSameDay(day, _selectedDate) ? Colors.white : null,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      rows.add(
        Row(
          children: days,
        ),
      );
    }

    return Column(
      children: rows,
    );
  }

  Widget _buildTaskList() {
    if (tasks.isEmpty) {
      return Center(
        child: Text('No tasks for selected date.'),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].description),
        );
      },
    );
  }

  List<Task> getTasksForDate(DateTime date) {
    // Replace this with your logic to fetch tasks for the selected date
    // For now, returning dummy tasks
    return [
      Task(
        title: 'Task 1',
        description: 'Description for Task 1',
        date: DateTime(date.year, date.month, date.day, 8, 0),
      ),
      Task(
        title: 'Task 2',
        description: 'Description for Task 2',
        date: DateTime(date.year, date.month, date.day, 10, 0),
      ),
    ];
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
