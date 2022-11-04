import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final void Function()? onTap;
  const DoctorCard({
    Key? key,
    required this.doctorName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      child: Card(
        margin: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.02,
            left: size.width * 0.02,
            right: size.width * 0.02),
        child: ListTile(
          onTap: onTap,
          horizontalTitleGap: 0.0,
          leading: SizedBox(
            height: MediaQuery.of(context).size.height / 0.02,
            width: MediaQuery.of(context).size.height / 15,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.red[100],
              foregroundImage: const AssetImage("assets/images/doctor.jpg"),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              doctorName,
              style: const TextStyle(color: Colors.black, fontSize: 11.5),
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: const Text(
              "Surgeon",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          trailing: const Chip(
              avatar: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              label: Text("4.8")),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }
}
