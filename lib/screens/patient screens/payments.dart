import 'package:e_doctor/screens/patient%20screens/appointment_reference.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const AppointmentReference()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Center(
              child: Text(
                "Payment",
              ),
            )
          ],
        ),
      ),
    );
  }
}
