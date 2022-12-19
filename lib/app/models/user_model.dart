// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'imc_model.dart';

class UserModel {
  String? id;
  ImcModel? currentImc;

  UserModel({this.id, this.currentImc});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'currentImc': currentImc,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      currentImc: map['currentImc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
