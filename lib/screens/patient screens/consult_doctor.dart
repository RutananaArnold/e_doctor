import 'package:e_doctor/controllers/doctor_booking_controller.dart';
import 'package:e_doctor/controllers/doctors_controller.dart';
import 'package:e_doctor/screens/patient%20screens/doctor_infor.dart';
import 'package:e_doctor/widgets/doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: GetBuilder<DoctorController>(
              init: DoctorController(),
              builder: (doctors) {
                return Column(
                    children: List.generate(
                        doctors.doctorsList.length,
                        (index) => doctors.doctorsList[index].role != 'doctor'
                            ? const Center(child: Text(" "))
                            : DoctorCard(
                                doctorName: doctors.doctorsList[index].userName,
                                onTap: () {
                                  doctorBookingControl.changeDoctor(
                                      doctors.doctorsList[index].userName);
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: ((context) => DoctorInfor(
                                                doctorDetail: [
                                                  doctors.doctorsList[index]
                                                ],
                                              ))),
                                      (route) => true);
                                },
                              )));
              }),
        ));
  }
}
