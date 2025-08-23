import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:katakana_custom_keyboard/model/flick_direction.dart';

part 'kana_key_model.freezed.dart';

@freezed
abstract class KanaKeyModel with _$KanaKeyModel {
  const KanaKeyModel._();

  const factory KanaKeyModel({
    required String mainCharacter,
    required Map<FlickDirection, String> flickCharacterMap,
    @Default(false) bool isFlicking,
    @Default(FlickDirection.none) FlickDirection currentFlickDirection,
  }) = _KanaKeyModel;

  /// 現在のフリック方向に基づく適切な文字を返す
  String? get currentSelectedCharacter =>
      currentFlickDirection == FlickDirection.none
      // フリック方向がnoneの場合はメインキーを返す
      ? mainCharacter
      // フリック方向がnoneでない場合は、該当する方向のフリックキーを返す
      : flickCharacterMap[currentFlickDirection];
}
