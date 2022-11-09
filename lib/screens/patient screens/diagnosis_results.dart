import 'package:e_doctor/widgets/profile_tile.dart';
import 'package:flutter/material.dart';

class DiagnosisResult extends StatefulWidget {
  final String rfModelPrediction;
  final String naiveBayesPrediction;
  final String svmModelPrediction;
  final String finalPrediction;
  const DiagnosisResult(
      {super.key,
      required this.rfModelPrediction,
      required this.naiveBayesPrediction,
      required this.svmModelPrediction,
      required this.finalPrediction});

  @override
  State<DiagnosisResult> createState() => _DiagnosisResultState();
}

class _DiagnosisResultState extends State<DiagnosisResult> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Diagnosis Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[100],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          ProfileTile(label: "1st prediction", value: widget.rfModelPrediction),
          ProfileTile(
              label: "2nd prediction", value: widget.naiveBayesPrediction),
          ProfileTile(
              label: "3rd prediction", value: widget.svmModelPrediction),
          ProfileTile(label: "Final prediction", value: widget.finalPrediction),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
