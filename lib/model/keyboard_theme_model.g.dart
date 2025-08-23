// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KeyboardThemeModel _$KeyboardThemeModelFromJson(Map<String, dynamic> json) =>
    _KeyboardThemeModel(
      mainKeyTheme:
          KeyThemeModel.fromJson(json['mainKeyTheme'] as Map<String, dynamic>),
      flickSelectedKeyTheme: KeyThemeModel.fromJson(
          json['flickSelectedKeyTheme'] as Map<String, dynamic>),
      flickUnselectedKeyTheme: KeyThemeModel.fromJson(
          json['flickUnselectedKeyTheme'] as Map<String, dynamic>),
      nextAndBackKeyTheme: KeyThemeModel.fromJson(
          json['nextAndBackKeyTheme'] as Map<String, dynamic>),
      extraKeyTheme:
          KeyThemeModel.fromJson(json['extraKeyTheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeyboardThemeModelToJson(_KeyboardThemeModel instance) =>
    <String, dynamic>{
      'mainKeyTheme': instance.mainKeyTheme,
      'flickSelectedKeyTheme': instance.flickSelectedKeyTheme,
      'flickUnselectedKeyTheme': instance.flickUnselectedKeyTheme,
      'nextAndBackKeyTheme': instance.nextAndBackKeyTheme,
      'extraKeyTheme': instance.extraKeyTheme,
    };
