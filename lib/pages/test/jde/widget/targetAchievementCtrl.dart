import 'package:flutter/material.dart';
import 'package:flutter_shop/framework/my_color.dart';
import 'package:flutter_shop/pages/test/jde/model/target_model.dart';
import 'package:flutter_shop/pages/test/jde/utils/utils.dart';
import 'package:flutter_shop/pages/test/jde/view/RadioCornerButton.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TargetAchievementCtrl extends StatefulWidget {
  final TargetModel model;

  const TargetAchievementCtrl({required this.model, Key? key})
      : super(key: key);

  @override
  State<TargetAchievementCtrl> createState() => _TargetAchievementCtrlState();
}

class _TargetAchievementCtrlState extends State<TargetAchievementCtrl> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          /// 标题栏
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "My Target Achievement",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Image.asset("images/ic_yellow.png", width: 20, height: 20),
                ],
              ),
              Row(
                children: [
                  Text(
                    "More Data",
                    style: TextStyle(
                      fontSize: 13,
                      color: MyColor.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Image.asset("images/ic_arrow_right.png", width: 6, height: 10)
                ],
              ),
            ],
          ),
          SizedBox(height: 10),

          /// 时间选择栏
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: MyColor.C_dfdcdc),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Row(
                  children: [
                    Text(
                      "Date up to 08-2022",
                      style: TextStyle(
                        fontSize: 12,
                        color: MyColor.mainColor,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Image.asset("images/ic_arrow_right.png",
                        width: 6, height: 10)
                  ],
                ),
              ),
              RadioCornerButton(
                  isLeftDefaultCheck: true,
                  leftCheckCall: () {},
                  rightCheckCall: () {}),
            ],
          ),

          Container(
            height: 20,
            color: Colors.red,
          ),

          /// 日历
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            availableCalendarFormats: {
              CalendarFormat.month: 'Month',
              CalendarFormat.week: 'Week',
            },

            // todo lxh
            headerStyle: HeaderStyle(
              formatButtonShowsNext: false,
              titleTextFormatter: (date, locale) =>
                  DateFormat.yMd(locale).format(date),
            ),

            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          )
        ],
      ),
    );
  }
}
