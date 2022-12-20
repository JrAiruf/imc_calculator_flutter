// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImcModel {
  String? id;
  String? weight;
  String? height;
  String? result;
  String? lastCalculation;

  ImcModel({
    this.id,
    this.weight,
    this.height,
    this.result,
    this.lastCalculation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weight': weight,
      'height': height,
      'result': result,
      'lastCalculation': lastCalculation,
    };
  }

  factory ImcModel.fromMap(Map<String, dynamic> map) {
    return ImcModel(
      id: map['id'] != null ? map['id'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
      result: map['result'] != null ? map['result'] as String : null,
      lastCalculation: map['lastCalculation'] != null ? map['lastCalculation'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImcModel.fromJson(String source) => ImcModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
