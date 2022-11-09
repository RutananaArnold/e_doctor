// To parse this JSON data, do
//
//     final symptomSearchResult = symptomSearchResultFromJson(jsonString);

import 'dart:convert';

SymptomSearchResult symptomSearchResultFromJson(String str) =>
    SymptomSearchResult.fromJson(json.decode(str));

String symptomSearchResultToJson(SymptomSearchResult data) =>
    json.encode(data.toJson());

class SymptomSearchResult {
  SymptomSearchResult({
    required this.rfModelPrediction,
    required this.naiveBayesPrediction,
    required this.svmModelPrediction,
    required this.finalPrediction,
  });

  final String rfModelPrediction;
  final String naiveBayesPrediction;
  final String svmModelPrediction;
  final String finalPrediction;

  factory SymptomSearchResult.fromJson(Map<String, dynamic> json) =>
      SymptomSearchResult(
        rfModelPrediction: json["rf_model_prediction"],
        naiveBayesPrediction: json["naive_bayes_prediction"],
        svmModelPrediction: json["svm_model_prediction"],
        finalPrediction: json["final_prediction"],
      );

  Map<String, dynamic> toJson() => {
        "rf_model_prediction": rfModelPrediction,
        "naive_bayes_prediction": naiveBayesPrediction,
        "svm_model_prediction": svmModelPrediction,
        "final_prediction": finalPrediction,
      };
}
