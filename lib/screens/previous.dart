import 'package:e_doctor/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

class PreviousAppointments extends StatefulWidget {
  const PreviousAppointments({Key? key}) : super(key: key);

  @override
  State<PreviousAppointments> createState() => _PreviousAppointmentsState();
}

class _PreviousAppointmentsState extends State<PreviousAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
                3,
                (index) => const AppointmentCard(
                      screenCheck: 'previous',
                    ))),
      ),
    );
  }
}
