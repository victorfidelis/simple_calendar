
import 'package:flutter/material.dart';
import 'package:simple_calendar/general/calendar_util.dart';
import 'package:simple_calendar/models/calendar_day_model.dart';
import 'package:simple_calendar/widgets/calendar_day.dart';
import 'package:simple_calendar/widgets/calendar_week_day.dart';

class CalendarBody extends StatefulWidget {
  final int year;
  final int month;
  final Function({required DateTime date}) onSelectDate;
  final DateTime? selectedDate;
  final List<DateTime> markedDates;

  const CalendarBody({
    super.key,
    required this.year,
    required this.month,
    required this.onSelectDate,
    this.selectedDate,
    this.markedDates = const [],
  });

  @override
  State<CalendarBody> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends State<CalendarBody> {
  late DateTime firstDayOfMonth;

  late DateTime lastDayOfMonth;

  late DateTime previousMonth;

  late DateTime nextMonth;

  List<CalendarDayModel> firstWeek = [];

  List<CalendarDayModel> secondWeek = [];

  List<CalendarDayModel> thirdWeek = [];

  List<CalendarDayModel> fourthWeek = [];

  List<CalendarDayModel> fifthWeek = [];

  List<CalendarDayModel> sixthWeek = [];

  @override
  Widget build(BuildContext context) {
    doFirstAndLastDay();
    doPreviousAndNextMonth();
    doAllWeeks();

    return Column(
      children: [
        Row(
          children: [
            CalendarWeekDay(weekLetter: 'D'),
            CalendarWeekDay(
              weekLetter: 'S',
            ),
            CalendarWeekDay(
              weekLetter: 'T',
            ),
            CalendarWeekDay(
              weekLetter: 'Q',
            ),
            CalendarWeekDay(
              weekLetter: 'Q',
            ),
            CalendarWeekDay(
              weekLetter: 'S',
            ),
            CalendarWeekDay(
              weekLetter: 'S',
            ),
          ],
        ),
        Row(
          children: firstWeek
              .map(
                (e) => CalendarDay(
                  calendarDay: e,
                  onSelectDate: widget.onSelectDate,
                ),
              )
              .toList(),
        ),
        Row(
          children: secondWeek
              .map(
                (e) => CalendarDay(
                  calendarDay: e,
                  onSelectDate: widget.onSelectDate,
                ),
              )
              .toList(),
        ),
        Row(
          children: thirdWeek
              .map(
                (e) => CalendarDay(
                  calendarDay: e,
                  onSelectDate: widget.onSelectDate,
                ),
              )
              .toList(),
        ),
        Row(
          children: fourthWeek
              .map(
                (e) => CalendarDay(
                  calendarDay: e,
                  onSelectDate: widget.onSelectDate,
                ),
              )
              .toList(),
        ),
        Row(
          children: fifthWeek
              .map(
                (e) => CalendarDay(
                  calendarDay: e,
                  onSelectDate: widget.onSelectDate,
                ),
              )
              .toList(),
        ),
        sixthWeek[0].isCurrentMonth
            ? Row(
                children: sixthWeek
                    .map(
                      (e) => CalendarDay(
                        calendarDay: e,
                        onSelectDate: widget.onSelectDate,
                      ),
                    )
                    .toList(),
              )
            : Container(),
      ],
    );
  }

  void doFirstAndLastDay() {
    firstDayOfMonth = DateTime(widget.year, widget.month, 1);
    if (widget.month == 12) {
      lastDayOfMonth = DateTime(widget.year + 1, 1, 1);
    } else {
      lastDayOfMonth = DateTime(widget.year, widget.month + 1, 1);
    }
    lastDayOfMonth = lastDayOfMonth.add(const Duration(days: -1));
  }

  void doPreviousAndNextMonth() {
    previousMonth = CalendarUtil.getDateOfPreviousMonth(DateTime(widget.year, widget.month, 1));
    nextMonth = CalendarUtil.getDateOfNextMonth(DateTime(widget.year, widget.month, 1));
  }

  void doAllWeeks() {
    doFirstWeek();
    doSecondWeek();
    doThirdWeek();
    doFourthWeek();
    doFifthWeek();
    doSixthWeek();
  }

  void doFirstWeek() {
    firstWeek = [];
    int firstDayWeekDay = firstDayOfMonth.weekday;
    int initialDayOfView = firstDayOfMonth.add(Duration(days: firstDayWeekDay * -1)).day;

    if (firstDayWeekDay == 7) {
      firstDayWeekDay = 1;
    } else {
      firstDayWeekDay += 1;
    }

    for (int index in [0, 1, 2, 3, 4, 5, 6]) {
      int day;
      int month;
      int year;

      bool isCurrentMonth;
      if ((index + 1) == firstDayWeekDay) {
        day = 1;
        isCurrentMonth = true;
      } else if ((index + 1) > firstDayWeekDay) {
        day = firstWeek[index - 1].date.day + 1;
        isCurrentMonth = true;
      } else {
        day = initialDayOfView + index;
        isCurrentMonth = false;
      }

      if (isCurrentMonth) {
        month = widget.month;
        year = widget.year;
      } else {
        month = previousMonth.month;
        year = previousMonth.year;
      }

      bool isSelectedDay = false;
      if (widget.selectedDate != null &&
          widget.selectedDate!.year == year &&
          widget.selectedDate!.month == month &&
          widget.selectedDate!.day == day) {
        isSelectedDay = true;
      }

      DateTime date = DateTime(year, month, day);

      firstWeek.add(
        CalendarDayModel(
          date: date,
          isCurrentMonth: isCurrentMonth,
          isSelectedDay: isSelectedDay,
          isMarkedDay: widget.markedDates.contains(date),
        ),
      );
    }
  }

  void doSecondWeek() {
    secondWeek = [];
    for (int index in [1, 2, 3, 4, 5, 6, 7]) {
      int month;
      int year;
      int day = firstWeek[6].date.day + index;

      bool isCurrentMonth = firstWeek[6].isCurrentMonth;
      if (isCurrentMonth && day > lastDayOfMonth.day) {
        day = day - lastDayOfMonth.day;
        isCurrentMonth = false;
      }

      if (isCurrentMonth) {
        month = this.widget.month;
        year = this.widget.year;
      } else {
        month = nextMonth.month;
        year = nextMonth.year;
      }

      bool isSelectedDay = false;
      if (widget.selectedDate != null &&
          widget.selectedDate!.year == year &&
          widget.selectedDate!.month == month &&
          widget.selectedDate!.day == day) {
        isSelectedDay = true;
      }

      DateTime date = DateTime(year, month, day);

      secondWeek.add(
        CalendarDayModel(
          date: date,
          isCurrentMonth: isCurrentMonth,
          isSelectedDay: isSelectedDay,
          isMarkedDay: widget.markedDates.contains(date),
        ),
      );
    }
  }

  void doThirdWeek() {
    thirdWeek = [];
    for (int index in [1, 2, 3, 4, 5, 6, 7]) {
      int month;
      int year;
      int day = secondWeek[6].date.day + index;

      bool isCurrentMonth = secondWeek[6].isCurrentMonth;
      if (isCurrentMonth && day > lastDayOfMonth.day) {
        day = day - lastDayOfMonth.day;
        isCurrentMonth = false;
      }

      if (isCurrentMonth) {
        month = this.widget.month;
        year = this.widget.year;
      } else {
        month = nextMonth.month;
        year = nextMonth.year;
      }

      bool isSelectedDay = false;
      if (widget.selectedDate != null &&
          widget.selectedDate!.year == year &&
          widget.selectedDate!.month == month &&
          widget.selectedDate!.day == day) {
        isSelectedDay = true;
      }

      DateTime date = DateTime(year, month, day);

      thirdWeek.add(
        CalendarDayModel(
          date: date,
          isCurrentMonth: isCurrentMonth,
          isSelectedDay: isSelectedDay,
          isMarkedDay: widget.markedDates.contains(date),
        ),
      );
    }
  }

  void doFourthWeek() {
    fourthWeek = [];
    for (int index in [1, 2, 3, 4, 5, 6, 7]) {
      int month;
      int year;
      int day = thirdWeek[6].date.day + index;

      bool isCurrentMonth = thirdWeek[6].isCurrentMonth;
      if (isCurrentMonth && day > lastDayOfMonth.day) {
        day = day - lastDayOfMonth.day;
        isCurrentMonth = false;
      }

      if (isCurrentMonth) {
        month = this.widget.month;
        year = this.widget.year;
      } else {
        month = nextMonth.month;
        year = nextMonth.year;
      }

      bool isSelectedDay = false;
      if (widget.selectedDate != null &&
          widget.selectedDate!.year == year &&
          widget.selectedDate!.month == month &&
          widget.selectedDate!.day == day) {
        isSelectedDay = true;
      }

      DateTime date = DateTime(year, month, day);

      fourthWeek.add(
        CalendarDayModel(
          date: date,
          isCurrentMonth: isCurrentMonth,
          isSelectedDay: isSelectedDay,
          isMarkedDay: widget.markedDates.contains(date),
        ),
      );
    }
  }

  void doFifthWeek() {
    fifthWeek = [];
    for (int index in [1, 2, 3, 4, 5, 6, 7]) {
      int month;
      int year;
      int day = fourthWeek[6].date.day + index;

      bool isCurrentMonth = fourthWeek[6].isCurrentMonth;
      if (isCurrentMonth && day > lastDayOfMonth.day) {
        day = day - lastDayOfMonth.day;
        isCurrentMonth = false;
      }

      if (isCurrentMonth) {
        month = this.widget.month;
        year = this.widget.year;
      } else {
        month = nextMonth.month;
        year = nextMonth.year;
      }

      bool isSelectedDay = false;
      if (widget.selectedDate != null &&
          widget.selectedDate!.year == year &&
          widget.selectedDate!.month == month &&
          widget.selectedDate!.day == day) {
        isSelectedDay = true;
      }

      DateTime date = DateTime(year, month, day);

      fifthWeek.add(
        CalendarDayModel(
          date: date,
          isCurrentMonth: isCurrentMonth,
          isSelectedDay: isSelectedDay,
          isMarkedDay: widget.markedDates.contains(date),
        ),
      );
    }
  }

  void doSixthWeek() {
    sixthWeek = [];
    for (int index in [1, 2, 3, 4, 5, 6, 7]) {
      int month;
      int year;
      int day = fifthWeek[6].date.day + index;

      bool isCurrentMonth = fifthWeek[6].isCurrentMonth;
      if (isCurrentMonth && day > lastDayOfMonth.day) {
        day = day - lastDayOfMonth.day;
        isCurrentMonth = false;
      }

      if (isCurrentMonth) {
        month = this.widget.month;
        year = this.widget.year;
      } else {
        month = nextMonth.month;
        year = nextMonth.year;
      }

      bool isSelectedDay = false;
      if (widget.selectedDate != null &&
          widget.selectedDate!.year == year &&
          widget.selectedDate!.month == month &&
          widget.selectedDate!.day == day) {
        isSelectedDay = true;
      }

      DateTime date = DateTime(year, month, day);

      sixthWeek.add(
        CalendarDayModel(
          date: date,
          isCurrentMonth: isCurrentMonth,
          isSelectedDay: isSelectedDay,
          isMarkedDay: widget.markedDates.contains(date),
        ),
      );
    }
  }
}
