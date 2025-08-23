import 'package:katakana_custom_keyboard/model/flick_direction.dart';

/// フリック用のカナ文字定義
const kanaCharacters = <String, List<String?>>{
  // 中心文字: [フリック左, 上, 右, 下]
  "ア": ["イ", "ウ", "エ", "オ"],
  "カ": ["キ", "ク", "ケ", "コ"],
  "サ": ["シ", "ス", "セ", "ソ"],
  "タ": ["チ", "ツ", "テ", "ト"],
  "ナ": ["ニ", "ヌ", "ネ", "ノ"],
  "ハ": ["ヒ", "フ", "ヘ", "ホ"],
  "マ": ["ミ", "ム", "メ", "モ"],
  "ヤ": [null, "ユ", null, "ヨ"],
  "ラ": ["リ", "ル", "レ", "ロ"],
  "ワ": ["ヲ", "ン", "ー", null],
};

/// [MapEntry(ア: {FlickDirection.left: イ, FlickDirection.up: ウ, FlickDirection.right: エ, FlickDirection.down: オ}), ...] の形式に変換
final List<MapEntry<String, Map<FlickDirection, String>>> kanaDataList =
    kanaCharacters.entries
        .map(
          (entry) => MapEntry(entry.key, {
            if (entry.value[0] != null) FlickDirection.left: entry.value[0]!,
            if (entry.value[1] != null) FlickDirection.up: entry.value[1]!,
            if (entry.value[2] != null) FlickDirection.right: entry.value[2]!,
            if (entry.value[3] != null) FlickDirection.down: entry.value[3]!,
          }),
        )
        .toList();
