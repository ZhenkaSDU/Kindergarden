import 'package:flutter/material.dart';

class AttendanceScreen extends StatelessWidget {
  final List<String> students = [
    'John Doe',
    'Jane Smith',
    'Alex Johnson',
    'Sarah Williams',
    'Mike Davis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index]),
            trailing: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttendanceScreen(),
    );
  }
}
