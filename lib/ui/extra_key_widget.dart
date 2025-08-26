import 'package:flutter/material.dart';
import 'package:katakana_custom_keyboard/model/key_theme_model.dart';

class ExtraKeyWidget extends StatelessWidget {
  const ExtraKeyWidget({
    super.key,
    required this.onKeyTapped,
    required this.width,
    required this.height,
    this.child,
    this.icon,
    this.text,
    required this.keyTheme,
  });
  final Function() onKeyTapped;
  final double width;
  final double height;
  final Widget? child;
  final IconData? icon;
  final String? text;
  final KeyThemeModel keyTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onKeyTapped,
      child: Container(
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
        child: child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Color(keyTheme.foregroundColor),
                  size: keyTheme.iconSize,
                ),
                if (text != null)
                  Text(
                    text!,
                    style: TextStyle(
                      fontSize: keyTheme.fontSize,
                      color: Color(keyTheme.foregroundColor),
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}
