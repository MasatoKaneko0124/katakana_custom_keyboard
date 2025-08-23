// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_theme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KeyThemeModel _$KeyThemeModelFromJson(Map<String, dynamic> json) =>
    _KeyThemeModel(
      borderWidth: (json['borderWidth'] as num?)?.toDouble() ?? 1.0,
      borderColor: (json['borderColor'] as num?)?.toInt() ?? 0xFF000000,
      foregroundColor: (json['foregroundColor'] as num?)?.toInt() ?? 0xFFFFFFFF,
      backgroundColor: (json['backgroundColor'] as num?)?.toInt() ?? 0xFFFF9800,
      iconSize: (json['iconSize'] as num?)?.toDouble() ?? 24.0,
      fontSize: (json['fontSize'] as num?)?.toDouble() ?? 24.0,
    );

Map<String, dynamic> _$KeyThemeModelToJson(_KeyThemeModel instance) =>
    <String, dynamic>{
      'borderWidth': instance.borderWidth,
      'borderColor': instance.borderColor,
      'foregroundColor': instance.foregroundColor,
      'backgroundColor': instance.backgroundColor,
      'iconSize': instance.iconSize,
      'fontSize': instance.fontSize,
    };
