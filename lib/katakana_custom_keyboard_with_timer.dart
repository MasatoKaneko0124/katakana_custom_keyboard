import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_custom_keyboard/katakana_custom_keyboard.dart';
import 'package:katakana_custom_keyboard/model/keyboard_theme_model.dart';
import 'package:katakana_custom_keyboard/utils/kana_utils.dart';

class KatakanaCustomKeyboardWithTimer extends ConsumerStatefulWidget {
  const KatakanaCustomKeyboardWithTimer({
    super.key,
    this.onKanaInput,
    this.onDeleteKeyTapped,
    this.onDiacriticKeyTapped,
    this.onNextKeyTapped,
    this.onBackKeyTapped,
    this.onSettingKeyTapped,
    this.onOptionalKeyTapped,
    this.onTimerStarted,
    this.onTimerEnded,
    this.onTimerStopped,
    this.optionalKeyChild,
    required this.width,
    required this.height,
    this.theme,
    this.timerDurationMsec = 1000,
  });

  final void Function(String?)? onKanaInput;
  final void Function()? onDeleteKeyTapped;
  final void Function()? onDiacriticKeyTapped;
  final void Function()? onNextKeyTapped;
  final void Function()? onBackKeyTapped;
  final void Function()? onSettingKeyTapped;
  final void Function()? onOptionalKeyTapped;
  final void Function()? onTimerStarted;
  final void Function()? onTimerEnded;
  final void Function()? onTimerStopped;
  final Widget? optionalKeyChild;
  final double width;
  final double height;
  final KeyboardThemeModel? theme;
  final int timerDurationMsec;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      KatakanaCustomKeyboardWithTimerState();
}

class KatakanaCustomKeyboardWithTimerState
    extends ConsumerState<KatakanaCustomKeyboardWithTimer> {
  Timer? _timer;
  bool _isRepeatingTap = false;
  String? _lastInputKey;
  String? _currentCharacter;

  @override
  Widget build(BuildContext context) {
    return KatakanaCustomKeyboard(
      onKanaKeyTapped: _onKanaKeyTapped,
      onDeleteKeyTapped: () => widget.onDeleteKeyTapped?.call(),
      onKanaKeyFlickStarted: (_) => _stopTimer(),
      onKanaKeyFlickEnded: (inputKey) {
        widget.onKanaInput?.call(inputKey);
        _lastInputKey = inputKey;
        _currentCharacter = inputKey;
      },
      onDiacriticKeyTapped: _onDiacriticKeyTapped,
      onNextKeyTapped: () => widget.onNextKeyTapped?.call(),
      onBackKeyTapped: () => widget.onBackKeyTapped?.call(),
      onSettingKeyTapped: () => widget.onSettingKeyTapped?.call(),
      onOptionalKeyTapped: () => widget.onOptionalKeyTapped?.call(),
      optionalKeyChild: widget.optionalKeyChild,
      width: widget.width,
      height: widget.height,
      theme: widget.theme,
    );
  }

  void _onKanaKeyTapped(String inputKey) {
    _stopTimer();
    if (_isRepeatingTap && inputKey == _lastInputKey) {
      // 一定時間内の同一キータップは、連続タップとして扱う
      if (_currentCharacter != null) {
        final convertedCharacter =
            KanaUtils.getGarakeNextKana(_currentCharacter!);
        if (convertedCharacter == null) {
          _currentCharacter = inputKey;
        } else {
          _currentCharacter = convertedCharacter;
        }
      }
    } else {
      //一定時間外の同一キータップor別キータップは、新たなキー入力として扱う
      _currentCharacter = inputKey;
    }
    widget.onKanaInput?.call(_currentCharacter ?? inputKey);
    _lastInputKey = inputKey;
    _isRepeatingTap = true;
    _startTimer();
  }

  void _onDiacriticKeyTapped() {
    _stopTimer();

    if (_currentCharacter == null) return;
    // 半濁点付与を試みる
    final convertedCharacter =
        KanaUtils.switchKanaDiacritic(_currentCharacter!);
    if (convertedCharacter == null) return;
    _currentCharacter = convertedCharacter;
    widget.onKanaInput?.call(_currentCharacter);

    // 濁点・半濁点の付与・除去が行われた場合のみタイマースタート
    _startTimer();
  }

  void _startTimer() {
    widget.onTimerStarted?.call();
    _timer = Timer(Duration(milliseconds: widget.timerDurationMsec), () {
      // 連続タップの評価
      _isRepeatingTap = false;
      widget.onTimerEnded?.call();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    widget.onTimerStopped?.call();
  }
}
