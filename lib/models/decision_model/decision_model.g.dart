// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DecisionModel _$$_DecisionModelFromJson(Map<String, dynamic> json) =>
    _$_DecisionModel(
      decisionId: json['decisionId'] as String,
      decisionCode: json['decisionCode'] as String,
      decisionName: json['decisionName'] as String,
      decisionQuestion: json['decisionQuestion'] as String,
      decisionIsLocked: json['decisionIsLocked'] as int,
    );

Map<String, dynamic> _$$_DecisionModelToJson(_$_DecisionModel instance) =>
    <String, dynamic>{
      'decisionId': instance.decisionId,
      'decisionCode': instance.decisionCode,
      'decisionName': instance.decisionName,
      'decisionQuestion': instance.decisionQuestion,
      'decisionIsLocked': instance.decisionIsLocked,
    };
