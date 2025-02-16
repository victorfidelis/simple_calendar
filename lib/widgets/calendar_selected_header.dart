import 'package:flutter/material.dart';
import 'package:simple_calendar/general/calendar_util.dart';

class CalendarSelectedHeader extends StatelessWidget {
  final DateTime? selectedDate;

  const CalendarSelectedHeader({
    super.key,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    String selectedDateView = '';
    if (selectedDate != null) {
      selectedDateView = CalendarUtil.formatDateToDdMmYyyy(selectedDate!);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Data selecionada:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          selectedDateView,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
