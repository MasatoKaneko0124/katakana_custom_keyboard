import 'package:flutter/material.dart';
import 'package:katakana_custom_keyboard/model/key_theme_model.dart';

class MainKeyWidget extends StatelessWidget {
  const MainKeyWidget({
    super.key,
    required this.globalKey,
    required this.mainCharacter,
    required this.width,
    required this.height,
    required this.keyTheme,
  });

  final GlobalKey globalKey;
  final String mainCharacter;
  final double width;
  final double height;

  final KeyThemeModel keyTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(keyTheme.borderColor),
          width: keyTheme.borderWidth,
        ),
        color: Color(keyTheme.backgroundColor),
      ),
      child: Text(
        mainCharacter,
        style: TextStyle(
          fontSize: keyTheme.fontSize,
          color: Color(keyTheme.foregroundColor),
        ),
      ),
    );
  }
}
