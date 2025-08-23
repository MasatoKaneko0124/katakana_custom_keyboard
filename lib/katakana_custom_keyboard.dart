import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_custom_keyboard/constants/kana_data_list.dart';
import 'package:katakana_custom_keyboard/model/flick_direction.dart';
import 'package:katakana_custom_keyboard/ui/extra_key_widget.dart';
import 'package:katakana_custom_keyboard/ui/kana_key_widget.dart';
import 'package:katakana_custom_keyboard/utils/iterable_ext.dart';

import 'model/keyboard_theme_model.dart';

class KatakanaCustomKeyboard extends ConsumerStatefulWidget {
  const KatakanaCustomKeyboard({
    super.key,
    required this.onKanaKeyTapped,
    required this.onDeleteKeyTapped,
    required this.onDiacriticKeyTapped,
    required this.onNextKeyTapped,
    required this.onBackKeyTapped,
    required this.onSettingKeyTapped,
    required this.width,
    required this.height,
    required this.theme,
  });
  final Function(String) onKanaKeyTapped;
  final Function() onDeleteKeyTapped;
  final Function() onDiacriticKeyTapped;
  final Function() onNextKeyTapped;
  final Function() onBackKeyTapped;
  final Function() onSettingKeyTapped;
  final double width;
  final double height;
  final KeyboardThemeModel theme;

  @override
  ConsumerState<KatakanaCustomKeyboard> createState() =>
      _CrosswordKeyboardWidgetState();
}

