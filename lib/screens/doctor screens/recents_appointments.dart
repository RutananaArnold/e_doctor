import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_doctor/controllers/auth_controller.dart';
import 'package:e_doctor/screens/patient%20screens/index.dart';
import 'package:e_doctor/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentDoctorAppointments extends StatefulWidget {
  const RecentDoctorAppointments({super.key});

  @override
  State<RecentDoctorAppointments> createState() =>
      _RecentDoctorAppointmentsState();
}

class _RecentDoctorAppointmentsState extends State<RecentDoctorAppointments> {
  final Stream<QuerySnapshot> requestsStream =
      FirebaseFirestore.instance.collection('appointments').snapshots();
  final requestDB = FirebaseFirestore.instance;
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
              return data['doctorName'] == authContrler.userProfile[0].userName
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Card(
                        color: Colors.blue[50],
                        elevation: 300,
                        child: ListTile(
                          title: Column(
                            children: [
                              ProfileTile(
                                padding: 20,
                                label: "Date:",
                                value: data['appointmentDate'],
                              ),
                              ProfileTile(
                                padding: 20,
                                label: "Time:",
                                value: data['appointmentTime'],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              ProfileTile(
                                padding: 20,
                                label: "Patient:",
                                value: data['patientEmail'],
                              ),
                              ProfileTile(
                                padding: 20,
                                label: "Tel:",
                                value: data['tel'],
                              ),
                            ],
                          ),
                          trailing: Chip(label: Text(data['status'])),
                          onTap: () {
                            createAlert(context, document);
                          },
                        ),
                      ),
                    )
                  : Container();
            }).toList(),
          );
        },
      ),
    );
  }

// alert for approving appointments
  Future createAlert(BuildContext context, DocumentSnapshot<Object?> document) {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: StatefulBuilder(
              builder: (context, setState) {
                return const Center(
                  child: Text(
                    "Are you sure you want to approve this appointment?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                );
              },
            ),
            actions: [
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () async {
                    // ignore: use_build_context_synchronously
                    requestDB
                        .collection('appointments')
                        .doc(document.id)
                        .update({'status': 'approved'}).then((value) async {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Patient appointment approved successfully")));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Index(
                              currentTabIndex: 1,
                            ),
                          ),
                          (route) => false);
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Failed to approve appointment: $error")));
                    });
                  },
                  child: const Text(
                    "Approve",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )),
            ],
          );
        });
  }
}
