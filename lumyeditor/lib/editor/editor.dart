import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lumyeditor/editor/content/content.dart';
import 'package:lumyeditor/editor/toolbar/toolbar.dart';

class Editor extends StatefulWidget {
  Editor() : super();

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> with WidgetsBindingObserver {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Toolbar(flutterWebviewPlugin),
          Expanded(child: Content()),
        ],
      ),
    );
  }
}
