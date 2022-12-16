// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opinion_set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpinionSetModel _$OpinionSetModelFromJson(Map<String, dynamic> json) {
  return _OpinionSetModel.fromJson(json);
}

/// @nodoc
mixin _$OpinionSetModel {
  String get decisionName => throw _privateConstructorUsedError;
  String get criteriaSetName => throw _privateConstructorUsedError;
  String get criteriaName => throw _privateConstructorUsedError;
  int get opinionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpinionSetModelCopyWith<OpinionSetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpinionSetModelCopyWith<$Res> {
  factory $OpinionSetModelCopyWith(
          OpinionSetModel value, $Res Function(OpinionSetModel) then) =
      _$OpinionSetModelCopyWithImpl<$Res, OpinionSetModel>;
  @useResult
  $Res call(
      {String decisionName,
      String criteriaSetName,
      String criteriaName,
      int opinionCount});
}

/// @nodoc
class _$OpinionSetModelCopyWithImpl<$Res, $Val extends OpinionSetModel>
    implements $OpinionSetModelCopyWith<$Res> {
  _$OpinionSetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionName = null,
    Object? criteriaSetName = null,
    Object? criteriaName = null,
    Object? opinionCount = null,
  }) {
    return _then(_value.copyWith(
      decisionName: null == decisionName
          ? _value.decisionName
          : decisionName // ignore: cast_nullable_to_non_nullable
              as String,
      criteriaSetName: null == criteriaSetName
          ? _value.criteriaSetName
          : criteriaSetName // ignore: cast_nullable_to_non_nullable
              as String,
      criteriaName: null == criteriaName
          ? _value.criteriaName
          : criteriaName // ignore: cast_nullable_to_non_nullable
              as String,
      opinionCount: null == opinionCount
          ? _value.opinionCount
          : opinionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpinionSetModelCopyWith<$Res>
    implements $OpinionSetModelCopyWith<$Res> {
  factory _$$_OpinionSetModelCopyWith(
          _$_OpinionSetModel value, $Res Function(_$_OpinionSetModel) then) =
      __$$_OpinionSetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String decisionName,
      String criteriaSetName,
      String criteriaName,
      int opinionCount});
}

/// @nodoc
class __$$_OpinionSetModelCopyWithImpl<$Res>
    extends _$OpinionSetModelCopyWithImpl<$Res, _$_OpinionSetModel>
    implements _$$_OpinionSetModelCopyWith<$Res> {
  __$$_OpinionSetModelCopyWithImpl(
      _$_OpinionSetModel _value, $Res Function(_$_OpinionSetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionName = null,
    Object? criteriaSetName = null,
    Object? criteriaName = null,
    Object? opinionCount = null,
  }) {
    return _then(_$_OpinionSetModel(
      decisionName: null == decisionName
          ? _value.decisionName
          : decisionName // ignore: cast_nullable_to_non_nullable
              as String,
      criteriaSetName: null == criteriaSetName
          ? _value.criteriaSetName
          : criteriaSetName // ignore: cast_nullable_to_non_nullable
              as String,
      criteriaName: null == criteriaName
          ? _value.criteriaName
          : criteriaName // ignore: cast_nullable_to_non_nullable
              as String,
      opinionCount: null == opinionCount
          ? _value.opinionCount
          : opinionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OpinionSetModel
    with DiagnosticableTreeMixin
    implements _OpinionSetModel {
  _$_OpinionSetModel(
      {required this.decisionName,
      required this.criteriaSetName,
      required this.criteriaName,
      required this.opinionCount});

  factory _$_OpinionSetModel.fromJson(Map<String, dynamic> json) =>
      _$$_OpinionSetModelFromJson(json);

  @override
  final String decisionName;
  @override
  final String criteriaSetName;
  @override
  final String criteriaName;
  @override
  final int opinionCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OpinionSetModel(decisionName: $decisionName, criteriaSetName: $criteriaSetName, criteriaName: $criteriaName, opinionCount: $opinionCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OpinionSetModel'))
      ..add(DiagnosticsProperty('decisionName', decisionName))
      ..add(DiagnosticsProperty('criteriaSetName', criteriaSetName))
      ..add(DiagnosticsProperty('criteriaName', criteriaName))
      ..add(DiagnosticsProperty('opinionCount', opinionCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpinionSetModel &&
            (identical(other.decisionName, decisionName) ||
                other.decisionName == decisionName) &&
            (identical(other.criteriaSetName, criteriaSetName) ||
                other.criteriaSetName == criteriaSetName) &&
            (identical(other.criteriaName, criteriaName) ||
                other.criteriaName == criteriaName) &&
            (identical(other.opinionCount, opinionCount) ||
                other.opinionCount == opinionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, decisionName, criteriaSetName, criteriaName, opinionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpinionSetModelCopyWith<_$_OpinionSetModel> get copyWith =>
      __$$_OpinionSetModelCopyWithImpl<_$_OpinionSetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpinionSetModelToJson(
      this,
    );
  }
}

abstract class _OpinionSetModel implements OpinionSetModel {
  factory _OpinionSetModel(
      {required final String decisionName,
      required final String criteriaSetName,
      required final String criteriaName,
      required final int opinionCount}) = _$_OpinionSetModel;

  factory _OpinionSetModel.fromJson(Map<String, dynamic> json) =
      _$_OpinionSetModel.fromJson;

  @override
  String get decisionName;
  @override
  String get criteriaSetName;
  @override
  String get criteriaName;
  @override
  int get opinionCount;
  @override
  @JsonKey(ignore: true)
  _$$_OpinionSetModelCopyWith<_$_OpinionSetModel> get copyWith =>
      throw _privateConstructorUsedError;
}
