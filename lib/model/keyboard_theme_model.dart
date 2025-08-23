import 'package:freezed_annotation/freezed_annotation.dart';

import 'key_theme_model.dart';

part 'keyboard_theme_model.freezed.dart';
part 'keyboard_theme_model.g.dart';

@freezed
abstract class KeyboardThemeModel with _$KeyboardThemeModel {
  const KeyboardThemeModel._();
  const factory KeyboardThemeModel({
    required KeyThemeModel mainKeyTheme,
    required KeyThemeModel flickSelectedKeyTheme,
    required KeyThemeModel flickUnselectedKeyTheme,
    required KeyThemeModel nextAndBackKeyTheme,
    required KeyThemeModel extraKeyTheme,
  }) = _KeyboardThemeModel;

  factory KeyboardThemeModel.fromJson(Map<String, Object?> json) =>
      _$KeyboardThemeModelFromJson(json);
}
