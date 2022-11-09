// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:e_doctor/controllers/loading_controller.dart';
import 'package:e_doctor/models/symptom_choices.dart';
import 'package:e_doctor/models/symptom_search_result.dart';
import 'package:e_doctor/screens/patient%20screens/diagnosis_results.dart';
import 'package:e_doctor/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<SymptomChoices> choicesStorage = [];

  List<SymptomChoices> choices = [
    SymptomChoices(title: "Itching"),
    SymptomChoices(title: "Skin Rash"),
    SymptomChoices(title: "Nodal Skin Eruptions"),
    SymptomChoices(title: "Continuous Sneezing"),
    SymptomChoices(title: "Shivering"),
    SymptomChoices(title: "Chills"),
    SymptomChoices(title: "Joint pain"),
    SymptomChoices(title: "Stomach pain"),
    SymptomChoices(title: "Acidity"),
    SymptomChoices(title: "Ulcers on Tongue"),
    SymptomChoices(title: "Muscle Wasting"),
    SymptomChoices(title: "Vomiting"),
    SymptomChoices(title: "Fatigue"),
    SymptomChoices(title: "High Fever"),
    SymptomChoices(title: "Sunken Eyes"),
    SymptomChoices(title: "Anxiety"),
    SymptomChoices(title: "Restlessness"),
    SymptomChoices(title: "Cough"),
    SymptomChoices(title: "Lethargy"),
    SymptomChoices(title: "Headache"),
    SymptomChoices(title: "Indigestion"),
    SymptomChoices(title: "Sweating"),
    SymptomChoices(title: "Dehydration"),
    SymptomChoices(title: "Nausea"),
    SymptomChoices(title: "Constipation"),
    SymptomChoices(title: "Diarrhoea"),
    SymptomChoices(title: "Dizziness"),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal[100],
        title: const Text(
          "Symptom Selection",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
              height: size.height * 0.7,
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    var chipsText = choices[index].title.toString();
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            choices[index].visible = !(choices[index].visible);
                            if (choices[index].visible) {
                              choicesStorage.add(choices[index]);
                            } else {
                              choicesStorage.remove(choices[index]);
                              choicesStorage.join(', ');
                            }
                          });
                        },
                        child: Chip(
                          label: Text(
                            chipsText,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: choices[index].visible
                              ? const Color.fromARGB(255, 2, 134, 38)
                              : const Color.fromARGB(255, 230, 238, 236),
                        ));
                  }))),
          RoundedButton(
              text: "Diagnose",
              press: () {
                print(choicesStorage.length);
                loaderController.changeProgress(true, "Diagnosing");
                diagnoseRequest();
              },
              color: Colors.green)
        ],
      ),
    );
  }

  // transaction logic

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
      };

  diagnoseRequest() async {
    // ignore: prefer_typing_uninitialized_variables
    SymptomSearchResult jsonResponse;
    var response = await http.get(
      Uri.parse(
          "http://185.217.127.125:2003/predict?smy=${choicesStorage[0].title}%2C${choicesStorage[1].title}%2C${choicesStorage[2].title}"),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      jsonResponse = SymptomSearchResult.fromJson(jsonDecode(response.body));
      loaderController.changeProgress(false, "Diagnosis successfully");
      // ignore: duplicate_ignore
      if (jsonResponse != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: ((context) => DiagnosisResult(
                      rfModelPrediction: jsonResponse.rfModelPrediction,
                      naiveBayesPrediction: jsonResponse.naiveBayesPrediction,
                      svmModelPrediction: jsonResponse.svmModelPrediction,
                      finalPrediction: jsonResponse.finalPrediction,
                    ))),
            (route) => true);
      }
    } else {
      loaderController.changeProgress(false, "Diagnosis failed");
      var badResponse = json.decode(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(badResponse.toString())));
    }
  }
}
