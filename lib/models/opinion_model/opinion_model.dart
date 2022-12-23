// ignore_for_file: non_constant_identifier_names

// package importss
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:consensus_meter/imports.dart';

part 'opinion_model.freezed.dart';
part 'opinion_model.g.dart';

@freezed
class OpinionModel with _$OpinionModel {
  factory OpinionModel({
    required String stakeholderId,
    required String criteriaId,
    required int criteriaOrder,
    required String stakeholderDisplayName,
    String? stakeholderAbbreviation,
    required String rowNumber,
    required String criteriaValueName,
    required String criteriaValueBackgroundColor,
    required String criteriaValueText,
    required String criteriaValueTextColor,
  }) = _OpinionModel;

  factory OpinionModel.fromJson(Map<String, dynamic> json) => _$OpinionModelFromJson(json);
}
