
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.25,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: SizedBox(
              height: size.height * 0.12,
              width: size.width * 0.19,
              child: const Card(
                color: Colors.green,
                child: Text("\n   data"),
              ),
            ),
          ),
          Positioned(
              left: 30,
              right: 0,
              child: SizedBox(
                height: 40,
                width: size.width * 0.01,
                child: const Card(
                  color: Color.fromARGB(255, 174, 184, 192),
                  elevation: 200,
                  child: Icon(
                    Icons.web_outlined,
                    size: 20,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
