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

  factory KeyboardThemeModel.defaultTheme() {
    return KeyboardThemeModel(
      mainKeyTheme: KeyThemeModel(),
      flickSelectedKeyTheme: KeyThemeModel(
        backgroundColor: 0xFFFFCC80,
      ),
      flickUnselectedKeyTheme: KeyThemeModel(
        backgroundColor: 0xFF616161,
      ),
      nextAndBackKeyTheme: KeyThemeModel(
        backgroundColor: 0xFF9E9E9E,
        iconSize: 24,
        fontSize: 14,
      ),
      extraKeyTheme: KeyThemeModel(backgroundColor: 0xFF9E9E9E),
    );
  }
}
