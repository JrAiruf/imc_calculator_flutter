// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImcModel {
  double? weight;
  double? height;
  double? result;

  ImcModel({this.weight, this.height, this.result});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weight': weight,
      'height': height,
      'result': result,
    };
  }

  factory ImcModel.fromMap(Map<String, dynamic> map) {
    return ImcModel(
      weight: map['weight'] != null ? map['weight'] as double : null,
      height: map['height'] != null ? map['height'] as double : null,
      result: map['result'] != null ? map['result'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImcModel.fromJson(String source) => ImcModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
