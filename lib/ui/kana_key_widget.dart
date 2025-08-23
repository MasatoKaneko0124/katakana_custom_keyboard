import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_custom_keyboard/model/flick_direction.dart';
import 'package:katakana_custom_keyboard/model/kana_key_model.dart';
import 'package:katakana_custom_keyboard/model/key_theme_model.dart';
import 'package:katakana_custom_keyboard/ui/flick_key_widget.dart';
import 'package:katakana_custom_keyboard/ui/main_key_widget.dart';
import 'package:katakana_custom_keyboard/view_models/kana_key_view_model.dart';

class KanaKeyWidget extends ConsumerStatefulWidget {
  const KanaKeyWidget({
    super.key,
    required this.mainCharacter,
    required this.flickCharacterMap,
    required this.onKeyInputted,
    required this.onFlickStart,
    required this.onFlickEnd,
    required this.width,
    required this.height,
    required this.mainKeyTheme,
    required this.flickSelectedKeyTheme,
    required this.flickUnselectedKeyTheme,
  });

  final String mainCharacter;
  final Map<FlickDirection, String> flickCharacterMap;
  final Function(String) onKeyInputted;
  final Function() onFlickStart;
  final Function() onFlickEnd;
  final double width;
  final double height;
  final KeyThemeModel mainKeyTheme;
  final KeyThemeModel flickSelectedKeyTheme;
  final KeyThemeModel flickUnselectedKeyTheme;

  @override
  ConsumerState<KanaKeyWidget> createState() => _KanaKeyWidgetState();
}

class _KanaKeyWidgetState extends ConsumerState<KanaKeyWidget> {
  late final _kanaKeyViewModel = KanaKeyViewModelProvider(
    mainCharacter: widget.mainCharacter,
    flickCharacterMap: widget.flickCharacterMap,
  );

  // MainKeyWidgetのグローバル座標とサイズの情報をもつRenderBoxの取得に使用するGlobalKey
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final kanaKey = ref.watch(_kanaKeyViewModel);
    final kanaKeyNotifier = _kanaKeyViewModel.notifier;

