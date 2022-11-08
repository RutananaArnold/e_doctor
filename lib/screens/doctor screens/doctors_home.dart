import 'package:e_doctor/widgets/dashboardcard.dart';
import 'package:flutter/material.dart';

class DoctorsHome extends StatefulWidget {
  const DoctorsHome({super.key});

  @override
  State<DoctorsHome> createState() => _DoctorsHomeState();
}

class _DoctorsHomeState extends State<DoctorsHome> {
  List<String> svgSrc = [
    "assets/images/appliedjobs.svg",
    "assets/images/messages.svg",
  ];

  List<String> labels = [
    "Total Appointments",
    "Total Messages",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        2,
        (index) => Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: DashboardCard(
            svgSrc: svgSrc[index],
            label: labels[index],
          ),
        ),
      ),
    ));
  }
}
