import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_custom_keyboard/katakana_custom_keyboard.dart';
import 'package:katakana_custom_keyboard/model/key_theme_model.dart';
import 'package:katakana_custom_keyboard/model/keyboard_theme_model.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KatakanaKeyboard Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'カタカナキーボード'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _label = "キーを押してください";

  void _setLabel(String label) {
    setState(() {
      _label = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_label, style: Theme.of(context).textTheme.headlineMedium),
            KatakanaCustomKeyboard(
              onKanaKeyTapped: (inputKey) => _setLabel(inputKey),
              onDeleteKeyTapped: () => _setLabel("削除"),
              onDiacriticKeyTapped: () => _setLabel("濁点・半濁点"),
              onNextKeyTapped: () => _setLabel("次へ"),
              onBackKeyTapped: () => _setLabel("前へ"),
              onSettingKeyTapped: () => _setLabel("設定"),
              width: MediaQuery.of(context).size.width,
              height: 300,
              theme: KeyboardThemeModel(
                mainKeyTheme: KeyThemeModel(),
                flickSelectedKeyTheme: KeyThemeModel(
                  backgroundColor: 0xFFFFCC80,
                ),
                flickUnselectedKeyTheme: KeyThemeModel(
                  backgroundColor: 0xFF616161,
                ),
                nextAndBackKeyTheme: KeyThemeModel(
                  backgroundColor: 0xFF9E9E9E,
                  iconSize: 24,
                  fontSize: 14,
                ),
                extraKeyTheme: KeyThemeModel(backgroundColor: 0xFF9E9E9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
