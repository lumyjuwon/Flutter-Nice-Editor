import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lumyeditor/editor/content/content.dart';
import 'package:lumyeditor/editor/toolbar/selection_info.dart';
import 'package:lumyeditor/editor/toolbar/toolbar.dart';

enum Position{
  Top,
  Bottom
}

const Map<String,String> mockData = 
  {
    'id': '001',
    'image': 'http://placehold.it/45x45?text=test',
  };


class Editor extends StatefulWidget {
  // Toolbar
  final Position position;
  final  test;

  const Editor({this.position = Position.Top, this.test}) : super();

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> with WidgetsBindingObserver {
  final FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
  final ValueNotifier<SelectionInfo> selectionListener = new ValueNotifier(new SelectionInfo(''));

  @override
  Widget build(BuildContext context) {
    if(widget.position == Position.Top){
      return Scaffold(
        body: Column(
          children: <Widget>[
            Toolbar(
              webviewPlugin: flutterWebviewPlugin,
              selectionListener: selectionListener,
            ),
            Expanded(
                child: Content(
              webviewPlugin: flutterWebviewPlugin,
              selectionListener: selectionListener,
            )),
          ],
        ),
      );
    }
    else{
      return Scaffold(
        body: Column(
          children: <Widget>[
            Content(
              webviewPlugin: flutterWebviewPlugin,
              selectionListener: selectionListener,
            ),
            Expanded(
                child: Toolbar(
              webviewPlugin: flutterWebviewPlugin,
              selectionListener: selectionListener,
            ),),
          ],
        ),
      );
    }
  }
}
