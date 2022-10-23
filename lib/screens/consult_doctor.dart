
import 'package:e_doctor/widgets/doctors_card.dart';
import 'package:flutter/material.dart';

class ConsultDoctor extends StatefulWidget {
  const ConsultDoctor({super.key});

  @override
  State<ConsultDoctor> createState() => _ConsultDoctorState();
}

class _ConsultDoctorState extends State<ConsultDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child:
              Column(children: List.generate(3, (index) => const DoctorCard())),
        ));
  }
}
