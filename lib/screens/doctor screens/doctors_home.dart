import 'package:e_doctor/screens/doctor%20screens/advert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class DoctorsHome extends StatefulWidget {
  const DoctorsHome({super.key});

  @override
  State<DoctorsHome> createState() => _DoctorsHomeState();
}

class _DoctorsHomeState extends State<DoctorsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.person_add),
              label: "Add session advert",
              backgroundColor: Colors.red,
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: ((context) => const AdvertPage())),
                    (route) => true);
              }),
        ],
      ),
    );
  }
}
