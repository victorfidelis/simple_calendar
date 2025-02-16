import 'package:flutter/material.dart';
import 'package:simple_calendar/simple_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarView(),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendário',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: CalendarWidget(
          initialDate: DateTime(2025, 2, 10),
          finalDate: DateTime(2025, 12, 31),
          selectedDate: DateTime(2025, 2, 16),
          markedDates: [
            DateTime(2025, 2, 26),
            DateTime(2025, 2, 27),
            DateTime(2024, 8, 29),
            DateTime(2024, 8, 30),
            DateTime(2024, 9, 1),
            DateTime(2024, 9, 3),
            DateTime(2024, 9, 4),
          ],
          onSelectDate: (DateTime date) {},
        ),
      ),
    );
  }
}
