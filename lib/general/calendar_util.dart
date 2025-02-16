class CalendarUtil {
  static String monthToText({required int month}) {
    if (month == 1) {
      return 'Janeiro';
    } else if (month == 2) {
      return 'Fevereiro';
    } else if (month == 3) {
      return 'Março';
    } else if (month == 4) {
      return 'Abril';
    } else if (month == 5) {
      return 'Maio';
    } else if (month == 6) {
      return 'Junho';
    } else if (month == 7) {
      return 'Julho';
    } else if (month == 8) {
      return 'Agosto';
    } else if (month == 9) {
      return 'Setembro';
    } else if (month == 10) {
      return 'Outubro';
    } else if (month == 11) {
      return 'Novembro';
    } else if (month == 12) {
      return 'Dezembro';
    } else {
      throw Exception('Número do mês inválido.');
    }
  }

  static String weekDayToText(int weekDay) {
    if (weekDay == 1) {
      return 'Segunda-feira';
    } else {
      throw Exception('Número da semana incorreto.');
    }
  }

  static DateTime getDateOfPreviousMonth(DateTime date) {
    if (date.month == 1) {
      return DateTime(date.year - 1, 1, 1);
    } else {
      return DateTime(date.year, date.month - 1, 1);
    }
  }

  static DateTime getDateOfNextMonth(DateTime date) {
    if (date.month == 12) {
      return DateTime(date.year + 1, 1, 1);
    } else {
      return DateTime(date.year, date.month + 1, 1);
    }
  }

  static formatDateToDdMmYyyy(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString().padLeft(4, '0');
    return '$day/$month/$year';
  }
}
