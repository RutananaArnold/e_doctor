import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardCard extends StatelessWidget {
  final String svgSrc;
  final String label;
  const DashboardCard({Key? key, required this.svgSrc, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.4,
        height: size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              svgSrc,
              color: Colors.blue,
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: size.height * 0.09),
                const Text(" 0 ",
                    style: TextStyle(color: Colors.blue, fontSize: 15)),
                Text(" $label ",
                    style: const TextStyle(color: Colors.black, fontSize: 12)),
              ],
            )
          ],
        ));
  }
}
