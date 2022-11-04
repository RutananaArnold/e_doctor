import 'package:e_doctor/widgets/testing_cards.dart';
import 'package:flutter/material.dart';

class GenericTest extends StatefulWidget {
  const GenericTest({Key? key}) : super(key: key);

  @override
  State<GenericTest> createState() => _GenericTestState();
}

class _GenericTestState extends State<GenericTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(3, (index) => const TestCard()),
        ),
      ),
    );
  }
}
