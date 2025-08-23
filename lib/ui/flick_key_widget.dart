import 'package:flutter/material.dart';
import 'package:katakana_custom_keyboard/model/key_theme_model.dart';

class FlickKeyWidget extends StatelessWidget {
  const FlickKeyWidget({
    super.key,
    required this.offsetFromCenterKey,
    required this.centerText,
    required this.width,
    required this.height,
    required this.isSelecting,
    required this.keyTheme,
  });

  final Offset offsetFromCenterKey;
  final String centerText;
  final double width;
  final double height;
  final bool isSelecting;
  final KeyThemeModel keyTheme;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offsetFromCenterKey,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(keyTheme.backgroundColor),
          border: Border.all(
            color: Color(keyTheme.borderColor),
            width: keyTheme.borderWidth,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          centerText,
          style: TextStyle(
            fontSize: keyTheme.fontSize,
            color: Color(keyTheme.foregroundColor),
          ),
        ),
      ),
    );
  }
}
