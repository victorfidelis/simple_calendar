import 'package:flutter/material.dart';
import 'package:simple_calendar/models/calendar_day_model.dart';

class CalendarDay extends StatelessWidget {
  final CalendarDayModel calendarDay;
  final Function({required DateTime date}) onSelectDate;

  const CalendarDay({
    super.key,
    required this.calendarDay,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    Color fontColor = Colors.black;
    Color backgroundColor = Colors.transparent;
    if (calendarDay.isSelectedDay) {
      fontColor = Theme.of(context).colorScheme.onSecondary;
      backgroundColor = Theme.of(context).colorScheme.secondary;
    } else if (calendarDay.isMarkedDay) {
      fontColor = Theme.of(context).colorScheme.onPrimary;
      backgroundColor = Theme.of(context).colorScheme.primary;
    } else if (!calendarDay.isCurrentMonth) {
      fontColor = Theme.of(context).colorScheme.shadow;
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          onSelectDate(date: calendarDay.date);
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${calendarDay.date.day}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fontColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
