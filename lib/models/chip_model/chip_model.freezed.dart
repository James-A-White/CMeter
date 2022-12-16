// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'chip_model.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

// ChipModel _$ChipModelFromJson(Map<String, dynamic> json) {
//   return _ChipModel.fromJson(json);
// }

// /// @nodoc
// mixin _$ChipModel {
//   int get opinionRating => throw _privateConstructorUsedError;
//   String get chipId => throw _privateConstructorUsedError;
//   String get chipColor => throw _privateConstructorUsedError;
//   String get textColor => throw _privateConstructorUsedError;
//   String get chipText => throw _privateConstructorUsedError;

//   Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
//   @JsonKey(ignore: true)
//   $ChipModelCopyWith<ChipModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $ChipModelCopyWith<$Res> {
//   factory $ChipModelCopyWith(ChipModel value, $Res Function(ChipModel) then) =
//       _$ChipModelCopyWithImpl<$Res, ChipModel>;
//   @useResult
//   $Res call(
//       {int opinionRating,
//       String chipId,
//       String chipColor,
//       String textColor,
//       String chipText});
// }

// /// @nodoc
// class _$ChipModelCopyWithImpl<$Res, $Val extends ChipModel>
//     implements $ChipModelCopyWith<$Res> {
//   _$ChipModelCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? opinionRating = null,
//     Object? chipId = null,
//     Object? chipColor = null,
//     Object? textColor = null,
//     Object? chipText = null,
//   }) {
//     return _then(_value.copyWith(
//       opinionRating: null == opinionRating
//           ? _value.opinionRating
//           : opinionRating // ignore: cast_nullable_to_non_nullable
//               as int,
//       chipId: null == chipId
//           ? _value.chipId
//           : chipId // ignore: cast_nullable_to_non_nullable
//               as String,
//       chipColor: null == chipColor
//           ? _value.chipColor
//           : chipColor // ignore: cast_nullable_to_non_nullable
//               as String,
//       textColor: null == textColor
//           ? _value.textColor
//           : textColor // ignore: cast_nullable_to_non_nullable
//               as String,
//       chipText: null == chipText
//           ? _value.chipText
//           : chipText // ignore: cast_nullable_to_non_nullable
//               as String,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$_ChipModelCopyWith<$Res> implements $ChipModelCopyWith<$Res> {
//   factory _$$_ChipModelCopyWith(
//           _$_ChipModel value, $Res Function(_$_ChipModel) then) =
//       __$$_ChipModelCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {int opinionRating,
//       String chipId,
//       String chipColor,
//       String textColor,
//       String chipText});
// }

// /// @nodoc
// class __$$_ChipModelCopyWithImpl<$Res>
//     extends _$ChipModelCopyWithImpl<$Res, _$_ChipModel>
//     implements _$$_ChipModelCopyWith<$Res> {
//   __$$_ChipModelCopyWithImpl(
//       _$_ChipModel _value, $Res Function(_$_ChipModel) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? opinionRating = null,
//     Object? chipId = null,
//     Object? chipColor = null,
//     Object? textColor = null,
//     Object? chipText = null,
//   }) {
//     return _then(_$_ChipModel(
//       opinionRating: null == opinionRating
//           ? _value.opinionRating
//           : opinionRating // ignore: cast_nullable_to_non_nullable
//               as int,
//       chipId: null == chipId
//           ? _value.chipId
//           : chipId // ignore: cast_nullable_to_non_nullable
//               as String,
//       chipColor: null == chipColor
//           ? _value.chipColor
//           : chipColor // ignore: cast_nullable_to_non_nullable
//               as String,
//       textColor: null == textColor
//           ? _value.textColor
//           : textColor // ignore: cast_nullable_to_non_nullable
//               as String,
//       chipText: null == chipText
//           ? _value.chipText
//           : chipText // ignore: cast_nullable_to_non_nullable
//               as String,
//     ));
//   }
// }

// /// @nodoc
// @JsonSerializable()
// class _$_ChipModel with DiagnosticableTreeMixin implements _ChipModel {
//   _$_ChipModel(
//       {required this.opinionRating,
//       required this.chipId,
//       required this.chipColor,
//       required this.textColor,
//       required this.chipText});

//   factory _$_ChipModel.fromJson(Map<String, dynamic> json) =>
//       _$$_ChipModelFromJson(json);

//   @override
//   final int opinionRating;
//   @override
//   final String chipId;
//   @override
//   final String chipColor;
//   @override
//   final String textColor;
//   @override
//   final String chipText;

//   @override
//   String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
//     return 'ChipModel(opinionRating: $opinionRating, chipId: $chipId, chipColor: $chipColor, textColor: $textColor, chipText: $chipText)';
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(DiagnosticsProperty('type', 'ChipModel'))
//       ..add(DiagnosticsProperty('opinionRating', opinionRating))
//       ..add(DiagnosticsProperty('chipId', chipId))
//       ..add(DiagnosticsProperty('chipColor', chipColor))
//       ..add(DiagnosticsProperty('textColor', textColor))
//       ..add(DiagnosticsProperty('chipText', chipText));
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_ChipModel &&
//             (identical(other.opinionRating, opinionRating) ||
//                 other.opinionRating == opinionRating) &&
//             (identical(other.chipId, chipId) || other.chipId == chipId) &&
//             (identical(other.chipColor, chipColor) ||
//                 other.chipColor == chipColor) &&
//             (identical(other.textColor, textColor) ||
//                 other.textColor == textColor) &&
//             (identical(other.chipText, chipText) ||
//                 other.chipText == chipText));
//   }

//   @JsonKey(ignore: true)
//   @override
//   int get hashCode => Object.hash(
//       runtimeType, opinionRating, chipId, chipColor, textColor, chipText);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_ChipModelCopyWith<_$_ChipModel> get copyWith =>
//       __$$_ChipModelCopyWithImpl<_$_ChipModel>(this, _$identity);

//   @override
//   Map<String, dynamic> toJson() {
//     return _$$_ChipModelToJson(
//       this,
//     );
//   }
// }

// abstract class _ChipModel implements ChipModel {
//   factory _ChipModel(
//       {required final int opinionRating,
//       required final String chipId,
//       required final String chipColor,
//       required final String textColor,
//       required final String chipText}) = _$_ChipModel;

//   factory _ChipModel.fromJson(Map<String, dynamic> json) =
//       _$_ChipModel.fromJson;

//   @override
//   int get opinionRating;
//   @override
//   String get chipId;
//   @override
//   String get chipColor;
//   @override
//   String get textColor;
//   @override
//   String get chipText;
//   @override
//   @JsonKey(ignore: true)
//   _$$_ChipModelCopyWith<_$_ChipModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }
