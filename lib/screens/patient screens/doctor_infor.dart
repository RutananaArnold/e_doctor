// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_doctor/controllers/doctor_booking_controller.dart';
import 'package:e_doctor/controllers/loading_controller.dart';
import 'package:e_doctor/widgets/rounded_button.dart';
import 'package:e_doctor/widgets/rounded_input.dart';
import 'package:flutter/material.dart';

import 'package:e_doctor/models/loggedin_user.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'payments.dart';

class DoctorInfor extends StatefulWidget {
  final List<LoggedInUser> doctorDetail;
  const DoctorInfor({Key? key, required this.doctorDetail}) : super(key: key);

  @override
  State<DoctorInfor> createState() => _DoctorInforState();
}

class _DoctorInforState extends State<DoctorInfor> {
  final telController = TextEditingController();
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference requests =
      FirebaseFirestore.instance.collection('appointments');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.green[300],
      ),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        minHeight: 300,
        maxHeight: 400,
        body: Container(
          color: Colors.green[300],
          child: Column(
            children: const [
              Icon(Icons.person, size: 200),
            ],
          ),
        ),
        panel: Container(
          decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GetBuilder<DoctorBookingController>(
              init: DoctorBookingController(),
              builder: (doctorAppointment) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.03),
                        Text(
                          "Name: Dr. ${widget.doctorDetail[0].userName}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Text(
                          "Email: ${widget.doctorDetail[0].email}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(height: size.height * 0.02),
                        const Text(
                          "Appointment section",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 23),
                        ),
                        RoundedInput(
                          label: "Appointment Date",
                          hint: "Select Date",
                          icon: Icons.date_range,
                          readOnly: true,
                          handler: doctorAppointment.bookDate,
                          ontap: () {
                            doctorAppointment.selectDate(context);
                          },
                        ),
                        RoundedInput(
                          label: "Appointment Time",
                          hint: "Select Time",
                          icon: Icons.timelapse,
                          readOnly: true,
                          handler: doctorAppointment.bookTime,
                          ontap: () {
                            doctorAppointment.selectTime(context);
                          },
                        ),
                        RoundedInput(
                          label: "Phone",
                          hint: "tel",
                          icon: Icons.phone,
                          handler: telController,
                        ),
                        RoundedButton(
                            text: "Make Appointment",
                            press: () {
                              loaderController.changeProgress(
                                  true, "Confirming appointment");
                              makeAppointment(
                                  widget.doctorDetail[0].userName,
                                  doctorAppointment.bookDate.text,
                                  doctorAppointment.bookTime.text,
                                  widget.doctorDetail[0].email,
                                  telController.text);
                            },
                            color: Colors.green),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  // umake request

  Future<void> makeAppointment(
    String doctorName,
    String appointmentDate,
    String appointmentTime,
    String patientEmail,
    String tel,
  ) {
    return requests.add({
      'doctorName': doctorName,
      'appointmentDate': appointmentDate,
      'appointmentTime': appointmentTime,
      'tel': tel,
      'patientEmail': patientEmail,
      'status': 'pending'
    }).then((value) async {
      loaderController.changeProgress(false, "Appointment confirmed");
      doctorBookingControl.changeBookId(value.id);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Appointment sent")));
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => const Payments())),
          (route) => false);
    }).catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send Appointment: $error"))));
  }
}
