import 'package:e_doctor/widgets/radio_button.dart';
import 'package:e_doctor/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool choiceSelected = false;
  List<String> choices = [
    'Home',
    'Contact',
    'Phone',
    'Camera',
    'Setting',
    'Album',
    'WiFi',
    'Setting',
    'Album',
    'WiFi',
    'Setting',
    'Album',
    'WiFi',
    'Album',
    'WiFi',
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: List.generate(choices.length, (index) {
                    return Center(
                        child: RadioButton(
                            label: choices[index],
                            textColor: choiceSelected
                                ? const Color(0xffffffff)
                                : const Color.fromRGBO(52, 168, 83, 1),
                            backgroundColor: choiceSelected
                                ? const Color(0xffffffff)
                                : Colors.white,
                            checkmarkColor: choiceSelected
                                ? const Color(0xffffffff)
                                : const Color.fromRGBO(52, 168, 83, 1),
                            selected: choiceSelected,
                            selectedColor: const Color.fromRGBO(52, 168, 83, 1),
                            onSelected: (bool value) {
                              setState(() {
                                print("value $value  index $index");

                                if (value) {
                                  choiceSelected = true;
                                } else {
                                  choiceSelected = false;
                                }
                                if (choiceSelected = true) {
                                  print(choiceSelected);
                                }
                              });
                            }));
                  }))),
          RoundedButton(text: "Diagnose", press: () {}, color: Colors.green)
        ],
      ),
    );
  }
}
