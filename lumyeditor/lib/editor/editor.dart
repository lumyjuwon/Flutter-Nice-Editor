import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lumyeditor/editor/toolbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Editor extends StatefulWidget {
  Editor() : super();

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Toolbar(_controller),
          Expanded(
            child: WebView(
              initialUrl: '',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
                _loadHtmlFromAssets();
              },
            ),
          )
        ],
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/editor.html');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
