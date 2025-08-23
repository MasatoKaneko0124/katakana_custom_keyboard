import 'package:freezed_annotation/freezed_annotation.dart';

part 'key_theme_model.freezed.dart';
part 'key_theme_model.g.dart';

@freezed
abstract class KeyThemeModel with _$KeyThemeModel {
  const KeyThemeModel._();

  const factory KeyThemeModel({
    @Default(1.0) double borderWidth,
    @Default(0xFF000000) int borderColor,
    @Default(0xFFFFFFFF) int foregroundColor,
    @Default(0xFFFF9800) int backgroundColor, // orange
    @Default(24.0) double iconSize,
    @Default(24.0) double fontSize,
  }) = _KeyThemeModel;

  factory KeyThemeModel.fromJson(Map<String, Object?> json) =>
      _$KeyThemeModelFromJson(json);
}
