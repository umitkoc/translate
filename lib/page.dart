import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final _controller = new TextEditingController();
  final translator = GoogleTranslator();
  String texts = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Translate"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tr/En",
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              autofocus: true,
              maxLines: 5,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              maxLength: maxLengthOfTextField(_controller.text),
              decoration: InputDecoration(
                hintText: "Translate...",
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                translator.translate(_controller.text, to: "en").then((value) {
                  setState(() {
                    this.texts = value.text;
                    print(this.texts);
                  });
                });
              },
              child: Text("run"),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                this.texts,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      ),
    );
  }

  int maxLengthOfTextField(String text) {
    final int maxBits = 128;
    List<int> unicodeSymbols =
        text.codeUnits.where((ch) => ch > maxBits).toList();
    return unicodeSymbols.length > 0 ? 160 : 70;
  }
}
