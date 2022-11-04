import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String screenCheck;
  final String date;
  final String time;
  final String drName;
  final String status;
  const AppointmentCard(
      {Key? key,
      required this.screenCheck,
      required this.date,
      required this.time,
      required this.drName,
      required this.status})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white70,
      margin:
          EdgeInsets.only(top: size.height * 0.02, bottom: size.height * 0.02),
      elevation: 100,
      child: SizedBox(
        width: size.width * 1,
        child: Wrap(
          direction: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        "Doctor",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        drName,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      screenCheck == 'upcoming'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {},
                                  child: const Text("Reschedule")),
                            )
                          : Container()
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Time",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        "Status",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        status,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      screenCheck == 'upcoming'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            )
                          : Container()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
