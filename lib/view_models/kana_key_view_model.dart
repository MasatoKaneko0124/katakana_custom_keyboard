import 'package:katakana_custom_keyboard/model/flick_direction.dart';
import 'package:katakana_custom_keyboard/model/kana_key_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kana_key_view_model.g.dart';

@riverpod
class KanaKeyViewModel extends _$KanaKeyViewModel {
  @override
  KanaKeyModel build({
    required String mainCharacter,
    required Map<FlickDirection, String> flickCharacterMap,
  }) {
    return KanaKeyModel(
      mainCharacter: mainCharacter,
      flickCharacterMap: flickCharacterMap,
    );
  }

  /// フリックを開始する
  void startFlick() => state = state.copyWith(isFlicking: true);

  /// 引数をもとにフリック方向を更新する
  void updateFlickDirection(FlickDirection newDirection) {
    // フリック中でない場合はなにもしない
    if (!state.isFlicking) return;
    // 同一方向の処理は1回にまとめる
    if (newDirection == state.currentFlickDirection) return;

    state = state.copyWith(currentFlickDirection: newDirection);
  }

  /// フリック終了時にフリック方向をリセットする
  void endFlick() {
    state = state.copyWith(
      isFlicking: false,
      currentFlickDirection: FlickDirection.none,
    );
  }
}
