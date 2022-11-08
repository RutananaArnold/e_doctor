import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_doctor/controllers/auth_controller.dart';
import 'package:e_doctor/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  final Stream<QuerySnapshot> requestsStream =
      FirebaseFirestore.instance.collection('appointments').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: requestsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return data['status'] == 'pending' &&
                      data['patientEmail'] == authContrler.userProfile[0].email
                  ? AppointmentCard(
                      time: data['appointmentTime'],
                      date: data['appointmentDate'],
                      drName: data['doctorName'],
                      status: data['status'],
                    )
                  : Container();
            }).toList(),
          );
        },
      ),
    );
  }
}
