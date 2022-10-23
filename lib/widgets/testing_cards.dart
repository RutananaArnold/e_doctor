import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  const TestCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.only(
          top: size.height * 0.02,
          bottom: size.height * 0.02,
          left: size.width * 0.02,
          right: size.width * 0.02),
      elevation: 100,
      color: Colors.white70,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 1,
        horizontalTitleGap: 0.0,
        title: const Text(
          "Thyroid Profile (T3 T4 TSH)",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          "UGX 100000",
          style: TextStyle(color: Colors.green),
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            direction: Axis.vertical,
            spacing: 0.5,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {},
                  child: const Text("BOOK")),
              ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text("")),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
