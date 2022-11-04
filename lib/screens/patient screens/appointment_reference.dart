import 'dart:async';

import 'package:e_doctor/screens/patient%20screens/index.dart';
import 'package:e_doctor/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

import '../../controllers/doctor_booking_controller.dart';

class AppointmentReference extends StatefulWidget {
  const AppointmentReference({super.key});

  @override
  State<AppointmentReference> createState() => _AppointmentReferenceState();
}

class _AppointmentReferenceState extends State<AppointmentReference> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Index(
                    currentTabIndex: 1,
                  )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Thank You",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 90,
                ),
              ),
              const Text(
                "Appointment Booked successfully",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                "Booking Id: ${doctorBookingControl.bookingId}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              Card(
                  elevation: 300,
                  child: ListTile(
                    title: ProfileTile(
                      padding: 20,
                      label: "Doctor",
                      value: doctorBookingControl.doctorName,
                    ),
                    subtitle: Column(
                      children: [
                        ProfileTile(
                          padding: 20,
                          label: "Date",
                          value: doctorBookingControl.bookDate.text,
                        ),
                        ProfileTile(
                          padding: 20,
                          label: "Time",
                          value: doctorBookingControl.bookTime.text,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
