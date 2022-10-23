import 'package:e_doctor/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
                3,
                (index) => const AppointmentCard(
                      screenCheck: 'upcoming',
                    ))),
      ),
    );
  }
}
