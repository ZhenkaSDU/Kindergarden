import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<String> students = [
    'John Doe',
    'Jane Smith',
    'Alex Johnson',
    'Sarah Williams',
    'Mike Davis',
  ];

  List<bool> attendanceStatus = List.filled(5, false);

  List<int> futureAbsences = [];

  void toggleAttendance(int index) {
    setState(() {
      if (attendanceStatus[index]) {
        attendanceStatus[index] = false;
      } else {
        attendanceStatus[index] = true;
        futureAbsences.add(index);
      }
    });
  }

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
              value: attendanceStatus[index],
              onChanged: (bool? value) {
                toggleAttendance(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle future absences
          print('Future absences: $futureAbsences');
        },
        label: Text('Save'),
        icon: Icon(Icons.save),
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