    return GestureDetector(
      onTap: () => widget.onKeyInputted(kanaKey.currentSelectedCharacter ?? ''),
      onLongPressStart: (_) {
        widget.onFlickStart();
        ref.read(kanaKeyNotifier).startFlick();
      },
      onLongPressMoveUpdate: (details) =>
          _handleFlickUpdate(details.globalPosition),
      onLongPressEnd: (_) {
        _handleFlickEnd(kanaKey);
        widget.onFlickEnd();
      },
      onPanStart: (_) {
        widget.onFlickStart();
        ref.read(kanaKeyNotifier).startFlick();
      },
      onPanUpdate: (details) => _handleFlickUpdate(details.globalPosition),
      onPanEnd: (_) {
        _handleFlickEnd(kanaKey);
        widget.onFlickEnd();
      },
      child: Stack(
        children: [
          // フリック中に、各方向のフリックキー(候補キー)を表示する
          // フリックキーは、メインキーから特定のオフセット位置分ずらした箇所に配置される
          if (kanaKey.isFlicking)
            ..._buildFlickedKeys(kanaKey, kanaKey.currentFlickDirection),
          MainKeyWidget(
            globalKey: _globalKey,
            mainCharacter: kanaKey.mainCharacter,
            width: widget.width,
            height: widget.height,
            keyTheme: kanaKey.isFlicking
                ? (kanaKey.currentFlickDirection == FlickDirection.none
                      ? widget.flickSelectedKeyTheme
                      : widget.flickUnselectedKeyTheme)
                : widget.mainKeyTheme,
          ),
        ],
      ),
    );
  }

  /// フリックキーウィジットを生成する
  List<Widget> _buildFlickedKeys(
    KanaKeyModel kanaKey,
    FlickDirection currentFlickDirection,
  ) {
    return kanaKey.flickCharacterMap.entries.map((entry) {
      final isSelecting = entry.key == currentFlickDirection;
      return FlickKeyWidget(
        offsetFromCenterKey: entry.key.calcOffset(widget.width, widget.height),
        centerText: entry.value,
        width: widget.width,
        height: widget.height,
        isSelecting: isSelecting,
        keyTheme: isSelecting
            ? widget.flickSelectedKeyTheme
            : widget.flickUnselectedKeyTheme,
      );
    }).toList();
  }

  /// フリック更新時にフリック方向を判定して状態を更新する
  void _handleFlickUpdate(Offset globalPosition) {
    // タッチ位置に基づいてフリック方向を判定
    ref
        .read(_kanaKeyViewModel.notifier)
        .updateFlickDirection(_calcFlickDirection(globalPosition));
  }

  /// フリック終了時に入力キーを通知して状態をリセットする
  void _handleFlickEnd(KanaKeyModel key) {
    widget.onKeyInputted(key.currentSelectedCharacter ?? '');
    ref.read(_kanaKeyViewModel.notifier).endFlick();
  }

  /// タッチ位置に基づいてフリック方向を判定して返す
  FlickDirection _calcFlickDirection(Offset touchOffset) {
    // 判定結果を格納する変数（nullなら「フリックなし」を意味する）
    final FlickDirection flickDirection;

    if (_isInsideWidget(touchOffset)) {
      // タッチ位置がメインキーの中であれば、フリック方向はなし（null）
      flickDirection = FlickDirection.none;
    } else {
      // タッチ位置がメインキー(中央の)の外であれば、フリック方向を判定する
      flickDirection = _determineDirection(touchOffset);
    }

    // フリック方向を返す
    return flickDirection;
  }

  /// タッチ位置がメインキー(中央のキー)の範囲内かどうかを判定する
  bool _isInsideWidget(Offset touchOffset) {
    // メインキー(中央のキー)の位置とサイズを取得（RenderBox経由）
    final renderBox = _renderBox;
    if (renderBox == null) return false;

    // メインキー(中央のキー)の左上の位置（グローバル座標）
    final topLeft = renderBox.localToGlobal(Offset.zero);
    // メインキー(中央のキー)のサイズ（幅と高さ）
    final size = renderBox.size;

    // 左上位置とサイズから四角形（Rect）を作成
    final widgetRect = topLeft & size;

    // タッチ位置がその中に含まれているかを判定
    return widgetRect.contains(touchOffset);
  }

  /// フリック方向を判定
  FlickDirection _determineDirection(Offset touchOffset) {
    // メインキー(中央のキー)の中心座標を計算
    final centerKeyOffset = _calcBaseKeyCenterOffset();

    // タッチ位置とメインキー(中央のキー)中心の差分（ベクトル）を取得
    final delta = touchOffset - centerKeyOffset;

    // 横方向の移動量が大きいか、縦方向の移動量が大きいかで分岐
    if (delta.dx.abs() > delta.dy.abs()) {
      // 横方向の方が大きい → 左右方向のフリック
      return delta.dx > 0 ? FlickDirection.right : FlickDirection.left;
    } else {
      // 縦方向の方が大きい → 上下方向のフリック
      return delta.dy > 0 ? FlickDirection.down : FlickDirection.up;
    }
  }

  /// メインキー(中央のキー)の中心座標（Offset）を計算する
  Offset _calcBaseKeyCenterOffset() {
    // メインキー(中央のキー)の位置とサイズを取得（RenderBox経由）
    final renderBox = _renderBox;
    if (renderBox == null) {
      throw Exception('エラー: メインキー(中央のキー)の中心位置を取得できませんでした');
    }

    // メインキー(中央のキー)の左上の位置（グローバル座標）
    final topLeft = renderBox.localToGlobal(Offset.zero);

    // メインキー(中央のキー)のサイズ（幅と高さ）
    final size = renderBox.size;

    // 左上位置にサイズの半分を加算して中心点を算出
    return topLeft + Offset(size.width / 2, size.height / 2);
  }

  /// メインキー(中央のキー)のRenderBoxを取得
  RenderBox? get _renderBox =>
      _globalKey.currentContext?.findRenderObject() as RenderBox?;
}
