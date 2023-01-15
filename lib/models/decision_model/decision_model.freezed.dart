// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DecisionModel _$DecisionModelFromJson(Map<String, dynamic> json) {
  return _DecisionModel.fromJson(json);
}

/// @nodoc
mixin _$DecisionModel {
  String get decisionId => throw _privateConstructorUsedError;
  String get decisionCode => throw _privateConstructorUsedError;
  String get decisionName => throw _privateConstructorUsedError;
  String get decisionQuestion => throw _privateConstructorUsedError;
  int get decisionIsLocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DecisionModelCopyWith<DecisionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DecisionModelCopyWith<$Res> {
  factory $DecisionModelCopyWith(
          DecisionModel value, $Res Function(DecisionModel) then) =
      _$DecisionModelCopyWithImpl<$Res, DecisionModel>;
  @useResult
  $Res call(
      {String decisionId,
      String decisionCode,
      String decisionName,
      String decisionQuestion,
      int decisionIsLocked});
}

/// @nodoc
class _$DecisionModelCopyWithImpl<$Res, $Val extends DecisionModel>
    implements $DecisionModelCopyWith<$Res> {
  _$DecisionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionId = null,
    Object? decisionCode = null,
    Object? decisionName = null,
    Object? decisionQuestion = null,
    Object? decisionIsLocked = null,
  }) {
    return _then(_value.copyWith(
      decisionId: null == decisionId
          ? _value.decisionId
          : decisionId // ignore: cast_nullable_to_non_nullable
              as String,
      decisionCode: null == decisionCode
          ? _value.decisionCode
          : decisionCode // ignore: cast_nullable_to_non_nullable
              as String,
      decisionName: null == decisionName
          ? _value.decisionName
          : decisionName // ignore: cast_nullable_to_non_nullable
              as String,
      decisionQuestion: null == decisionQuestion
          ? _value.decisionQuestion
          : decisionQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      decisionIsLocked: null == decisionIsLocked
          ? _value.decisionIsLocked
          : decisionIsLocked // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DecisionModelCopyWith<$Res>
    implements $DecisionModelCopyWith<$Res> {
  factory _$$_DecisionModelCopyWith(
          _$_DecisionModel value, $Res Function(_$_DecisionModel) then) =
      __$$_DecisionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String decisionId,
      String decisionCode,
      String decisionName,
      String decisionQuestion,
      int decisionIsLocked});
}

/// @nodoc
class __$$_DecisionModelCopyWithImpl<$Res>
    extends _$DecisionModelCopyWithImpl<$Res, _$_DecisionModel>
    implements _$$_DecisionModelCopyWith<$Res> {
  __$$_DecisionModelCopyWithImpl(
      _$_DecisionModel _value, $Res Function(_$_DecisionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionId = null,
    Object? decisionCode = null,
    Object? decisionName = null,
    Object? decisionQuestion = null,
    Object? decisionIsLocked = null,
  }) {
    return _then(_$_DecisionModel(
      decisionId: null == decisionId
          ? _value.decisionId
          : decisionId // ignore: cast_nullable_to_non_nullable
              as String,
      decisionCode: null == decisionCode
          ? _value.decisionCode
          : decisionCode // ignore: cast_nullable_to_non_nullable
              as String,
      decisionName: null == decisionName
          ? _value.decisionName
          : decisionName // ignore: cast_nullable_to_non_nullable
              as String,
      decisionQuestion: null == decisionQuestion
          ? _value.decisionQuestion
          : decisionQuestion // ignore: cast_nullable_to_non_nullable
              as String,
      decisionIsLocked: null == decisionIsLocked
          ? _value.decisionIsLocked
          : decisionIsLocked // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DecisionModel implements _DecisionModel {
  _$_DecisionModel(
      {required this.decisionId,
      required this.decisionCode,
      required this.decisionName,
      required this.decisionQuestion,
      required this.decisionIsLocked});

  factory _$_DecisionModel.fromJson(Map<String, dynamic> json) =>
      _$$_DecisionModelFromJson(json);

  @override
  final String decisionId;
  @override
  final String decisionCode;
  @override
  final String decisionName;
  @override
  final String decisionQuestion;
  @override
  final int decisionIsLocked;

  @override
  String toString() {
    return 'DecisionModel(decisionId: $decisionId, decisionCode: $decisionCode, decisionName: $decisionName, decisionQuestion: $decisionQuestion, decisionIsLocked: $decisionIsLocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DecisionModel &&
            (identical(other.decisionId, decisionId) ||
                other.decisionId == decisionId) &&
            (identical(other.decisionCode, decisionCode) ||
                other.decisionCode == decisionCode) &&
            (identical(other.decisionName, decisionName) ||
                other.decisionName == decisionName) &&
            (identical(other.decisionQuestion, decisionQuestion) ||
                other.decisionQuestion == decisionQuestion) &&
            (identical(other.decisionIsLocked, decisionIsLocked) ||
                other.decisionIsLocked == decisionIsLocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, decisionId, decisionCode,
      decisionName, decisionQuestion, decisionIsLocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DecisionModelCopyWith<_$_DecisionModel> get copyWith =>
      __$$_DecisionModelCopyWithImpl<_$_DecisionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DecisionModelToJson(
      this,
    );
  }
}

abstract class _DecisionModel implements DecisionModel {
  factory _DecisionModel(
      {required final String decisionId,
      required final String decisionCode,
      required final String decisionName,
      required final String decisionQuestion,
      required final int decisionIsLocked}) = _$_DecisionModel;

  factory _DecisionModel.fromJson(Map<String, dynamic> json) =
      _$_DecisionModel.fromJson;

  @override
  String get decisionId;
  @override
  String get decisionCode;
  @override
  String get decisionName;
  @override
  String get decisionQuestion;
  @override
  int get decisionIsLocked;
  @override
  @JsonKey(ignore: true)
  _$$_DecisionModelCopyWith<_$_DecisionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
