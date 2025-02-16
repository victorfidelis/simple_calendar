import 'package:flutter/material.dart';
import 'package:simple_calendar/general/calendar_util.dart';

class CalendarHeader extends StatelessWidget {
  final int year;
  final int month;
  final Function() previousMonth;
  final Function() nextMonth;

  const CalendarHeader({
    required this.year,
    required this.month,
    required this.previousMonth,
    required this.nextMonth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String monthView = CalendarUtil.monthToText(month: month);

    return Row(
      children: [
        GestureDetector(
          onTap: previousMonth,
          child: const Icon(Icons.arrow_left, size: 28),
        ),
        const SizedBox(width: 8),
        Text(
          monthView,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '$year',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(child: Container()),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: nextMonth,
          child: const Icon(Icons.arrow_right, size: 28),
        ),
      ],
    );
  }
}
