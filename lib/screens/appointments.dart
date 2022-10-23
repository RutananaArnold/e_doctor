import 'package:e_doctor/screens/previous.dart';
import 'package:e_doctor/screens/upcoming.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.green,
                onTap: (index) {},
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Previous'),
                ],
              ),
            ),
            const Expanded(
              flex: 12,
              child: TabBarView(
                children: [
                  UpcomingAppointments(),
                  PreviousAppointments(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
