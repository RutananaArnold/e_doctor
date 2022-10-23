import 'package:flutter/material.dart';

class SymptomCard extends StatelessWidget {
  const SymptomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      child: Card(
        child: ListTile(
          onTap: () {},
          horizontalTitleGap: 0.0,
          leading: Icon(
            Icons.countertops,
            color: Colors.black,
            size: MediaQuery.of(context).size.height / 42,
          ),
          title: const Text(
            "Fever",
            style: TextStyle(color: Colors.black, fontSize: 11.5),
          ),
        ),
      ),
    );
  }
}
