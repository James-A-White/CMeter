// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opinion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpinionModel _$$_OpinionModelFromJson(Map<String, dynamic> json) =>
    _$_OpinionModel(
      stakeholderId: json['stakeholderId'] as String,
      criteriaId: json['criteriaId'] as String,
      criteriaOrder: json['criteriaOrder'] as int,
      stakeholderDisplayName: json['stakeholderDisplayName'] as String,
      stakeholderAbbreviation: json['stakeholderAbbreviation'] as String?,
      rowNumber: json['rowNumber'] as String,
      criteriaValueName: json['criteriaValueName'] as String,
      criteriaValueBackgroundColor:
          json['criteriaValueBackgroundColor'] as String,
      criteriaValueText: json['criteriaValueText'] as String,
      criteriaValueTextColor: json['criteriaValueTextColor'] as String,
    );

Map<String, dynamic> _$$_OpinionModelToJson(_$_OpinionModel instance) =>
    <String, dynamic>{
      'stakeholderId': instance.stakeholderId,
      'criteriaId': instance.criteriaId,
      'criteriaOrder': instance.criteriaOrder,
      'stakeholderDisplayName': instance.stakeholderDisplayName,
      'stakeholderAbbreviation': instance.stakeholderAbbreviation,
      'rowNumber': instance.rowNumber,
      'criteriaValueName': instance.criteriaValueName,
      'criteriaValueBackgroundColor': instance.criteriaValueBackgroundColor,
      'criteriaValueText': instance.criteriaValueText,
      'criteriaValueTextColor': instance.criteriaValueTextColor,
    };
