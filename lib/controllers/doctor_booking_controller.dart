import 'package:flutter/material.dart';
import 'package:get/get.dart';

final doctorBookingControl = Get.put(DoctorBookingController());

class DoctorBookingController extends GetxController {
  // booking Id
  String bookingId = '';
  String doctorName = '';
  final bookDate = TextEditingController();
  final bookTime = TextEditingController();
  String hour = " ", minute = " ", time = " ";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(const Duration(days: 20))))) {
      return true;
    }
    return false;
  }

// date picker
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      selectableDayPredicate: decideWhichDayToEnable,
      helpText: 'CHOOSE APPOINTMENT DATE',
      cancelText: 'NOT NOW',
      confirmText: 'SET',
    );

    if (picked != null) {
      selectedDate = picked;
      bookDate.text = "${selectedDate.toLocal()}".split(' ')[0];
      update();
    }
  }

  // time picker
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      helpText: 'CHOOSE APPOINTMENT TIME',
      cancelText: 'NOT NOW',
      confirmText: 'SET',
    );
    if (picked != null) {
      selectedTime = picked;
      hour = selectedTime.hour.toString().length == 1
          ? '0${selectedTime.hour}'
          : selectedTime.hour.toString();

      minute = selectedTime.minute.toString().length == 1
          ? '0${selectedTime.minute}'
          : selectedTime.minute.toString();
      time = '$hour : $minute';
      bookTime.text = time;
      update();
    }
  }

  changeBookId(String value) {
    bookingId = value;
    update();
  }

  changeDoctor(String value) {
    doctorName = value;
    update();
  }
}
