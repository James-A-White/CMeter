// ignore_for_file: non_constant_identifier_names

// package importss
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:consensus_meter/imports.dart';

part 'decision_model.freezed.dart';
part 'decision_model.g.dart';

@freezed
class DecisionModel with _$DecisionModel {
  factory DecisionModel({
    required String decisionId,
    required String decisionCode,
    required String decisionName,
    required String decisionQuestion,
    required int decisionIsLocked,
  }) = _DecisionModel;

  factory DecisionModel.fromJson(Map<String, dynamic> json) => _$DecisionModelFromJson(json);
}
