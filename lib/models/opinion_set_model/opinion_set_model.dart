// ignore_for_file: non_constant_identifier_names

// package importss
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_test_getx/imports.dart';

part 'opinion_set_model.freezed.dart';
part 'opinion_set_model.g.dart';

@freezed
class OpinionSetModel with _$OpinionSetModel {
  factory OpinionSetModel({
    required String decisionName,
    required String criteriaSetName,
    required String criteriaName,
    required int opinionCount,
  }) = _OpinionSetModel;

  factory OpinionSetModel.fromJson(Map<String, dynamic> json) => _$OpinionSetModelFromJson(json);
}
