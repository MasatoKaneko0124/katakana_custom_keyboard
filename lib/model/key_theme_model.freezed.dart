// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KeyThemeModel {
  double get borderWidth;
  int get borderColor;
  int get foregroundColor;
  int get backgroundColor; // orange
  double get iconSize;
  double get fontSize;

  /// Create a copy of KeyThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KeyThemeModelCopyWith<KeyThemeModel> get copyWith =>
      _$KeyThemeModelCopyWithImpl<KeyThemeModel>(
          this as KeyThemeModel, _$identity);

  /// Serializes this KeyThemeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KeyThemeModel &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.iconSize, iconSize) ||
                other.iconSize == iconSize) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, borderWidth, borderColor,
      foregroundColor, backgroundColor, iconSize, fontSize);

  @override
  String toString() {
    return 'KeyThemeModel(borderWidth: $borderWidth, borderColor: $borderColor, foregroundColor: $foregroundColor, backgroundColor: $backgroundColor, iconSize: $iconSize, fontSize: $fontSize)';
  }
}

/// @nodoc
abstract mixin class $KeyThemeModelCopyWith<$Res> {
  factory $KeyThemeModelCopyWith(
          KeyThemeModel value, $Res Function(KeyThemeModel) _then) =
      _$KeyThemeModelCopyWithImpl;
  @useResult
  $Res call(
      {double borderWidth,
      int borderColor,
      int foregroundColor,
      int backgroundColor,
      double iconSize,
      double fontSize});
}

/// @nodoc
class _$KeyThemeModelCopyWithImpl<$Res>
    implements $KeyThemeModelCopyWith<$Res> {
  _$KeyThemeModelCopyWithImpl(this._self, this._then);

  final KeyThemeModel _self;
  final $Res Function(KeyThemeModel) _then;

  /// Create a copy of KeyThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? borderWidth = null,
    Object? borderColor = null,
    Object? foregroundColor = null,
    Object? backgroundColor = null,
    Object? iconSize = null,
    Object? fontSize = null,
  }) {
    return _then(_self.copyWith(
      borderWidth: null == borderWidth
          ? _self.borderWidth
          : borderWidth // ignore: cast_nullable_to_non_nullable
              as double,
      borderColor: null == borderColor
          ? _self.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as int,
      foregroundColor: null == foregroundColor
          ? _self.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      iconSize: null == iconSize
          ? _self.iconSize
          : iconSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontSize: null == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _KeyThemeModel extends KeyThemeModel {
  const _KeyThemeModel(
      {this.borderWidth = 1.0,
      this.borderColor = 0xFF000000,
      this.foregroundColor = 0xFFFFFFFF,
      this.backgroundColor = 0xFFFF9800,
      this.iconSize = 24.0,
      this.fontSize = 24.0})
      : super._();
  factory _KeyThemeModel.fromJson(Map<String, dynamic> json) =>
      _$KeyThemeModelFromJson(json);

  @override
  @JsonKey()
  final double borderWidth;
  @override
  @JsonKey()
  final int borderColor;
  @override
  @JsonKey()
  final int foregroundColor;
  @override
  @JsonKey()
  final int backgroundColor;
// orange
  @override
  @JsonKey()
  final double iconSize;
  @override
  @JsonKey()
  final double fontSize;

  /// Create a copy of KeyThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KeyThemeModelCopyWith<_KeyThemeModel> get copyWith =>
      __$KeyThemeModelCopyWithImpl<_KeyThemeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KeyThemeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeyThemeModel &&
            (identical(other.borderWidth, borderWidth) ||
                other.borderWidth == borderWidth) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.iconSize, iconSize) ||
                other.iconSize == iconSize) &&
            (identical(other.fontSize, fontSize) ||
                other.fontSize == fontSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, borderWidth, borderColor,
      foregroundColor, backgroundColor, iconSize, fontSize);

  @override
  String toString() {
    return 'KeyThemeModel(borderWidth: $borderWidth, borderColor: $borderColor, foregroundColor: $foregroundColor, backgroundColor: $backgroundColor, iconSize: $iconSize, fontSize: $fontSize)';
  }
}

/// @nodoc
abstract mixin class _$KeyThemeModelCopyWith<$Res>
    implements $KeyThemeModelCopyWith<$Res> {
  factory _$KeyThemeModelCopyWith(
          _KeyThemeModel value, $Res Function(_KeyThemeModel) _then) =
      __$KeyThemeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double borderWidth,
      int borderColor,
      int foregroundColor,
      int backgroundColor,
      double iconSize,
      double fontSize});
}

/// @nodoc
class __$KeyThemeModelCopyWithImpl<$Res>
    implements _$KeyThemeModelCopyWith<$Res> {
  __$KeyThemeModelCopyWithImpl(this._self, this._then);

  final _KeyThemeModel _self;
  final $Res Function(_KeyThemeModel) _then;

  /// Create a copy of KeyThemeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? borderWidth = null,
    Object? borderColor = null,
    Object? foregroundColor = null,
    Object? backgroundColor = null,
    Object? iconSize = null,
    Object? fontSize = null,
  }) {
    return _then(_KeyThemeModel(
      borderWidth: null == borderWidth
          ? _self.borderWidth
          : borderWidth // ignore: cast_nullable_to_non_nullable
              as double,
      borderColor: null == borderColor
          ? _self.borderColor
          : borderColor // ignore: cast_nullable_to_non_nullable
              as int,
      foregroundColor: null == foregroundColor
          ? _self.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      iconSize: null == iconSize
          ? _self.iconSize
          : iconSize // ignore: cast_nullable_to_non_nullable
              as double,
      fontSize: null == fontSize
          ? _self.fontSize
          : fontSize // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