class _CrosswordKeyboardWidgetState
    extends ConsumerState<KatakanaCustomKeyboard> {
  late final _squareWidth = widget.width / 5.0; // キーの幅は領域の幅の1/5
  late final _squareHeight = widget.height / 5.0; // キーの高さは領域の高さの1/5
  late final _leftPadding = _squareWidth; // キー全体の左部余白
  static const _horizontalGap = 0.0; // キー間の水平方向の間隔
  static const _keysPerRow = 3; // 1段あたりのキー数
  static const _specialKeyIndex = 9; // 特殊な配置を行うキーのインデックス
  final List<Widget> _kanaKeyWidgets = []; // KanaKeyWidgetのリスト(initStateで初期化する)
  late final Widget _deleteKeyWidget; // 削除キー(initStateで初期化する)
  late final Widget _diacriticKeyWidget; // 濁点・半濁点キー(initStateで初期化する)
  late final Widget _nextKeyWidget; // 次のセルに移動するキー(initStateで初期化する)
  late final Widget _backKeyWidget; // 前のセルに移動するキー(initStateで初期化する)
  late final Widget _settingKeyWidget; // 設定キー(initStateで初期化する)
  final _selectingKeyWidgets = StateProvider<Widget?>((_) => null); // フリック中のキー

  @override
  void initState() {
    _kanaKeyWidgets.addAll(
      // MapEntryをKanaKeyWidgetに変換し、_kanaKeyWidgetsに追加
      kanaDataList.mapWithIndex((e, index) => _buildKanaKeyWidget(e, index)),
    );
    _deleteKeyWidget = _buildDeleteKeyWidget();
    _diacriticKeyWidget = _buildDiacriticKeyWidget();
    _nextKeyWidget = _buildNextKeyWidget();
    _backKeyWidget = _buildBackKeyWidget();
    _settingKeyWidget = _buildSettingKeyWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          ..._kanaKeyWidgets,
          _deleteKeyWidget,
          _diacriticKeyWidget,
          _nextKeyWidget,
          _backKeyWidget,
          _settingKeyWidget,
          // フリック中のKanaKeyWidgetをStackの最後に重ね直す
          if (ref.watch(_selectingKeyWidgets) != null)
            ref.watch(_selectingKeyWidgets)!,
        ],
      ),
    );
  }

  Widget _buildKanaKeyWidget(
    MapEntry<String, Map<FlickDirection, String>> kanaData,
    int index,
  ) {
    final keyPosition = _calcKanaKeyPosition(index);
    return Positioned(
      left: keyPosition.left,
      top: keyPosition.top,
      child: KanaKeyWidget(
        mainCharacter: kanaData.key,
        flickCharacterMap: kanaData.value,
        onKeyInputted: widget.onKanaKeyTapped,
        onFlickStart: () => ref.read(_selectingKeyWidgets.notifier).state =
            _kanaKeyWidgets[index], // フリック中のキーを更新
        onFlickEnd: () => ref.read(_selectingKeyWidgets.notifier).state =
            null, // フリック終了時、フリック中のキーをリセット
        width: _squareWidth,
        height: _squareHeight,
        mainKeyTheme: widget.theme.mainKeyTheme,
        flickSelectedKeyTheme: widget.theme.flickSelectedKeyTheme,
        flickUnselectedKeyTheme: widget.theme.flickUnselectedKeyTheme,
      ),
    );
  }

  /// 仮名キーの表示位置を計算する
  ({double left, double top}) _calcKanaKeyPosition(int index) {
    double left = 0;
    double top = 0;

    switch (index) {
      case < _keysPerRow: // 1段目
        left = _leftPadding + index * (_squareWidth + _horizontalGap);
        top = _squareHeight;
      case < _keysPerRow * 2: // 2段目
        left =
            _leftPadding +
            (index - _keysPerRow) * (_squareWidth + _horizontalGap);
        top = _squareHeight * 2;
      case < _keysPerRow * 3: // 3段目
        left =
            _leftPadding +
            (index - _keysPerRow * 2) * (_squareWidth + _horizontalGap);
        top = _squareHeight * 3;
      case == _specialKeyIndex: // 特殊な配置を行うキー
        left = _leftPadding + (_squareWidth + _horizontalGap);
        top = _squareHeight * 4;
    }

    return (left: left, top: top);
  }

  Widget _buildDeleteKeyWidget() {
    return Positioned(
      left: _leftPadding + (_keysPerRow) * (_squareWidth + _horizontalGap),
      top: _squareHeight,
      child: ExtraKeyWidget(
        onKeyTapped: widget.onDeleteKeyTapped,
        width: _squareWidth,
        height: _squareHeight * 2,
        keyTheme: widget.theme.extraKeyTheme,
        icon: Icons.backspace,
      ),
    );
  }

  Widget _buildDiacriticKeyWidget() {
    return Positioned(
      left: _leftPadding,
      top: _squareHeight * 4,
      child: ExtraKeyWidget(
        onKeyTapped: widget.onDiacriticKeyTapped,
        width: _squareWidth,
        height: _squareHeight,
        keyTheme: widget.theme.mainKeyTheme,
        text: '゛゜',
      ),
    );
  }

  Widget _buildNextKeyWidget() {
    return Positioned(
      top: _squareHeight,
      child: ExtraKeyWidget(
        onKeyTapped: widget.onNextKeyTapped,
        width: _squareWidth,
        height: _squareHeight * 2,
        keyTheme: widget.theme.nextAndBackKeyTheme,
        text: '次のマス',
        icon: Icons.arrow_forward,
      ),
    );
  }

  Widget _buildBackKeyWidget() {
    return Positioned(
      top: _squareHeight * 3,
      child: ExtraKeyWidget(
        onKeyTapped: widget.onBackKeyTapped,
        width: _squareWidth,
        height: _squareHeight * 2,
        keyTheme: widget.theme.nextAndBackKeyTheme,
        text: '前のマス',
        icon: Icons.arrow_back,
      ),
    );
  }

  Widget _buildSettingKeyWidget() {
    return Positioned(
      left: _leftPadding + (_keysPerRow - 1) * (_squareWidth + _horizontalGap),
      top: _squareHeight * 4,
      child: ExtraKeyWidget(
        onKeyTapped: widget.onSettingKeyTapped,
        width: _squareWidth,
        height: _squareHeight,
        keyTheme: widget.theme.extraKeyTheme,
        icon: Icons.settings,
      ),
    );
  }
}
