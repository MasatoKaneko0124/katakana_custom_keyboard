import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katakana_custom_keyboard/katakana_custom_keyboard_with_timer.dart';

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
            KatakanaCustomKeyboardWithTimer(
              onKanaInput: (input) => _setLabel(input ?? "null"),
              onDeleteKeyTapped: () => _setLabel("削除"),
              onDiacriticKeyTapped: null,
              onNextKeyTapped: () => _setLabel("次へ"),
              onBackKeyTapped: () => _setLabel("前へ"),
              onSettingKeyTapped: () => _setLabel("設定"),
              onOptionalKeyTapped: () => _setLabel("オプションキー"),
              optionalKeyChild: Icon(Icons.search, color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
