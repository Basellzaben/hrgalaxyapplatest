import 'package:flutter/cupertino.dart';

//work state data
class WorkInfo {
  final int id;
  final String description;
  final int count;

  WorkInfo({
    required this.id,
    required this.description,
    required this.count,
  });

  factory WorkInfo.fromJson(Map<String, dynamic> json) {
    return WorkInfo(
      id: json['Id'] as int,
      description: json['Description'] as String,
      count: json['Count'] as int,
    );
  }
}
