import 'dart:core';

class ModelClass {
  final String Designation;

  ModelClass({
    required this.Designation,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    return ModelClass(Designation: json['Designation']);
  }
}
