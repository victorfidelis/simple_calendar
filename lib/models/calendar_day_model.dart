class CalendarDayModel {
  DateTime date;
  bool isCurrentMonth;
  bool isSelectedDay;
  bool isMarkedDay;
  bool isInPeriod;

  CalendarDayModel({
    required this.date,
    required this.isCurrentMonth,
    required this.isSelectedDay,
    required this.isMarkedDay,
    required this.isInPeriod,
  });
}
