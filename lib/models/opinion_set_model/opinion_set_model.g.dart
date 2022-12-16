// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opinion_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpinionSetModel _$$_OpinionSetModelFromJson(Map<String, dynamic> json) =>
    _$_OpinionSetModel(
      decisionName: json['decisionName'] as String,
      criteriaSetName: json['criteriaSetName'] as String,
      criteriaName: json['criteriaName'] as String,
      opinionCount: json['opinionCount'] as int,
    );

Map<String, dynamic> _$$_OpinionSetModelToJson(_$_OpinionSetModel instance) =>
    <String, dynamic>{
      'decisionName': instance.decisionName,
      'criteriaSetName': instance.criteriaSetName,
      'criteriaName': instance.criteriaName,
      'opinionCount': instance.opinionCount,
    };
