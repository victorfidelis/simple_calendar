import 'package:flutter/material.dart';

class CalendarWeekDay extends StatelessWidget {
  final String weekLetter;

  const CalendarWeekDay({
    super.key,
    required this.weekLetter,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            weekLetter,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
