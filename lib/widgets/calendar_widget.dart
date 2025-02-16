import 'package:flutter/material.dart';
import 'package:simple_calendar/widgets/calendar_body.dart';
import 'package:simple_calendar/widgets/calendar_header.dart';

class CalendarWidget extends StatefulWidget {
  final DateTime? selectedDate;
  final DateTime initialDate;
  final DateTime finalDate;
  final List<DateTime> markedDates;
  final Function(DateTime) onSelectDate;

  const CalendarWidget({
    super.key,
    required this.initialDate,
    required this.finalDate,
    this.selectedDate,
    this.markedDates = const [],
    required this.onSelectDate,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  ValueNotifier<DateTime?> selectedDate = ValueNotifier(null);
  ValueNotifier<int> year = ValueNotifier(DateTime.now().year);
  ValueNotifier<int> month = ValueNotifier(DateTime.now().month);

  @override
  void initState() {
    if (widget.selectedDate != null) {
      selectedDate.value = widget.selectedDate;
      year.value = widget.selectedDate!.year;
      month.value = widget.selectedDate!.month;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: selectedDate,
      builder: (context, _) {
        return Column(
          children: [
            ListenableBuilder(
              listenable: month,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  children: [
                    CalendarHeader(
                      year: year.value,
                      month: month.value,
                      previousMonth: previousMonth,
                      nextMonth: nextMonth,
                    ),
                    const SizedBox(height: 18),
                    CalendarBody(
                      year: year.value,
                      month: month.value,
                      initialDate: widget.initialDate,
                      finalDate: widget.finalDate,
                      selectedDate: selectedDate.value,
                      markedDates: widget.markedDates,
                      onSelectDate: onSelectDate,
                    ),
                  ],
                );
              },
            ),
          ],
        );
      }
    );
  }

  void onSelectDate({required DateTime date}) {
    selectedDate.value = date;
    widget.onSelectDate(date);
  }

  void previousMonth() {
    int minYear = widget.initialDate.year;
    int minMonth = widget.initialDate.month;

    if (month.value <= minMonth && year.value <= minYear) {
      return;
    } else if (month.value == 1) {
      month.value = 12;
      year.value -= 1;
    } else {
      month.value -= 1;
    }
  }

  void nextMonth() {
    int maxYear = widget.finalDate.year;
    int maxMonth = widget.finalDate.month;

    if (month.value >= maxMonth && year.value >= maxYear) {
      return;
    } else if (month.value == 12) {
      month.value = 1;
      year.value += 1;
    } else {
      month.value += 1;
    }
  }
}
